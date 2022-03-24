<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Contacts;
use App\Entity\Detmvt;
use App\Entity\Equipe;
use App\Entity\Histoe;
use App\Entity\Histostock;
use App\Entity\Mvt;
use App\Entity\Stocke;
use App\Entity\Users;
use App\Entity\Villei;
use App\Repository\ArticleRepository;
use App\Repository\AuthTokenRepository;
use App\Repository\DepotuRepository;
use App\Repository\DetLivrablesRepository;
use App\Repository\DetmvtRepository;
use App\Repository\EquipeRepository;
use App\Repository\HistoeRepository;
use App\Repository\HistostockRepository;
use App\Repository\LivrablesRepository;
use App\Repository\MvtRepository;
use App\Repository\ParticipationRepository;
use App\Repository\RamassageRepository;
use App\Repository\StockeRepository;
use App\Repository\TriRepository;
use App\Repository\TypeURepository;
use App\Repository\UsersRepository;
use App\Repository\VilleIRepository;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Encoder\EncoderInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoder;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 *  @Route("/api", name="api")
 */


class AdminController extends AbstractController
{

    /**
     * @Route("/admin/user/Type", name="TypeListe", methods={"GET"})
     */
    public function getUserType(TypeURepository $typeURepository)
    {
        return $this->json(['data' => $typeURepository->findAll()]);
    }

    /**
     * @Route("/admin/user", name="GetUser", methods={"GET"})
     */
    public function getMyUser(Request $request, AuthTokenRepository $authTokenRepository)
    {
        $token = $authTokenRepository->findOneByToken(hash("sha256", $request->headers->get('X-Auth-Token')));
        $user = $token->getCodeu();
        return $this->json(['data' => $user], 200);
    }

    /**
     * @Route("/admin/user/new",  name="CreateUser", methods={"POST"})
     */
    public function CreateUsers(Request $request, EquipeRepository $equipeRepository, TypeURepository $typeURepository, UsersRepository $usersRepository, UserPasswordEncoderInterface $encoder)
    {
        $donnes = json_decode($request->getContent());
        $user  = new Users();
        $password = $encoder->encodePassword($user, $donnes->data->password);
        $user->setPassword($password);
        $user->setNomu($donnes->data->nomu);
        $user->setTelAirtel($donnes->data->telAirtel);
        $user->setTelOrange($donnes->data->telOrange);
        $user->setTelTelma($donnes->data->telTelma);
        $user->setIssup(false);
        $user->setIdtypeu($typeURepository->findOneByIdtypeu($donnes->data->idtypeu->idtypeu));
        if ($donnes->data->idequipe) {
            $user->setIdequipe($equipeRepository->findOneByIdequipe($donnes->data->idequipe->idequipe));
        } else {
            $user->setIdequipe(null);
        }
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($user);
        $sauv->flush();
        $last = $usersRepository->getLastUsers();
        return $this->json(['data' => $usersRepository->findByIssup(0)], 200);
    }
    /**
     * @Route("/admin/user/last", name="GetLastUser", methods={"GET"})
     */
    public function getLastuser(UsersRepository $usersRepository)
    {
        $last = $usersRepository->getLastuser();
        return $this->json(['data' => $usersRepository->findOneByCodeu($last[0][1])], 200);
    }
    /**
     * @Route("/admin/user/contacts/{codeu}", name="SaveUserContact" , methods={"POST"})
     */
    public function SaveUserContact(Request $request, Users $users, UsersRepository $usersRepository)
    {
        $donnes = json_decode($request->getContent());
        $contacts = new Contacts();
        $contacts->setContacts($donnes->data);
        $contacts->setCodeu($users);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($contacts);
        $sauv->flush();
        return $this->json(['data' => $usersRepository->findOneByCodeu($users->getCodeu())], 200, []);
    }

    /**
     * @Route("/admin/user/update/{codeu}", name="UpdateUser", methods={"PUT"})
     */
    public function UpdateUser(Users $user, Request $request, EquipeRepository $equipeRepository, TypeURepository $typeURepository, UsersRepository $usersRepository, UserPasswordEncoderInterface $encoder)
    {
        $donnes = json_decode($request->getContent());
        $password = $encoder->encodePassword($user, $donnes->data->password);
        $user->setPassword($password);
        $user->setNomu($donnes->data->nomu);
        $user->setTelAirtel($donnes->data->telAirtel);
        $user->setTelOrange($donnes->data->telOrange);
        $user->setTelTelma($donnes->data->telTelma);
        $user->setIssup($donnes->data->issup);
        $user->setIdtypeu($typeURepository->findOneByIdtypeu($donnes->data->idtypeu->idtypeu));
        if ($donnes->data->idequipe) {
            $user->setIdequipe($equipeRepository->findOneByIdequipe($donnes->data->idequipe->idequipe));
        } else {
            $user->setIdequipe(null);
        }
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($user);
        $sauv->flush();
        return $this->json(['data' => $usersRepository->findByIssup(0)], 200);
    }

