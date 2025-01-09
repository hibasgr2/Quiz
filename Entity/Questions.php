<?php

namespace App\Entity;

use App\Repository\QuestionsRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: QuestionsRepository::class)]
class Questions
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'questions')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Courses $course = null;

    #[ORM\Column(length: 255)]
    private ?string $Reponse_vrai = null;

    #[ORM\Column(length: 255)]
    private ?string $Question = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCourse(): ?Courses
    {
        return $this->course;
    }

    public function setCourse(?Courses $course): static
    {
        $this->course = $course;

        return $this;
    }

    public function getReponseVrai(): ?string
    {
        return $this->Reponse_vrai;
    }

    public function setReponseVrai(string $Reponse_vrai): static
    {
        $this->Reponse_vrai = $Reponse_vrai;

        return $this;
    }

    public function getQuestion(): ?string
    {
        return $this->Question;
    }

    public function setQuestion(string $Question): static
    {
        $this->Question = $Question;

        return $this;
    }
}
