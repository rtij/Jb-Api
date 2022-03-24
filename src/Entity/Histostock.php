<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Histostock
 *
 * @ORM\Table(name="histostock", indexes={@ORM\Index(name="fk_histostock_article", columns={"idArticle"})})
 * @ORM\Entity
 */
class Histostock
{
    /**
     * @var int
     *
     * @ORM\Column(name="idhisto", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idhisto;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateH", type="date", nullable=false)
     */
    private $dateh;

    /**
     * @var float|null
     *
     * @ORM\Column(name="qteR", type="float", precision=20, scale=2, nullable=true)
     */
    private $qter;

    /**
     * @var float|null
     *
     * @ORM\Column(name="qteE", type="float", precision=20, scale=2, nullable=true)
     */
    private $qtee;

    /**
     * @var float|null
     *
     * @ORM\Column(name="qteS", type="float", precision=20, scale=2, nullable=true)
     */
    private $qtes;

    /**
     * @var \Article
     *
     * @ORM\ManyToOne(targetEntity="Article")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idArticle", referencedColumnName="IdArticle")
     * })
     */
    private $idarticle;

    public function getIdhisto(): ?string
    {
        return $this->idhisto;
    }

    public function getDateh(): ?\DateTimeInterface
    {
        return $this->dateh;
    }

    public function setDateh(\DateTimeInterface $dateh): self
    {
        $this->dateh = $dateh;

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

    public function getQtee(): ?float
    {
        return $this->qtee;
    }

    public function setQtee(?float $qtee): self
    {
        $this->qtee = $qtee;

        return $this;
    }

    public function getQtes(): ?float
    {
        return $this->qtes;
    }

    public function setQtes(?float $qtes): self
    {
        $this->qtes = $qtes;

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


}
