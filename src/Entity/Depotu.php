<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Depotu
 *
 * @ORM\Table(name="depotu", indexes={@ORM\Index(name="fk_Users_depot", columns={"Codeu"}), @ORM\Index(name="fk_tsena_depot", columns={"CodeT"})})
 * @ORM\Entity
 */
class Depotu
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="action", type="string", length=255, nullable=true)
     */
    private $action;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateD", type="date", nullable=false)
     */
    private $dated;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="HeureD", type="time", nullable=true)
     */
    private $heured;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Type", type="string", length=255, nullable=true)
     */
    private $type;

    /**
     * @var string|null
     *
     * @ORM\Column(name="NumU", type="string", length=255, nullable=true)
     */
    private $numu;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Place", type="string", length=255, nullable=true)
     */
    private $place;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NbEnv", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $nbenv;

    /**
     * @var int|null
     *
     * @ORM\Column(name="NbAff", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $nbaff;

    /**
     * @var int
     *
     * @ORM\Column(name="idDep", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $iddep;

    /**
     * @var int|null
     *
     * @ORM\Column(name="isany", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $isany;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="Codeu", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    /**
     * @var \Tsena
     *
     * @ORM\ManyToOne(targetEntity="Tsena")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeT", referencedColumnName="CodeT")
     * })
     */
    private $codet;

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(?string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getDated(): ?\DateTimeInterface
    {
        return $this->dated;
    }

    public function setDated(\DateTimeInterface $dated): self
    {
        $this->dated = $dated;

        return $this;
    }

    public function getHeured(): ?\DateTimeInterface
    {
        return $this->heured;
    }

    public function setHeured(?\DateTimeInterface $heured): self
    {
        $this->heured = $heured;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(?string $type): self
    {
        $this->type = $type;

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

    public function getPlace(): ?string
    {
        return $this->place;
    }

    public function setPlace(?string $place): self
    {
        $this->place = $place;

        return $this;
    }

    public function getNbenv(): ?int
    {
        return $this->nbenv;
    }

    public function setNbenv(?int $nbenv): self
    {
        $this->nbenv = $nbenv;

        return $this;
    }

    public function getNbaff(): ?int
    {
        return $this->nbaff;
    }

    public function setNbaff(?int $nbaff): self
    {
        $this->nbaff = $nbaff;

        return $this;
    }

    public function getIddep(): ?string
    {
        return $this->iddep;
    }

    public function getIsany(): ?int
    {
        return $this->isany;
    }

    public function setIsany(?int $isany): self
    {
        $this->isany = $isany;

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

    public function getCodet(): ?Tsena
    {
        return $this->codet;
    }

    public function setCodet(?Tsena $codet): self
    {
        $this->codet = $codet;

        return $this;
    }


}
