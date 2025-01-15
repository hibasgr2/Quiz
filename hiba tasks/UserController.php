<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Note;
use App\Entity\Courses;
use App\Form\RegisterFormType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;



#[Route('/user')]
final class UserController extends AbstractController
{
    #[Route(name: 'app_user_index', methods: ['GET'])]
    public function index(UserRepository $userRepository): Response
    {
        $user = $this->getUser(); // Récupérez l'utilisateur connecté

        return $this->render('user/index.html.twig', [
            'users' => $userRepository->findAll(),
            'admin' => $user,
            ]);
    }


    #[Route('/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show(User $user, EntityManagerInterface $manager): Response
    {
        $notes = $manager->getRepository(Note::class)->findBy(['user' =>$user]);
    
        return $this->render('user/show.html.twig', [
            'user' => $user,
            'notes' => $notes,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user,UserRepository $userRepository, EntityManagerInterface $entityManager,UserPasswordHasherInterface $hasher): Response
    {
        $form = $this->createForm(RegisterFormType::class, $user);
        $form->handleRequest($request);

        $existingUser = $userRepository->findOneBy(['matricule' => $user->getMatricule()]);

        if ($form->isSubmitted() && $form->isValid() ) {
            if ($existingUser && $existingUser !== $user) {

                $this->addFlash('error', 'Un utilisateur avec cette matricule existe déjà.');

                return $this->redirectToRoute('app_user_edit', ['id' => $user->getId()]);  
            }

            $user->setPassword($hasher->hashPassword($user, $user->getPassword()));
            $entityManager->flush();
             $this->addFlash('success', 'L\'utilisateur a été modifier avec succès.');
            return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('user/edit.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(UserPasswordHasherInterface $passwordHasher, Request $request, User $user, EntityManagerInterface $entityManager): Response
{
    if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->getPayload()->getString('_token'))) {

        $entityManager->remove($user);
        $entityManager->flush();

        // Ajout d'un message flash en cas de succès
        $this->addFlash('success', 'L\'utilisateur a été supprimé avec succès.');
    } else {
        // Ajout d'un message flash en cas d'échec
        $this->addFlash('error', 'Le token CSRF est invalide. La suppression a échoué.');
    }

    // Redirection vers la liste des utilisateurs
    return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
}

}
