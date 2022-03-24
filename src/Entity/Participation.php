<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Participation
 *
 * @ORM\Table(name="participation", indexes={@ORM\Index(name="fk_users_participation", columns={"CodeU"})})
 * @ORM\Entity
 */
class Participation
{
    /**
     * @var int
     *
     * @ORM\Column(name="idParticipation", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idparticipation;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateS", type="date", nullable=false)
     */
    private $dates;

    /**
     * @var int
     *
     * @ORM\Column(name="numEnv", type="bigint", nullable=false, options={"unsigned"=true})
     */
    private $numenv;

    /**
     * @var string
     *
     * @ORM\Column(name="NomP", type="string", length=255, nullable=false)
     */
    private $nomp;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telTelma", type="string", length=13, nullable=true)
     */
    private $teltelma;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telAirtel", type="string", length=13, nullable=true)
     */
    private $telairtel;

    /**
     * @var string|null
     *
     * @ORM\Column(name="telOrange", type="string", length=13, nullable=true)
     */
    private $telorange;

    /**
     * @var string|null
     *
     * @ORM\Column(name="AdrP", type="string", length=255, nullable=true)
     */
    private $adrp;

    /**
     * @var string|null
     *
     * @ORM\Column(name="faritany", type="string", length=255, nullable=true)
     */
    private $faritany;

    /**
     * @var int|null
     *
     * @ORM\Column(name="nbP", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $nbp;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeU", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    public function getIdparticipation(): ?string
    {
        return $this->idparticipation;
    }

    public function getDates(): ?\DateTimeInterface
    {
        return $this->dates;
    }

    public function setDates(\DateTimeInterface $dates): self
    {
        $this->dates = $dates;

        return $this;
    }

    public function getNumenv(): ?string
    {
        return $this->numenv;
    }

    public function setNumenv(string $numenv): self
    {
        $this->numenv = $numenv;

        return $this;
    }

    public function getNomp(): ?string
    {
        return $this->nomp;
    }

    public function setNomp(string $nomp): self
    {
        $this->nomp = $nomp;

        return $this;
    }

    public function getTeltelma(): ?string
    {
        return $this->teltelma;
    }

    public function setTeltelma(?string $teltelma): self
    {
        $this->teltelma = $teltelma;

        return $this;
    }

    public function getTelairtel(): ?string
    {
        return $this->telairtel;
    }

    public function setTelairtel(?string $telairtel): self
    {
        $this->telairtel = $telairtel;

        return $this;
    }

    public function getTelorange(): ?string
    {
        return $this->telorange;
    }

    public function setTelorange(?string $telorange): self
    {
        $this->telorange = $telorange;

        return $this;
    }

    public function getAdrp(): ?string
    {
        return $this->adrp;
    }

    public function setAdrp(?string $adrp): self
    {
        $this->adrp = $adrp;

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

    public function getNbp(): ?int
    {
        return $this->nbp;
    }

    public function setNbp(?int $nbp): self
    {
        $this->nbp = $nbp;

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
