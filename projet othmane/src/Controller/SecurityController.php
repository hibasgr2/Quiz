<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;


use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class SecurityController extends AbstractController
{
    #[Route('/connexion', name: 'security.login',methods:["GET","POST"])]
    public function login(): Response
    {
        return $this->render('pages/security/login.html.twig');
    }
    #[Route('/logout', name: 'security.logout',methods:["GET","POST"])]
    public function logout(): Response
    {
    }
    #[Route('/register', name: 'security.register',methods:["GET","POST"])]
    public function registration(Request $request,EntityManagerInterface $manager,UserPasswordHasherInterface $passwordHasher): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterFormType::class,$user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) { 
            $user = $form->getData();
            $hashedPassword = $passwordHasher->hashPassword(
                $user,
                $user->getPassword()
            );
            $user->setPassword($hashedPassword);
            $user->setRoles(['ROLE_USER']);
            $manager->persist($user);
            $manager->flush();
            $this->addFlash(
                'success',
                'Votre Compte a ete cree avec success'
            );
            return $this->redirectToRoute('security.register');
        }
        return $this->render('pages/security/registration.html.twig',[
            "form"=>$form->createView(),
        ]);
    }
    #[Route('/use', name: 'security.user',methods:["GET","POST"])]
    public function user(MailerInterface $mailer): Response
    {
        //dd($this->getUser());
        $email = (new Email())
            ->from('fari9nahnohona@example.com')
            ->to($this->getUser()->getEmail())
            ->subject('Hiba Salma Othmane wa3rin tbarkellah elihom')
            ->html('<p>Bonjour'.$this->getUser()->getEmail().'</p>');

        $mailer->send($email);
        return $this->render('pages/security/hh.html.twig');
    }
}
