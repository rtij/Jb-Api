<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Authtoken;
use App\Entity\Depotu;
use App\Entity\Detlivrable;
use App\Entity\Equipe;
use App\Entity\Histoe;
use App\Entity\Livrables;
use App\Entity\Participation;
use App\Entity\Ramassage;
use App\Entity\Stocke;
use App\Entity\Tri;
use App\Entity\Tsena;
use App\Entity\Users;
use App\Repository\AuthTokenRepository;
use App\Repository\DepotuRepository;
use App\Repository\LivrablesRepository;
use App\Repository\MvtRepository;
use App\Repository\ParticipationRepository;
use App\Repository\RamassageRepository;
use App\Repository\StockeRepository;
use App\Repository\TriRepository;
use App\Repository\TsenaRepository;
use App\Repository\TypeURepository;
use App\Repository\UsersRepository;
use App\Repository\VilleIRepository;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 *  @Route("/api", name="api")
 */


class UsersController extends AbstractController
{

    /**
     * @Route("/users/user", name="GetUsers", methods={"GET"})
     */
    public function getMyUser(Request $request, AuthTokenRepository $authTokenRepository)
    {
        $token = $authTokenRepository->findOneByToken(hash("sha256", $request->headers->get('X-Auth-Token')));
        $user = $token->getCodeu();
        return $this->json(['data' => $user], 200);
    }

    /**
     * @Route("/users/stocke/liste/{idequipe}", name="UserStockEquipeListe", methods={"GET"} )
     */
    public function getStockEquipeListe(Equipe $equipe, StockeRepository $stockeRepository)
    {
        return $this->json(['data' => $stockeRepository->findByIdequipe($equipe)]);
    }

    /**
     * @Route("/users/tsena/create", name="CreateTsena", methods={"POST"})
     */
    public function CreateTsena(Request $request, TsenaRepository $tsenaRepository, VilleIRepository $villeIRepository)
    {
        $donnes = json_decode($request->getContent());
        $tsena = new Tsena();
        $tsena->setAdrt($donnes->data->adrt);
        $tsena->setLocalite($donnes->data->localite);
        $tsena->setReperage($donnes->data->reperage);
        $tsena->setNiveau($donnes->data->niveau);
        $tsena->setFaritany($donnes->data->faritany);
        $tsena->setAdrt($donnes->data->adrt);
        $tsena->setTel1($donnes->data->tel1);
        $tsena->setTel2($donnes->data->tel2);
        $tsena->setTel3($donnes->data->tel3);
        if($donnes->data->datef){
            $tsena->setDatef(new DateTime($donnes->data->datef));
        }
        
        if($donnes->data->hfermeture){
            $tsena->setHfermeture(new DateTime($donnes->data->hfermeture));
        }
        if($donnes->data->houverture){
            $tsena->setHouverture(new DateTime($donnes->data->houverture));
        }
        $tsena->setAdrt2($donnes->data->adrt2);
        $tsena->setJourf($donnes->data->jourf);
        $tsena->setResponsable($donnes->data->responsable);
        $tsena->setOuvert($donnes->data->ouvert);
        $tsena->setType($donnes->data->type);
        $tsena->setZone($donnes->data->zone);
        if ($donnes->data->idville) {
            $tsena->setIdville($villeIRepository->findOneByIdvillei($donnes->data->idville->idvillei));
        }
        $tsena->setQuartierv($donnes->data->quartierv);
        $tsena->setNomt($donnes->data->nomt);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($tsena);
        $sauv->flush();
        $last = $tsenaRepository->getlast();
        return $this->json(['data' => $tsenaRepository->findOneByCodet($last[0][1])]);
    }

    /**
     * @Route("/users/tsena/liste", name="GetTsenaListe", methods={"GET"})
     */
    public function GetTsenaListe(TsenaRepository $tsenaRepository)
    {
        return $this->json(['data' => $tsenaRepository->findAll()]);
    }


    /**
     * @Route("/users/depot/create", name="CreateDepo", methods={"POST"})
     */
    public function CreateDepot(Request $request, DepotuRepository $depotuRepository, TsenaRepository $tsenaRepository, UsersRepository $usersRepository)
    {
        $donnes = json_decode($request->getContent());
        $depot = new Depotu();
        $depot->setHeured(new DateTime($donnes->data->heured));
        $depot->setDated(new DateTime($donnes->data->dated));
        $depot->setNbaff($donnes->data->nbaff);
        $depot->setNbenv($donnes->data->nbenv);
        $depot->setNumu($donnes->data->numu);
        $depot->setIsany($donnes->data->isany);
        $depot->setPlace($donnes->data->place);
        $depot->setAction($donnes->data->action);
        $depot->setCodet($tsenaRepository->findOneByCodet($donnes->data->codet->codet));
        $depot->setCodeu($usersRepository->findOneByCodeu($donnes->data->codeu->codeu));
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($depot);
        $sauv->flush();
        return $this->json(['data' => $depotuRepository->findAll()]);
    }


