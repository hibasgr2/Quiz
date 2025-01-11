<?php

namespace App\Controller;

use App\Repository\CoursesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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
        // dd($courses);
        return $this->render('etudiant/quizQuestion.html.twig', ["courses" => $courses]);
    }
    #[Route("/note-etudiant",name:"acceuil.note")]
    public function traitementNote(Request $request){
        dd($request);
        return $this->render("etudiant/interfaceNote.html.twig");
    }
    
}
