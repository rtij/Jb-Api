<?php

namespace App\Repository;

use App\Entity\Typea;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Typea|null find($id, $lockMode = null, $lockVersion = null)
 * @method Typea|null findOneBy(array $criteria, array $orderBy = null)
 * @method Typea[]    findAll()
 * @method Typea[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TypeARepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Typea::class);
    }

    // /**
    //  * @return Typea[] Returns an array of Typea objects
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
    public function findOneBySomeField($value): ?Typea
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