    /**
     * @Route("/users/stock/update/{idstocke}", name="UpdateUsersStock", methods={"POST"})
     */
    public function UpdateUsersStock(Users $users, Stocke $stock, Request $request, StockeRepository $stockeRepository)
    {
        $donnes = json_decode($request->getContent());
        $qte = $stock->getQte() - $donnes->data;
        $stock->setQte($qte);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($stock);
        $sauv->flush();
        return $this->json(['data' => $stockeRepository->findByIdequipe($users->getIdequipe())]);
    }


    /**
     * @Route("/users/ramassage/create", name="SaveRamassage", methods={"POST"})
     */
    public function SaveRamassage(Request $request, UsersRepository $usersRepository, DepotuRepository $depotuRepository)
    {
        $donnes = json_decode($request->getContent());
        $ramassage = new Ramassage();
        $depot = $depotuRepository->findOneByIddep($donnes->data->iddep->iddep);
        $ramassage->setAction($donnes->data->action);
        $ramassage->setIddep($depot);
        $ramassage->setDater(new DateTime($donnes->data->dater));
        $users = $usersRepository->findOneByCodeu($donnes->data->codeu->codeu);
        $ramassage->setCodeu($users);
        $ramassage->setCodet($depot->getCodet());
        $ramassage->setRamassagea($donnes->data->ramassagea);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($ramassage);
        $sauv->flush();
        return $this->json(['data' => "ok"]);
    }

    /**
     * @Route("/users/tsena/depot/{codet}", name="GetLastDepotTsena", methods={"GET"})
     */
    public function getLastDepotTsena(DepotuRepository $depotuRepository, Tsena $tsena)
    {
        $last = $depotuRepository->getLastDepotTsena($tsena);
        return $this->json(['data' => $depotuRepository->findOneByIddep($last[0][1])]);
    }


    /**
     * @Route("/users/ramassage/depot/{iddep}", name="ListLastRamassage", methods={"GET"})
     */
    public function getListLastRamassage(RamassageRepository $ramassageRepository, Depotu $depotu)
    {
        $last = $ramassageRepository->getlast($depotu);
        return $this->json(['data' => $ramassageRepository->findByIdramassage($last[0][1])]);
    }

    /**
     * @Route("/users/appro/liste/{codeu}", name="getUserApproListe", methods={"GEt"})
     */
    public function getUserAppro(Users $user, MvtRepository $mvtRepository, UsersRepository $usersRepository)
    {
        $team = $usersRepository->findByIdequipe($user->getIdequipe());
        $result = [];
        foreach ($team as $u) {
            $mvt = $mvtRepository->getApproUser(new DateTime('now'), $u);
            foreach ($mvt as $m) {
                array_push($result, $m);
            }
        }
        return $this->json(['data' => $result]);
    }

    /**
     * @Route("/users/participation/liste", name="ParticipationListe", methods={"GET"})
     */
    public function ParticipationListe(ParticipationRepository $participationRepository)
    {
        return $this->json(['data' => $participationRepository->findAll()]);
    }

    /**
     * @Route("/users/tri/create/{codeu}", name="CreateTri", methods={"POST"})
     */
    public function CreateTtri(Request $request, Users $user, TriRepository $triRepository)
    {
        $donnes = json_decode($request->getContent());
        $env = $triRepository->findOneByNumenv($donnes->data->numenv);
        if ($env) {
            return $this->json(['data' => "Numero enveloppe déjà enregistrer"]);
        }
        $Tri = new Tri();
        $Tri->setDatetri(new DateTime($donnes->data->datetri));
        $Tri->setFaritany($donnes->data->faritany);
        $Tri->setNomprenom($donnes->data->nomprenom);

        $Tri->setTotal($donnes->data->total);
        $Tri->setNboe($donnes->data->nboe);
        $Tri->setNbpp($donnes->data->nbpp);
        $Tri->setNbps($donnes->data->nbps);
        $Tri->setNbvi($donnes->data->nbvi);
        $Tri->setFeno($donnes->data->feno);
        $Tri->setValide($donnes->data->valide);
        $Tri->setAction($donnes->data->action);
        $Tri->setNumenv($donnes->data->numenv);
        $Tri->setMotifinv($donnes->data->motifinv);
        $Tri->setCodeu($user);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($Tri);
        $sauv->flush();
        return $this->json(['data' => 'ok']);
    }

