<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Detmvt
 *
 * @ORM\Table(name="detmvt", indexes={@ORM\Index(name="fk_article_detmvt", columns={"idArticle"}), @ORM\Index(name="fk_detMvt_mvt", columns={"idmvt"})})
 * @ORM\Entity
 */
class Detmvt
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="idDetMvt", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $iddetmvt;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="usages", type="string", length=255, nullable=true)
     */
    private $usages;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="couleur", type="string", length=255, nullable=true)
     */
    private $couleur;

    /**
     * @var float|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="qte", type="float", precision=20, scale=2, nullable=true)
     */
    private $qte;

    /**
     * @var \DateTime|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="dateR", type="date", nullable=true)
     */
    private $dater;

    /**
     * @var bool|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="aRetourner", type="boolean", nullable=true)
     */
    private $aretourner;

    /**
     * @var bool|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="ok", type="boolean", nullable=true)
     */
    private $ok;

    /**
     * @var \Article
     *
     * @Groups("post:read")
     * @ORM\ManyToOne(targetEntity="Article")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idArticle", referencedColumnName="IdArticle")
     * })
     */
    private $idarticle;

    /**
     * @var \Mvt
     *
     * @ORM\ManyToOne(targetEntity="Mvt")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idmvt", referencedColumnName="idmvt")
     * })
     */
    private $idmvt;

    public function getIddetmvt(): ?string
    {
        return $this->iddetmvt;
    }

    public function getUsages(): ?string
    {
        return $this->usages;
    }

    public function setUsages(?string $usages): self
    {
        $this->usages = $usages;

        return $this;
    }

    public function getCouleur(): ?string
    {
        return $this->couleur;
    }

    public function setCouleur(?string $couleur): self
    {
        $this->couleur = $couleur;

        return $this;
    }

    public function getQte(): ?float
    {
        return $this->qte;
    }

    public function setQte(?float $qte): self
    {
        $this->qte = $qte;

        return $this;
    }

    public function getDater(): ?\DateTimeInterface
    {
        return $this->dater;
    }

    public function setDater(?\DateTimeInterface $dater): self
    {
        $this->dater = $dater;

        return $this;
    }

    public function getAretourner(): ?bool
    {
        return $this->aretourner;
    }

    public function setAretourner(?bool $aretourner): self
    {
        $this->aretourner = $aretourner;

        return $this;
    }

    public function getOk(): ?bool
    {
        return $this->ok;
    }

    public function setOk(?bool $ok): self
    {
        $this->ok = $ok;

        return $this;
    }

    public function getIdarticle(): ?Article
    {
        return $this->idarticle;
    }

    public function setIdarticle(?Article $idarticle): self
    {
        $this->idarticle = $idarticle;

        return $this;
    }

    public function getIdmvt(): ?Mvt
    {
        return $this->idmvt;
    }

    public function setIdmvt(?Mvt $idmvt): self
    {
        $this->idmvt = $idmvt;

        return $this;
    }


}
