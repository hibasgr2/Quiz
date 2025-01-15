<?php

namespace App\Controller;

use App\Entity\Note;
use App\Entity\Courses;
use App\Repository\CoursesRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;


class EtudiantController extends AbstractController
{
    #[Route('/courses', name: 'courses.acceuil')]
    public function index(CoursesRepository $course): Response
    {
        $courses = $course->findAll();

        return $this->render('etudiant/index.html.twig', ["courses"=>$courses]);
    }


    #[Route('/quiz/{id}', name: 'interface.quiz')]
    public function questionsCours(CoursesRepository $course, $id): Response
    {
        $courses = $course->findByIdCourse($id);
        return $this->render('etudiant/quizQuestion.html.twig', ["courses" => $courses]);
    }

    
    #[Route("/note-etudiant",name:"acceuil.note",methods:["POST","GET"])]
    public function traitementNote(Request $request,CoursesRepository $course,EntityManagerInterface $manager,MailerInterface $mailer) : Response{
        $note = 0;
        $etat = 'F';
        $reponsesavant = $request->request->all();
        $reponses = [];

        foreach ($reponsesavant as $question => $reponse) {

            $questionFormatee = str_replace('_', ' ', $question);
            $reponses[$questionFormatee] = $reponse;
           
        }
    

        $idCourse = $reponses["id course"];
        $courses = $course->findByIdCourse($idCourse);
        $matiere = $course->find($idCourse);


        for($i = 0 ; $i < count($courses) && $i < count($reponses) ; $i++){

            foreach ($reponses as $question => $reponse){
               
            if($courses[$i]["question"] == $question){
                if($courses[$i]["reponse_vrai"] == $reponse){
                 $note += 2;
                }
            }
            }
        }

        if($note>=10){$etat = 'A';}

        $email = (new Email())
        ->from('rahelothmane@gmail.com')
        ->to($this->getUser()->getEmail())
        ->subject('Quiz '.$matiere->getNom().' passé !!' )
        ->html('<p>Vous avez passe le quiz '.$matiere->getNom().' avec: 
        <br> Note: <strong>'.$note.'</strong>
        <br> Etat: <strong>'.$etat.'</strong> </p>');

        try {
            $mailer->send($email);
        } catch (TransportExceptionInterface $e) {
            $this->addFlash('error', 'Erreur lors de l\'envoi de l\'email : ' . $e->getMessage());
        }

    // Vérifier si une note existe déjà pour cet utilisateur et ce cours
    $user = $this->getUser();
    $existingNote = $manager->getRepository(Note::class)->findOneBy(['user' => $user, 'course' => $matiere]);

    if ($existingNote) {
        // Mettre à jour les valeurs existantes
        $existingNote->setNote($note);

        $existingNote->setEtat($etat);

        $manager->persist($existingNote);
    } else {
        $noteEtudiant = new Note();

        $noteEtudiant->setCourse($matiere); 
       
        $noteEtudiant->setUser($this->getUser());

        $noteEtudiant->setNote($note);

        $noteEtudiant->setEtat($etat);

        $manager->persist($noteEtudiant);
    }

   

    $manager->flush();

        return $this->render('etudiant/interfaceNote.html.twig', [
        "rep" => $reponses,
        "note"=>$note,
        "etat" => $etat,
        "courses" => $courses]);
    }
    

    #[Route("/profile", name: "etudiant.profile", methods: ["GET"])]
    public function profile(EntityManagerInterface $manager): Response
    {
    $user = $this->getUser(); // Récupérez l'utilisateur connecté

    if (!$user) {
        throw $this->createAccessDeniedException('You must be logged in to access this page.');
    }

    // Récupérez les détails de l'étudiant et les quiz passés
    $notes = $manager->getRepository(Note::class)->findBy(['user' => $user]);

    return $this->render('etudiant/profile.html.twig', [
        'user' => $user,
        'notes' => $notes,
    ]);
}


/* #[Route('/email')]
public function sendEmail(MailerInterface $mailer): Response
{
    $email = (new Email())
        ->from('saghirheba2@gmail.com')
        ->to('saghirheba2@gmail.com')
        //->cc('cc@example.com')
        //->bcc('bcc@example.com')
        //->replyTo('fabien@example.com')
        //->priority(Email::PRIORITY_HIGH)
        ->subject('Time for Symfony Mailer!')
        ->text('Sending emails is fun again!')
        ->html('<p>See Twig integration for better HTML integration!</p>');

    $mailer->send($email);

    return $this->render('pages/security/hh.html.twig');
} */
}

