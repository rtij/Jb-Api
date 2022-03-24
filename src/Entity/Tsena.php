<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Tsena
 *
 * @ORM\Table(name="tsena", indexes={@ORM\Index(name="fk_VilleI_tsena", columns={"idVille"})})
 * @ORM\Entity
 */
class Tsena
{
    /**
     * @var int
     *
     * @ORM\Column(name="CodeT", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $codet;

    /**
     * @var string|null
     *
     * @ORM\Column(name="NomT", type="string", length=255, nullable=true)
     */
    private $nomt;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Type", type="string", length=255, nullable=true)
     */
    private $type;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Proprietaire", type="string", length=255, nullable=true)
     */
    private $proprietaire;

    /**
     * @var string|null
     *
     * @ORM\Column(name="AdrT", type="string", length=255, nullable=true)
     */
    private $adrt;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Responsable", type="string", length=255, nullable=true)
     */
    private $responsable;

    /**
     * @var string|null
     *
     * @ORM\Column(name="AdrT2", type="string", length=255, nullable=true)
     */
    private $adrt2;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Tel1", type="string", length=13, nullable=true)
     */
    private $tel1;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Tel2", type="string", length=13, nullable=true)
     */
    private $tel2;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Tel3", type="string", length=13, nullable=true)
     */
    private $tel3;

    /**
     * @var string|null
     *
     * @ORM\Column(name="reperage", type="string", length=255, nullable=true)
     */
    private $reperage;

    /**
     * @var string|null
     *
     * @ORM\Column(name="Niveau", type="string", length=255, nullable=true)
     */
    private $niveau;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="HOuverture", type="time", nullable=true)
     */
    private $houverture;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="HFermeture", type="time", nullable=true)
     */
    private $hfermeture;

    /**
     * @var string|null
     *
     * @ORM\Column(name="JourF", type="string", length=255, nullable=true)
     */
    private $jourf;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="DateF", type="date", nullable=true)
     */
    private $datef;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="Ouvert", type="boolean", nullable=true)
     */
    private $ouvert;

    /**
     * @var int|null
     *
     * @ORM\Column(name="zone", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $zone;

    /**
     * @var string|null
     *
     * @ORM\Column(name="localite", type="string", length=255, nullable=true)
     */
    private $localite;

    /**
     * @var string|null
     *
     * @ORM\Column(name="faritany", type="string", length=255, nullable=true)
     */
    private $faritany;

    /**
     * @var string|null
     *
     * @ORM\Column(name="quartierV", type="string", length=255, nullable=true)
     */
    private $quartierv;

    /**
     * @var \Villei
     *
     * @ORM\ManyToOne(targetEntity="Villei")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idVille", referencedColumnName="idVilleI")
     * })
     */
    private $idville;

    public function getCodet(): ?string
    {
        return $this->codet;
    }

    public function getNomt(): ?string
    {
        return $this->nomt;
    }

    public function setNomt(?string $nomt): self
    {
        $this->nomt = $nomt;

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

    public function getProprietaire(): ?string
    {
        return $this->proprietaire;
    }

    public function setProprietaire(?string $proprietaire): self
    {
        $this->proprietaire = $proprietaire;

        return $this;
    }

    public function getAdrt(): ?string
    {
        return $this->adrt;
    }

    public function setAdrt(?string $adrt): self
    {
        $this->adrt = $adrt;

        return $this;
    }

    public function getResponsable(): ?string
    {
        return $this->responsable;
    }

    public function setResponsable(?string $responsable): self
    {
        $this->responsable = $responsable;

        return $this;
    }

    public function getAdrt2(): ?string
    {
        return $this->adrt2;
    }

    public function setAdrt2(?string $adrt2): self
    {
        $this->adrt2 = $adrt2;

        return $this;
    }

    public function getTel1(): ?string
    {
        return $this->tel1;
    }

    public function setTel1(?string $tel1): self
    {
        $this->tel1 = $tel1;

        return $this;
    }

    public function getTel2(): ?string
    {
        return $this->tel2;
    }

    public function setTel2(?string $tel2): self
    {
        $this->tel2 = $tel2;

        return $this;
    }

    public function getTel3(): ?string
    {
        return $this->tel3;
    }

    public function setTel3(?string $tel3): self
    {
        $this->tel3 = $tel3;

        return $this;
    }

    public function getReperage(): ?string
    {
        return $this->reperage;
    }

    public function setReperage(?string $reperage): self
    {
        $this->reperage = $reperage;

        return $this;
    }

    public function getNiveau(): ?string
    {
        return $this->niveau;
    }

    public function setNiveau(?string $niveau): self
    {
        $this->niveau = $niveau;

        return $this;
    }

    public function getHouverture(): ?\DateTimeInterface
    {
        return $this->houverture;
    }

    public function setHouverture(?\DateTimeInterface $houverture): self
    {
        $this->houverture = $houverture;

        return $this;
    }

    public function getHfermeture(): ?\DateTimeInterface
    {
        return $this->hfermeture;
    }

    public function setHfermeture(?\DateTimeInterface $hfermeture): self
    {
        $this->hfermeture = $hfermeture;

        return $this;
    }

    public function getJourf(): ?string
    {
        return $this->jourf;
    }

    public function setJourf(?string $jourf): self
    {
        $this->jourf = $jourf;

        return $this;
    }

    public function getDatef(): ?\DateTimeInterface
    {
        return $this->datef;
    }

    public function setDatef(?\DateTimeInterface $datef): self
    {
        $this->datef = $datef;

        return $this;
    }

    public function getOuvert(): ?bool
    {
        return $this->ouvert;
    }

    public function setOuvert(?bool $ouvert): self
    {
        $this->ouvert = $ouvert;

        return $this;
    }

    public function getZone(): ?int
    {
        return $this->zone;
    }

    public function setZone(?int $zone): self
    {
        $this->zone = $zone;

        return $this;
    }

    public function getLocalite(): ?string
    {
        return $this->localite;
    }

    public function setLocalite(?string $localite): self
    {
        $this->localite = $localite;

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

    public function getQuartierv(): ?string
    {
        return $this->quartierv;
    }

    public function setQuartierv(?string $quartierv): self
    {
        $this->quartierv = $quartierv;

        return $this;
    }

    public function getIdville(): ?Villei
    {
        return $this->idville;
    }

    public function setIdville(?Villei $idville): self
    {
        $this->idville = $idville;

        return $this;
    }


}
