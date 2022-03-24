<?php

namespace App\Repository;

use App\Entity\Tsena;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Tsena|null find($id, $lockMode = null, $lockVersion = null)
 * @method Tsena|null findOneBy(array $criteria, array $orderBy = null)
 * @method Tsena[]    findAll()
 * @method Tsena[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TsenaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Tsena::class);
    }


    public function getlast()
    {
        $sql = "SELECT Max(t.codet) from App:Tsena t";
        return $this->getEntityManager()->createQuery($sql)
            ->getResult();
    }
    // /**
    //  * @return Tsena[] Returns an array of Tsena objects
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
    public function findOneBySomeField($value): ?Tsena
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
