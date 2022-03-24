<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Materiel
 *
 * @ORM\Table(name="materiel")
 * @ORM\Entity
 */
class Materiel
{
    /**
     * @var string
     *
     * @ORM\Column(name="couleur", type="string", length=255, nullable=false)
     */
    private $couleur;

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

    public function getCouleur(): ?string
    {
        return $this->couleur;
    }

    public function setCouleur(string $couleur): self
    {
        $this->couleur = $couleur;

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
