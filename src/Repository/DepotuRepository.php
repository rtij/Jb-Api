<?php

namespace App\Repository;

use App\Entity\Depotu;
use App\Entity\Equipe;
use App\Entity\Tsena;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Depotu|null find($id, $lockMode = null, $lockVersion = null)
 * @method Depotu|null findOneBy(array $criteria, array $orderBy = null)
 * @method Depotu[]    findAll()
 * @method Depotu[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DepotuRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Depotu::class);
    }


    public function getByIdDesc()
    {
        return $this->createQueryBuilder('a')
            ->orderBy('a.iddep', 'DESC')
            ->getQuery()
            ->getResult();
    }

    public function getLastDepotTsena(Tsena $tsena){
        
        $sql = "SELECT Max(d.iddep) from App:Depotu d WHERE d.codet = :val1";
        return $this->getEntityManager()->createQuery($sql)->setParameter('val1', $tsena)
            ->getResult();
    }
    // /**
    //  * @return Depotu[] Returns an array of Depotu objects
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
    public function findOneBySomeField($value): ?Depotu
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
