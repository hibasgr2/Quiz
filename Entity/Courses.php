<?php

namespace App\Entity;

use App\Repository\CoursesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CoursesRepository::class)]
class Courses
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $nom = null;

    #[ORM\OneToMany(mappedBy: 'course', targetEntity: Questions::class, orphanRemoval: true)]
    private Collection $questions;

    #[ORM\OneToMany(mappedBy: 'course', targetEntity: Note::class, orphanRemoval: true)]
    private Collection $Course;

    public function __construct()
    {
        $this->questions = new ArrayCollection();
        $this->Course = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * @return Collection<int, Questions>
     */
    public function getQuestions(): Collection
    {
        return $this->questions;
    }

    public function addQuestion(Questions $question): static
    {
        if (!$this->questions->contains($question)) {
            $this->questions->add($question);
            $question->setCourse($this);
        }

        return $this;
    }

    public function removeQuestion(Questions $question): static
    {
        if ($this->questions->removeElement($question)) {
            // set the owning side to null (unless already changed)
            if ($question->getCourse() === $this) {
                $question->setCourse(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Note>
     */
    public function getCourse(): Collection
    {
        return $this->Course;
    }

    public function addCourse(Note $course): static
    {
        if (!$this->Course->contains($course)) {
            $this->Course->add($course);
            $course->setCourse($this);
        }

        return $this;
    }

    public function removeCourse(Note $course): static
    {
        if ($this->Course->removeElement($course)) {
            // set the owning side to null (unless already changed)
            if ($course->getCourse() === $this) {
                $course->setCourse(null);
            }
        }

        return $this;
    }
}
