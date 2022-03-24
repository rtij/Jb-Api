<?php

namespace App\Repository;

use App\Entity\Mvt;
use App\Entity\Users;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Mvt|null find($id, $lockMode = null, $lockVersion = null)
 * @method Mvt|null findOneBy(array $criteria, array $orderBy = null)
 * @method Mvt[]    findAll()
 * @method Mvt[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MvtRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Mvt::class);
    }


    public function getlast()
    {
        $sql = "SELECT Max(m.idmvt) from App:Mvt m";
        return $this->getEntityManager()->createQuery($sql)
            ->getResult();
    }

    public function getApproUser(DateTime $date, Users $users)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.datem = :val1')
            ->setParameter('val1',$date)
            ->andWhere('a.iddestinataire = :val2')
            ->setParameter('val2', $users)
            ->getQuery()
            ->getResult();
    }
    // /**
    //  * @return Mvt[] Returns an array of Mvt objects
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
    public function findOneBySomeField($value): ?Mvt
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
