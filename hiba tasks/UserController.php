<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
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
        return $this->render('user/index.html.twig', [
            'users' => $userRepository->findBy(['role' => 'Etudiant']),
        ]);
    }

    #[Route('/new', name: 'app_user_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository,UserPasswordHasherInterface $hasher): Response
{
    $user = new User();
    $form = $this->createForm(UserType::class, $user);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        // On vérifie si l'utilisateur existe déjà
        $existingUser = $userRepository->findOneBy(['matricule' => $user->getMatricule()]);

        if ($existingUser) {
            // Si l'utilisateur existe déjà, on affiche un message d'erreur
            $this->addFlash('error', 'Un utilisateur avec cette matricule existe déjà.');

            return $this->redirectToRoute('app_user_new');  
        }
       
        //Sinon on enregistre l'utilisateur
        $user->setPassword($hasher->hashPassword($user, $user->getPassword()));
        $entityManager->persist($user);
        $entityManager->flush();

        return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->render('user/new.html.twig', [
        'user' => $user,
        'form' => $form,
    ]);
}

    #[Route('/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show(User $user): Response
    {
        return $this->render('user/show.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user,UserRepository $userRepository, EntityManagerInterface $entityManager,UserPasswordHasherInterface $hasher): Response
    {
        $form = $this->createForm(UserType::class, $user);
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
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(UserPasswordHasherInterface $passwordHasher, Request $request, User $user, EntityManagerInterface $entityManager): Response
{
    if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->getPayload()->getString('_token'))) {
/*         if (!$passwordHasher->isPasswordValid($user, $request->request->get('password'))) {
            throw new AccessDeniedHttpException();
        } */
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
