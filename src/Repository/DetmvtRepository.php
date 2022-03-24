<?php

namespace App\Repository;

use App\Entity\Detmvt;
use App\Entity\Equipe;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Detmvt|null find($id, $lockMode = null, $lockVersion = null)
 * @method Detmvt|null findOneBy(array $criteria, array $orderBy = null)
 * @method Detmvt[]    findAll()
 * @method Detmvt[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DetmvtRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Detmvt::class);
    }

    public function FindIddetDesc(){
        return $this->createQueryBuilder('a')
        ->orderBy('a.iddetmvt','DESC')
        ->getQuery()
        ->getResult();
    }


    // /**
    //  * @return Detmvt[] Returns an array of Detmvt objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Detmvt
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
