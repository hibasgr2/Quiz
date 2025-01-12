<?php

namespace App\Repository;

use App\Entity\Courses;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @extends ServiceEntityRepository<Courses>
 *
 * @method Courses|null find($id, $lockMode = null, $lockVersion = null)
 * @method Courses|null findOneBy(array $criteria, array $orderBy = null)
 * @method Courses[]    findAll()
 * @method Courses[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CoursesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Courses::class);
    }

//    /**
//     * @return Courses[] Returns an array of Courses objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Courses
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
public function findByIdCourse($id) {
    // $entityManager = $this->getEntityManager()->getConnection();
    // $sql = 'select DISTINCT(q.question) , r.reponse from questions q
    //     join reponse r on r.question_id = q.id
    //     join courses c on c.id = q.course_id
    //     where c.id = :id';
    // $stmt = $entityManager->executeQuery($sql,['id' => $id]);
    // return $stmt->fetchAllAssociative();
    $course = $this->getEntityManager()
        ->getRepository(Courses::class)
        ->find($id);
    $result = [];
    foreach ($course->getQuestions() as $question) {
        $reponses = [];
        foreach ($question->getReponse() as $reponse) {
            $reponses[] = $reponse->getReponse();
        }

        $result[] = [
            'course_id' => $course->getId(),
            'question_id' => $question->getId(),
            'question' => $question->getQuestion(),
            'reponses' => $reponses,
            'reponse_vrai' => $question->getReponseVrai()
        ];
    }
    return $result;
}
}
