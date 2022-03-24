<?php

namespace App\Repository;

use App\Entity\Detlivrable;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Detlivrable|null find($id, $lockMode = null, $lockVersion = null)
 * @method Detlivrable|null findOneBy(array $criteria, array $orderBy = null)
 * @method Detlivrable[]    findAll()
 * @method Detlivrable[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DetLivrablesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Detlivrable::class);
    }

    // /**
    //  * @return Detlivrable[] Returns an array of Detlivrable objects
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
    public function findOneBySomeField($value): ?Detlivrable
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
