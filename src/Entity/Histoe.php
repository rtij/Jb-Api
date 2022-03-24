<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Histoe
 *
 * @ORM\Table(name="histoe", indexes={@ORM\Index(name="fk_stocke_histoe", columns={"idStockE"})})
 * @ORM\Entity
 */
class Histoe
{
    /**
     * @var int
     *
     * @ORM\Column(name="idHistoE", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idhistoe;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="DateH", type="date", nullable=true)
     */
    private $dateh;

    /**
     * @var float|null
     *
     * @ORM\Column(name="Appro", type="float", precision=20, scale=2, nullable=true)
     */
    private $appro;

    /**
     * @var float|null
     *
     * @ORM\Column(name="Vente", type="float", precision=20, scale=2, nullable=true)
     */
    private $vente;

    /**
     * @var float|null
     *
     * @ORM\Column(name="qteR", type="float", precision=20, scale=2, nullable=true)
     */
    private $qter;

    /**
     * @var \Stocke
     *
     * @ORM\ManyToOne(targetEntity="Stocke")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idStockE", referencedColumnName="idStockE")
     * })
     */
    private $idstocke;

    public function getIdhistoe(): ?string
    {
        return $this->idhistoe;
    }

    public function getDateh(): ?\DateTimeInterface
    {
        return $this->dateh;
    }

    public function setDateh(?\DateTimeInterface $dateh): self
    {
        $this->dateh = $dateh;

        return $this;
    }

    public function getAppro(): ?float
    {
        return $this->appro;
    }

    public function setAppro(?float $appro): self
    {
        $this->appro = $appro;

        return $this;
    }

    public function getVente(): ?float
    {
        return $this->vente;
    }

    public function setVente(?float $vente): self
    {
        $this->vente = $vente;

        return $this;
    }

    public function getQter(): ?float
    {
        return $this->qter;
    }

    public function setQter(?float $qter): self
    {
        $this->qter = $qter;

        return $this;
    }

    public function getIdstocke(): ?Stocke
    {
        return $this->idstocke;
    }

    public function setIdstocke(?Stocke $idstocke): self
    {
        $this->idstocke = $idstocke;

        return $this;
    }


}
