<?php

namespace App\Repository;

use App\Entity\Article;
use App\Entity\Equipe;
use App\Entity\Stocke;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Stocke|null find($id, $lockMode = null, $lockVersion = null)
 * @method Stocke|null findOneBy(array $criteria, array $orderBy = null)
 * @method Stocke[]    findAll()
 * @method Stocke[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StockeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Stocke::class);
    }

    public function getByArticleAndEquipe(Equipe $eqiupe, Article $article){
        return $this->createQueryBuilder('a')
        ->andWhere('a.idequipe = :val1')
        ->setParameter('val1', $eqiupe)
        ->andWhere('a.idarticle = :val2')
        ->setParameter('val2', $article)
        ->getQuery()
        ->getOneOrNullResult();
    }

    public function GetAllOrderbyDesc(){
        return $this->createQueryBuilder('a')
        ->orderBy('a.idstocke','DESC')
        ->getQuery()
        ->getOneOrNullResult();
    }

    // /**
    //  * @return Stocke[] Returns an array of Stocke objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Stocke
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
