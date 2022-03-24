<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Livrables
 *
 * @ORM\Table(name="livrables", indexes={@ORM\Index(name="fk_Users_Livrables", columns={"CodeU"})})
 * @ORM\Entity
 */
class Livrables
{
    /**
     * @var int
     *
     * @ORM\Column(name="idLivrables", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idlivrables;

    /**
     * @var string|null
     *
     * @ORM\Column(name="typeL", type="string", length=255, nullable=true)
     */
    private $typel;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateA", type="date", nullable=false)
     */
    private $datea;

    /**
     * @var int|null
     *
     * @ORM\Column(name="semaineC", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $semainec;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NombreA", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $nombrea;

    /**
     * @var float|null
     *
     * @ORM\Column(name="RecetteJ", type="float", precision=24, scale=2, nullable=true)
     */
    private $recettej;

    /**
     * @var int|null
     *
     * @ORM\Column(name="EnvU", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $envu;

    /**
     * @var string|null
     *
     * @ORM\Column(name="NumU", type="string", length=255, nullable=true)
     */
    private $numu;

    /**
     * @var int|null
     *
     * @ORM\Column(name="Contact", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $contact;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeU", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    public function getIdlivrables(): ?string
    {
        return $this->idlivrables;
    }

    public function getTypel(): ?string
    {
        return $this->typel;
    }

    public function setTypel(?string $typel): self
    {
        $this->typel = $typel;

        return $this;
    }

    public function getDatea(): ?\DateTimeInterface
    {
        return $this->datea;
    }

    public function setDatea(\DateTimeInterface $datea): self
    {
        $this->datea = $datea;

        return $this;
    }

    public function getSemainec(): ?int
    {
        return $this->semainec;
    }

    public function setSemainec(?int $semainec): self
    {
        $this->semainec = $semainec;

        return $this;
    }

    public function getNombrea(): ?int
    {
        return $this->nombrea;
    }

    public function setNombrea(?int $nombrea): self
    {
        $this->nombrea = $nombrea;

        return $this;
    }

    public function getRecettej(): ?float
    {
        return $this->recettej;
    }

    public function setRecettej(?float $recettej): self
    {
        $this->recettej = $recettej;

        return $this;
    }

    public function getEnvu(): ?int
    {
        return $this->envu;
    }

    public function setEnvu(?int $envu): self
    {
        $this->envu = $envu;

        return $this;
    }

    public function getNumu(): ?string
    {
        return $this->numu;
    }

    public function setNumu(?string $numu): self
    {
        $this->numu = $numu;

        return $this;
    }

    public function getContact(): ?int
    {
        return $this->contact;
    }

    public function setContact(?int $contact): self
    {
        $this->contact = $contact;

        return $this;
    }

    public function getCodeu(): ?Users
    {
        return $this->codeu;
    }

    public function setCodeu(?Users $codeu): self
    {
        $this->codeu = $codeu;

        return $this;
    }


}
