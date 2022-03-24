<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Stocke
 *
 * @ORM\Table(name="stocke", indexes={@ORM\Index(name="fk_article_stockE", columns={"idArticle"}), @ORM\Index(name="fk_equipe_stockE", columns={"idEquipe"})})
 * @ORM\Entity
 */
class Stocke
{
    /**
     * @var int
     *
     * @ORM\Column(name="idStockE", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idstocke;

    /**
     * @var float
     *
     * @ORM\Column(name="qte", type="float", precision=20, scale=2, nullable=false)
     */
    private $qte;

    /**
     * @var \Article
     *
     * @ORM\ManyToOne(targetEntity="Article")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idArticle", referencedColumnName="IdArticle")
     * })
     */
    private $idarticle;

    /**
     * @var \Equipe
     *
     * @ORM\ManyToOne(targetEntity="Equipe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idEquipe", referencedColumnName="idEquipe")
     * })
     */
    private $idequipe;

    public function getIdstocke(): ?string
    {
        return $this->idstocke;
    }

    public function getQte(): ?float
    {
        return $this->qte;
    }

    public function setQte(float $qte): self
    {
        $this->qte = $qte;

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

    public function getIdequipe(): ?Equipe
    {
        return $this->idequipe;
    }

    public function setIdequipe(?Equipe $idequipe): self
    {
        $this->idequipe = $idequipe;

        return $this;
    }


}
