<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Produit
 *
 * @ORM\Table(name="produit")
 * @ORM\Entity
 */
class Produit
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="Parfums", type="string", length=255, nullable=true)
     */
    private $parfums;

    /**
     * @var \Typea
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="Typea")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idTypeA", referencedColumnName="idTypeA")
     * })
     */
    private $idtypea;

    public function getParfums(): ?string
    {
        return $this->parfums;
    }

    public function setParfums(?string $parfums): self
    {
        $this->parfums = $parfums;

        return $this;
    }

    public function getIdtypea(): ?Typea
    {
        return $this->idtypea;
    }

    public function setIdtypea(?Typea $idtypea): self
    {
        $this->idtypea = $idtypea;

        return $this;
    }


}
