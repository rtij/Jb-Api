<?php

namespace App\Repository;

use App\Entity\Villei;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Villei|null find($id, $lockMode = null, $lockVersion = null)
 * @method Villei|null findOneBy(array $criteria, array $orderBy = null)
 * @method Villei[]    findAll()
 * @method Villei[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VilleIRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Villei::class);
    }

    // /**
    //  * @return Villei[] Returns an array of Villei objects
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
    public function findOneBySomeField($value): ?Villei
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
