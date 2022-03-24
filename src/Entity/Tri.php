<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Tri
 *
 * @ORM\Table(name="tri", uniqueConstraints={@ORM\UniqueConstraint(name="NumEnv", columns={"NumEnv"})}, indexes={@ORM\Index(name="fk_users_tri", columns={"CodeU"})})
 * @ORM\Entity
 */
class Tri
{
    /**
     * @var int
     *
     * @ORM\Column(name="idTri", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idtri;

    /**
     * @var string|null
     *
     * @ORM\Column(name="action", type="string", length=255, nullable=true)
     */
    private $action;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="DateTri", type="date", nullable=false)
     */
    private $datetri;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NumEnv", type="bigint", nullable=true)
     */
    private $numenv;

    /**
     * @var bool
     *
     * @ORM\Column(name="feno", type="boolean", nullable=false)
     */
    private $feno;

    
    /**
     * @var bool
     *
     * @ORM\Column(name="valide", type="boolean", nullable=false)
     */
    private $valide;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NbPP", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $nbpp;

    /**
     * @var int
     *
     * @ORM\Column(name="NbVi", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $nbvi;

    /**
     * @var int
     *
     * @ORM\Column(name="NbOe", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $nboe;

    /**
     * @var int
     *
     * @ORM\Column(name="NbPs", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $nbps;

    /**
     * @var int
     *
     * @ORM\Column(name="total", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $total;

    /**
     * @var string|null
     *
     * @ORM\Column(name="MotifInv", type="string", length=255, nullable=true)
     */
    private $motifinv;

    /**
     * @var string|null
     *
     * @ORM\Column(name="faritany", type="string", length=255, nullable=true)
     */
    private $faritany;

    /**
     * @var string|null
     *
     * @ORM\Column(name="nomPrenom", type="string", length=255, nullable=true)
     */
    private $nomprenom;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeU", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    public function getIdtri(): ?string
    {
        return $this->idtri;
    }

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(?string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getDatetri(): ?\DateTimeInterface
    {
        return $this->datetri;
    }

    public function setDatetri(\DateTimeInterface $datetri): self
    {
        $this->datetri = $datetri;

        return $this;
    }

    public function getNumenv(): ?string
    {
        return $this->numenv;
    }

    public function setNumenv(?string $numenv): self
    {
        $this->numenv = $numenv;

        return $this;
    }

    public function getFeno(): ?bool
    {
        return $this->feno;
    }

    public function setFeno(bool $feno): self
    {
        $this->feno = $feno;

        return $this;
    }

    public function getValide(): ?bool
    {
        return $this->valide;
    }

    public function setValide(bool $Valide): self
    {
        $this->valide = $Valide;

        return $this;
    }

    public function getNbpp(): ?int
    {
        return $this->nbpp;
    }

    public function setNbpp(?int $nbpp): self
    {
        $this->nbpp = $nbpp;

        return $this;
    }

    public function getNbvi(): ?int
    {
        return $this->nbvi;
    }

    public function setNbvi(int $nbvi): self
    {
        $this->nbvi = $nbvi;

        return $this;
    }

    public function getNboe(): ?int
    {
        return $this->nboe;
    }

    public function setNboe(int $nboe): self
    {
        $this->nboe = $nboe;

        return $this;
    }

    public function getNbps(): ?int
    {
        return $this->nbps;
    }

    public function setNbps(int $nbps): self
    {
        $this->nbps = $nbps;

        return $this;
    }

    public function getTotal(): ?int
    {
        return $this->total;
    }

    public function setTotal(int $total): self
    {
        $this->total = $total;

        return $this;
    }

    public function getMotifinv(): ?string
    {
        return $this->motifinv;
    }

    public function setMotifinv(?string $motifinv): self
    {
        $this->motifinv = $motifinv;

        return $this;
    }

    public function getFaritany(): ?string
    {
        return $this->faritany;
    }

    public function setFaritany(?string $faritany): self
    {
        $this->faritany = $faritany;

        return $this;
    }

    public function getNomprenom(): ?string
    {
        return $this->nomprenom;
    }

    public function setNomprenom(?string $nomprenom): self
    {
        $this->nomprenom = $nomprenom;

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