    /**
     * @Route("/admin/user/contacts/remove/{idcontacts}", name="RemoveUserContact", methods={"DELETE"})
     */
    public function RemoveUserContacts(Contacts $contacts)
    {
        $sauv = $this->getDoctrine()->getManager();
        $sauv->remove($contacts);
        $sauv->flush();
        return $this->json(['data' => "ok"]);
    }

    /**
     * @Route("/admin/user/liste", name="GetUserListe", methods={"GET"})
     */
    public function getUserListe(UsersRepository $usersRepository)
    {
        return $this->json(['data' => $usersRepository->findByIssup(0)], 200);
    }

    /**
     * @Route("/admin/equipe/create",name="CreateEquipe", methods={"POST"})
     */
    public function createEquipe(Request $request, EquipeRepository $equipeRepository, VilleIRepository $villeiepository)
    {
        $donnes =  json_decode($request->getContent());
        $equipe = new Equipe();
        $equipe->setEquipe($donnes->data->Equipe->equipe);
        $equipe->setFaritany($donnes->data->Equipe->faritany);
        $equipe->setQuartierv($donnes->data->Equipe->quartierv);
        $equipe->setLocalite($donnes->data->Equipe->localite);
        if ($donnes->data->Equipe->idvillei) {
            $equipe->setIdvillei($villeiepository->findOneByIdvillei($donnes->data->Equipe->idvillei->idvillei));
        }
        $equipe->setZonea($donnes->data->Equipe->zonea);
        $equipe->setIssup(false);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($equipe);
        $sauv->flush();
        return $this->json(['data' => $equipeRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/equipe/liste", name="EquipeListe", methods={"GET"})
     */
    public function getEquipeListe(EquipeRepository $equipeRepository)
    {
        return $this->json(["data" => $equipeRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/equipe/update/{idequipe}", name="UpdateEquipe", methods={"PUT"})
     */
    public function UpdateEquipe(Request $request, Equipe $equipe, EquipeRepository $equipeRepository, VilleIRepository $villeiepository)
    {
        $donnes =  json_decode($request->getContent());
        $equipe->setEquipe($donnes->data->Equipe->equipe);
        $equipe->setFaritany($donnes->data->Equipe->faritany);
        $equipe->setQuartierv($donnes->data->Equipe->quartierv);
        $equipe->setLocalite($donnes->data->Equipe->localite);
        if ($donnes->data->Equipe->idvillei) {
            $equipe->setIdvillei($villeiepository->findOneByIdvillei($donnes->data->Equipe->idvillei->idvillei));
        } else {
            $equipe->setIdvillei(null);
        }
        $equipe->setZonea($donnes->data->Equipe->zonea);
        $equipe->setIssup($donnes->data->Equipe->issup);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($equipe);
        $sauv->flush();
        return $this->json($equipeRepository->findByIssup(0));
    }

    /**
     * @Route("/admin/villei/create", name="CreateVillei", methods={"POST"})
     */
    public function CreateVillei(Request $request, VilleiRepository $villeiepository)
    {
        $donnes =  json_decode($request->getContent());
        $villei = new Villei();
        $villei->setLibelle($donnes->data->libelle);
        $villei->setIssup(false);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($villei);
        $sauv->flush();
        return $this->json(["data" => $villeiepository->findByIssup(0)]);
    }
    /**
     * @Route("/admin/villei/update/{idvillei}", name="UpdateVilleI" , methods={"PUT"})
     */
    public function UpdateVillei(Villei $villei, Request $request, VilleIRepository $villeIRepository)
    {
        $donnes =  json_decode($request->getContent());
        $villei->setLibelle($donnes->data->Villei->libelle);
        $villei->setIssup($donnes->data->Villei->issup);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($villei);
        $sauv->flush();
        return $this->json(["data" => $villeIRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/villei/liste", name="VilleiListe", methods={"GET"})
     */
    public function VilleiListe(VilleIRepository $villeIRepository)
    {
        return $this->json(["data" => $villeIRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/article/create", name="CreateArticle", methods={"POST"})
     */
    public function createArticle(Request $request, ArticleRepository $articleRepository)
    {
        $donnes =  json_decode($request->getContent());
        $article = new Article();
        $article->setDesignation($donnes->data->designation);
        $article->setType($donnes->data->type);
        $article->setPrixu($donnes->data->prixu);
        $article->setQte(0);
        $article->setIssup(false);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($article);
        $sauv->flush();
        return $this->json(['data' => $articleRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/article/liste",name="ArticleListe", methods={"GET"})
     */
    public function getArticleListe(ArticleRepository $articleRepository)
    {
        return $this->json(['data' => $articleRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/article/update/{idarticle}",name="UpdateArticle", methods={"PUT"})
     */
    public function UpdateArticle(Request $request, Article $article, ArticleRepository $articleRepository)
    {
        $donnes =  json_decode($request->getContent());
        $article->setDesignation($donnes->data->designation);
        $article->setType($donnes->data->type);
        $article->setPrixu($donnes->data->prixu);
        $article->setIssup($donnes->data->issup);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($article);
        $sauv->flush();
        return $this->json(['data' => $articleRepository->findByIssup(0)]);
    }

    /**
     * @Route("/admin/mvt/create", name="CreateMvt", methods={"POST"})
     */
    public function CreateMvt(Request $request, MvtRepository $mvtRepository, UsersRepository $usersRepository)
    {
        $donnes =  json_decode($request->getContent());
        $mvt = new Mvt();
        $mvt->setAction($donnes->data->action);
        $mvt->setSource($donnes->data->source);
        $mvt->setLivreur($donnes->data->livreur);
        $mvt->setRefdoc($donnes->data->refdoc);
        $userS = $donnes->data->idsource;
        $userD = $donnes->data->iddestinataire;
        if ($userD) {
            $mvt->setIddestinataire($usersRepository->findOneByCodeu($donnes->data->iddestinataire->codeu));
        }
        if ($userS) {
            $mvt->setIdsource($usersRepository->findOneByCodeu($donnes->data->idsource->codeu));
        }
        $mvt->setDestinatairef($donnes->data->destinatairef);
        $mvt->setIddest($donnes->data->iddest);
        $mvt->setIdsourcef($donnes->data->idsourcef);
        $mvt->setDatem(new DateTime($donnes->data->datem));
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($mvt);
        $sauv->flush();
        $last = $mvtRepository->getlast();
        return $this->json(['data' => $mvtRepository->findOneByIdmvt($last[0][1])], 200, [],  ['groups' => "post:read"]);
    }

    /**
     * @Route("/admin/detmvt/create/{idmvt}", name="SaveDetMvt", methods={"POST"})
     */
    public function saveDetmvt(Request $request, Mvt $mvt, ArticleRepository $articleRepository)
    {
        $donnes =  json_decode($request->getContent());
        $detM = new Detmvt();
        $detM->setIdarticle($articleRepository->findOneByIdarticle($donnes->data->idarticle->idarticle));
        $detM->setQte($donnes->data->qte);
        $detM->setAretourner($donnes->data->aretourner);
        $detM->setUsages($donnes->data->usages);
        $detM->setCouleur($donnes->data->couleur);
        $detM->setOk(false);
        $detM->setIdmvt($mvt);
        if ($donnes->data->aretourner) {
            $detM->setDater(new DateTime($donnes->data->dater));
        }
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($detM);
        $sauv->flush();
        return $this->json(['data' => 'ok']);
    }

    /**
     * @Route("/admin/equipe/stock", name="UpdateEquipeStock", methods={"POST"})
     */
    public function UpdateEquipeStock(Request $request, ArticleRepository $articleRepository, StockeRepository $stockeRepository, EquipeRepository $equipeRepository)
    {
        $donnes =  json_decode($request->getContent());
        $equipe = $equipeRepository->findOneByIdequipe($donnes->data->idequipe->idequipe);
        $article = $articleRepository->findOneByIdarticle($donnes->data->idarticle->idarticle);
        $stocke = $stockeRepository->getByArticleAndEquipe($equipe, $article);
        if (!$stocke) {
            $stocke = new Stocke();
            $stocke->setQte($donnes->data->qte);
        } else {
            $qte = $stocke->getQte();
            $qte = $qte + $donnes->data->qte;
            $stocke->setQte($qte);
        }
        $stocke->setIdarticle($article);
        $stocke->setIdequipe($equipe);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($stocke);
        $sauv->flush();
        return $this->json(['data' => $stockeRepository->getByArticleAndEquipe($equipe, $article)]);
    }

    /**
     * @Route("/admin/stock/update/{idarticle}" ,name="UpdateStock", methods={"POST"})
     */
    public function UpdateStock(Request $request, Article $article)
    {
        $donnes =  json_decode($request->getContent());
        $qte = $article->getQte();
        $qte = $qte + $donnes->data;
        $article->setQte($qte);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($article);
        $sauv->flush();
        return $this->json(['data' => $article]);
    }

    /**
     * @Route("/admin/stock/historique", name="HistoriqueStock", methods={"POST"})
     */
    public function SaveHistoriqueStock(Request $request, ArticleRepository $articleRepository, UsersRepository $usersRepository)
    {
        $donnes =  json_decode($request->getContent());
        $histostock = new Histostock();
        $histostock->setDateh(new DateTime('now'));
        $article = $articleRepository->findOneByIdarticle($donnes->data->idarticle->idarticle);
        $histostock->setIdarticle($articleRepository->findOneByIdarticle($donnes->data->idarticle->idarticle));
        $histostock->setQtee($donnes->data->qtee);
        $histostock->setQtes($donnes->data->qtes);
        $histostock->setQter($article->getQte());
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($histostock);
        $sauv->flush();
        return $this->json(['data' => "ok"]);
    }

    /**
     * @Route("/admin/equipe/stock/liste", name="GetEquipeStockListe", methods={"GET"})
     */
    public function getEquipeStockListe(StockeRepository $stockeRepository)
    {
        return $this->json(['data' => $stockeRepository->findAll()]);
    }

    /**
     * @Route("/admin/equipe/histo/stock/create", name="SaveHistoStockEquipe", methods={"POST"})
     */
    public function SaveHistoStockEquipe(Request $request, StockeRepository $stockeRepository, HistoeRepository $histoeRepository)
    {
        $donnes =  json_decode($request->getContent());
        $histoe = new Histoe();
        $histoe->setDateh(new DateTime($donnes->data->dateh));
        $histoe->setIdstocke($stockeRepository->findOneByIdstocke($donnes->data->idstocke->idstocke));
        $histoe->setQter($donnes->data->qter);
        $histoe->setVente($donnes->data->vente);
        $histoe->setAppro($donnes->data->appro);
        $sauv = $this->getDoctrine()->getManager();
        $sauv->persist($histoe);
        $sauv->flush();
        return $this->json(['data' => $histoeRepository->getListeDesc()]);
    }


    /**
     * @Route("/admin/equipe/histo/stock/liste", name="HistoriqeStockEquipeliste", methods={"POST"})
     */
    public function getHistoStockEquipeListe(HistoeRepository $histoeRepository)
    {
        return $this->json(['data' => $histoeRepository->getListeDesc()]);
    }
    /**
     * @Route("/admin/detmvt/liste", name="GetDetailsMvtListe", methods={"GET"})
     */
    public function getDetmvtListe(DetmvtRepository $detmvtRepository, MvtRepository $mvtRepository)
    {
        return $this->json(['data' => $detmvtRepository->FindIddetDesc()]);
    }

    /**
     * @Route("/admin/historique/stock/liste", name="GetHistoriqueStockliste", methods={"GET"})
     */
    public function getHistoriqueStockListe(HistostockRepository $histostockRepository)
    {
        return $this->json(['data' => $histostockRepository->GetByIdDesc()]);
    }

    // Etats

    /**
     * @Route("/admin/depotu/liste", name="DepotuListe", methods={"GET"})
     */
    public function GetDepotListe(DepotuRepository $depotuRepository)
    {
        return $this->json(['data' => $depotuRepository->getByIdDesc()]);
    }

    /**
     * @Route("/admin/ramassage/liste", name="RamassageListe", methods={"GET"})
     */
    public function getRamassageListe(RamassageRepository $ramassageRepository)
    {
        return $this->json(['data' => $ramassageRepository->findAll()]);
    }

    /**
     * @Route("/admin/participation/liste", name="AdminParticipationListe", methods={"GET"})
     */
    public function ParticipationListe(ParticipationRepository $participationRepository){
        return $this->json(['data'=>$participationRepository->getByNbpDesc()]);
    }
    /**
     * @Route("/admin/tri/liste", name="TriListe", methods={"GET"})
     */
    public function TriListe(TriRepository $triRepository){
        return $this->json(['data'=>$triRepository->findAll()]);
    }  

    /**
     * @Route("/admin/livrables/liste", name="AdminLivrablesListe", methods={"GET"})
     */
    public function LivrablesListe(LivrablesRepository $livrablesRepository){
        return $this->json(['data'=>$livrablesRepository->findAll()]);
    }

    /**
     * @Route("/admin/histoe/liste", name="HistoeListe", methods={"GET"})
     */
    public function getHistoeListe(HistoeRepository $histoeRepository){
        return $this->json(['data'=>$histoeRepository->findAll()]);
    }

    /**
     * @Route("/admin/detlivrable/liste", name="DetLivrableListe", methods={"GET"})
     */
    public function DetLivrableListe(DetLivrablesRepository $detLivrablesRepository){
        return $this->json(['data'=>$detLivrablesRepository->findAll()]);
    }
}
