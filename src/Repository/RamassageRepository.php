<?php

namespace App\Repository;

use App\Entity\Depotu;
use App\Entity\Ramassage;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Ramassage|null find($id, $lockMode = null, $lockVersion = null)
 * @method Ramassage|null findOneBy(array $criteria, array $orderBy = null)
 * @method Ramassage[]    findAll()
 * @method Ramassage[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RamassageRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Ramassage::class);
    }

    public function getlast(Depotu $depotu)
    {
        $sql = "SELECT Max(r.idramassage) from App:Ramassage r WHERE r.iddep = :val1";
        return $this->getEntityManager()->createQuery($sql)->setParameter('val1', $depotu)
            ->getResult();
    }
    // /**
    //  * @return Ramassage[] Returns an array of Ramassage objects
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
    public function findOneBySomeField($value): ?Ramassage
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
