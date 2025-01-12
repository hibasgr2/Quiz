<?php

namespace App\Controller;

use App\Repository\CoursesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
        return $this->render('etudiant/quizQuestion.html.twig', ["courses" => $courses]);
    }
    #[Route("/note-etudiant",name:"acceuil.note",methods:["POST","GET"])]
    public function traitementNote(Request $request,CoursesRepository $course) : Response{
        $note = 0;
        $reponses = $request->request->all();
        dd($reponses["reponse_Qu'est-ce_que_SQL_?"]);
        $idCourse = $reponses["id_course"];
        $courses = $course->findByIdCourse($idCourse);
        //dd($courses[0]["reponses"]);
        //dd($courses);
        //dd($reponses[$courses[0]["reponse_vrai"]] );
        // $i=0;
        // do {
        //    $note++;
        //    $i++;
        // } while ($i <= 10);
        for($i = 0 ; $i < count($courses) ; $i++){
            dd($reponses["reponse_Quelle_est_la_syntaxe_pour_une_fonction_en_C++_?"]);
            // if($courses[$i]["reponse_vrai"] == $reponses[$courses[$i]["reponses"][$i]]){
            //     $note += 2;
            // }
            // $reps = $reponses["reponse_2"];
        }
        // foreach($reponses as $r){
        //     dd($r);
        // }
        return $this->render('etudiant/interfaceNote.html.twig', ["rep" => $reponses,"note"=>$note]);
    }
    
}
