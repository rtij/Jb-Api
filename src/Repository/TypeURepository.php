<?php

namespace App\Repository;

use App\Entity\Typeu;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Typeu|null find($id, $lockMode = null, $lockVersion = null)
 * @method Typeu|null findOneBy(array $criteria, array $orderBy = null)
 * @method Typeu[]    findAll()
 * @method Typeu[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TypeURepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Typeu::class);
    }

    // /**
    //  * @return Typeu[] Returns an array of Typeu objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Typeu
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
