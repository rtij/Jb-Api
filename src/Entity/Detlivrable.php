<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Detlivrable
 *
 * @ORM\Table(name="detlivrable", indexes={@ORM\Index(name="fk_stocke_detL", columns={"idStocke"}), @ORM\Index(name="fk_detL_livrable", columns={"idLivrables"})})
 * @ORM\Entity
 */
class Detlivrable
{
    /**
     * @var int
     *
     * @ORM\Column(name="idDetLivrable", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $iddetlivrable;

    /**
     * @var float|null
     *
     * @ORM\Column(name="Sortie", type="float", precision=20, scale=2, nullable=true)
     */
    private $sortie;

    /**
     * @var float|null
     *
     * @ORM\Column(name="Prix", type="float", precision=20, scale=2, nullable=true)
     */
    private $prix;

  

    /**
     * @var string|null
     *
     * @ORM\Column(name="T", type="string", length=1, nullable=true)
     */
    private $t;

    /**
     * @var \Livrables
     *
     * @ORM\ManyToOne(targetEntity="Livrables")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idLivrables", referencedColumnName="idLivrables")
     * })
     */
    private $idlivrables;

    /**
     * @var \Stocke
     *
     * @ORM\ManyToOne(targetEntity="Stocke")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idStocke", referencedColumnName="idStockE")
     * })
     */
    private $idstocke;

    public function getIddetlivrable(): ?string
    {
        return $this->iddetlivrable;
    }


    public function getSortie(): ?float
    {
        return $this->sortie;
    }

    public function setSortie(?float $sortie): self
    {
        $this->sortie = $sortie;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->prix;
    }

    public function setPrix(?float $prix): self
    {
        $this->prix = $prix;

        return $this;
    }

    public function getT(): ?string
    {
        return $this->t;
    }

    public function setT(?string $t): self
    {
        $this->t = $t;

        return $this;
    }

    public function getIdlivrables(): ?Livrables
    {
        return $this->idlivrables;
    }

    public function setIdlivrables(?Livrables $idlivrables): self
    {
        $this->idlivrables = $idlivrables;

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
