<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RegisterFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
            $builder
            ->add('matricule', TextType::class,[
                'attr'=>[
                    'class'=>'form-control'
                ],
                'label'=>'Matricule :',
                'label_attr'=>[
                    'class'=>'form-label'
                ]
            ])
            ->add('nomComplet', TextType::class,[
                'attr'=>[
                    'class'=>'form-control'
                ],
                'label'=>'Nom Complet :',
                'label_attr'=>[
                    'class'=>'form-label'
                ]
            ])

            ->add('email',EmailType::class,[
                'attr'=>[
                    'class'=>'form-control'
                ],
                'label'=>'Email :'
            ])
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'first_options' => [
                    'attr' => [
                        'class' => 'form-control',
                    ],
                    'label' => 'Password :',
                    'label_attr' => [
                        'class' => 'form-label',
                    ],
                ],
                'second_options' => [
                    'attr' => [
                        'class' => 'form-control',
                    ],
                    'label' => 'Confirm Password :',
                    'label_attr' => [
                        'class' => 'form-label',
                    ],
                ],
            ])
            ->add('submit',SubmitType::class,[
                'attr'=>[
                    'class'=>'btn btn-success'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
