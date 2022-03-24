<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Villei
 *
 * @ORM\Table(name="villei")
 * @ORM\Entity
 */
class Villei
{
    /**
     * @var int
     *
     * @ORM\Column(name="idVilleI", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idvillei;

    /**
     * @var string
     *
     * @ORM\Column(name="Libelle", type="string", length=255, nullable=false)
     */
    private $libelle;

    /**
     * @var bool
     *
     * @ORM\Column(name="Issup", type="boolean", nullable=false)
     */
    private $issup = '0';

    public function getIdvillei(): ?int
    {
        return $this->idvillei;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): self
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getIssup(): ?bool
    {
        return $this->issup;
    }

    public function setIssup(bool $issup): self
    {
        $this->issup = $issup;

        return $this;
    }


}
