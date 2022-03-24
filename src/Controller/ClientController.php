<?php

namespace App\Controller;

use App\Entity\Authtoken;
use App\Entity\Users;
use App\Repository\AuthTokenRepository;
use App\Repository\DepotuRepository;
use App\Repository\DetLivrablesRepository;
use App\Repository\LivrablesRepository;
use App\Repository\ParticipationRepository;
use App\Repository\RamassageRepository;
use App\Repository\TriRepository;
use App\Repository\TypeURepository;
use App\Repository\UsersRepository;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 *  @Route("/api/client", name="ClientApi")
 */


class ClientController extends AbstractController
{

    /**
     * @Route("/depotu/liste", name="ClientDepotuListe", methods={"GET"})
     */
    public function GetDepotListe(DepotuRepository $depotuRepository)
    {
        return $this->json(['data' => $depotuRepository->getByIdDesc()]);
    }

    /**
     * @Route("/ramassage/liste", name="ClientRamassageListe", methods={"GET"})
     */
    public function getRamassageListe(RamassageRepository $ramassageRepository)
    {
        return $this->json(['data' => $ramassageRepository->findAll()]);
    }

      /**
     * @Route("/participation/liste", name="ClientParticipationListe", methods={"GET"})
     */
    public function ParticipationListe(ParticipationRepository $participationRepository){
        return $this->json(['data'=>$participationRepository->getByNbpDesc()]);
    }
     /**
     * @Route("/tri/liste", name="ClientTriListe", methods={"GET"})
     */
    public function TriListe(TriRepository $triRepository){
        return $this->json(['data'=>$triRepository->findAll()]);
    }  

    /**
     * @Route("/livrables/liste", name="ClientLivrablesListe", methods={"GET"})
     */
    public function LivrablesList(LivrablesRepository $livrablesRepository){
        return $this->json(['data'=>$livrablesRepository->findAll()]);
    }
    
    /**
     * @Route("/detlivrable/liste", name="ClientDetLivrableListe", methods={"GET"})
     */
    public function DetLivrableListe(DetLivrablesRepository $detLivrablesRepository){
        return $this->json(['data'=>$detLivrablesRepository->findAll()]);
    }
}