    /**
     * @Route("/users/participation/create/{codeu}", name="CreateParticipation", methods={"POST"})
     */
    public function CreateParticipation(Request $request, Users $users, ParticipationRepository $participationRepository)
    {
        $donnes = json_decode($request->getContent());
        $participation = new Participation();
        $participation->setDates(new DateTime($donnes->data->dates));
        $participation->setNomp($donnes->data->nomp);
        $participation->setFaritany($donnes->data->faritany);
        $participation->setNumenv($donnes->data->numenv);
        $participation->setTelorange($donnes->data->telorange);
        $participation->setAdrp($donnes->data->adrp);
        $participation->setNbp(1);
        $participation->setCodeu($users);
        $participation->setTeltelma($donnes->data->teltelma);
        $participation->setTelairtel($donnes->data->telairtel);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($participation);
        $sauv->flush();
        return $this->json(['data' => $participationRepository->findAll()]);
    }


    /**
     * @Route("/users/participation/update/{idparticipation}", name="UpdateParticipation", methods={"GET"})
     */
    public function updateParticipation(Request $request, Participation $participation, ParticipationRepository $participationRepository)
    {
        $participation->setNbp($participation->getNbp() + 1);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($participation);
        $sauv->flush();
        return $this->json(['data' => $participationRepository->findAll()]);
    }

    /**
     * @Route("/users/livrables/create/{codeu}", name="CreateLivrable", methods={"POST"})
     */
    public function createLivrables(Request $request, Users $users, LivrablesRepository $livrablesRepository)
    {
        $donnes = json_decode($request->getContent());
        $livrables = new Livrables();
        $livrables->setDatea(new DateTime($donnes->data->datea));
        $livrables->setCodeu($users);
        $livrables->setNumu($donnes->data->numu);
        $livrables->setContact($donnes->data->contact);
        $livrables->setEnvu($donnes->data->envu);
        $livrables->setSemainec($donnes->data->semainec);
        $livrables->setTypel($donnes->data->typel);
        $livrables->setNombrea($donnes->data->nombrea);
        $livrables->setRecettej($donnes->data->recettej);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($livrables);
        $sauv->flush();
        $last = $livrablesRepository->getLast();
        return $this->json(['data' => $livrablesRepository->findOneByIdlivrables($last[0][1])]);
    }

    /**
     * @Route("/users/historique/create/{idstocke}", name="SaveHistoriqueEquipe", methods={"POST"})
     */
    public function savehistoEquipe(Request $request, Stocke $stocke)
    {
        $donnes = json_decode($request->getContent());
        $histoe = new Histoe();
        $histoe->setAppro($donnes->data->appro);
        $histoe->setDateh(new DateTime($donnes->data->daeh));
        $histoe->setVente($donnes->data->vente);
        $histoe->setQter($stocke->getQte());
        $histoe->setIdstocke($stocke);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($histoe);
        $sauv->flush();
        return $this->json(['data' => 'ok']);
    }


    /**
     * @Route("/users/detlivrables/create/{idlivrables}", name="SaveDetLivrable", methods={"POST"})
     */
    public function saveDetLivrables(Livrables $livrables, Request $request, StockeRepository $stockeRepository)
    {
        $donnes = json_decode($request->getContent());
        $detlivrables = new Detlivrable();
        $detlivrables->setIdlivrables($livrables);
        $detlivrables->setT($donnes->data->t);
        $stocke = $stockeRepository->findOneByIdstocke($donnes->data->idstocke->idstocke);
        // Update stock equipe qte
        $stocke->setQte($stocke->getQte() - $donnes->data->sortie);
        $detlivrables->setSortie($donnes->data->sortie);
        $detlivrables->setIdstocke($stocke);
        $detlivrables->setPrix($donnes->data->prix);
        // Save histoe
        $histoe = new Histoe();
        $histoe->setDateh($livrables->getDatea());
        $histoe->setQter($stocke->getQte());
        $histoe->setVente($donnes->data->sortie);
        $histoe->setIdstocke($stocke);
        $histoe->setAppro(0);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($detlivrables);
        $sauv->flush();
        $sauv->persist($livrables);
        $sauv->flush();
        $sauv->persist($stocke);
        $sauv->flush();
        return $this->json(['data' => "ok"]);
    }
}
