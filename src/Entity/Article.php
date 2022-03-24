<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Article
 *
 * @ORM\Table(name="article")
 * @ORM\Entity
 */
class Article
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="IdArticle", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idarticle;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="Designation", type="string", length=255, nullable=false)
     */
    private $designation;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="Type", type="string", length=255, nullable=false)
     */
    private $type;

    /**
     * @var int|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="Qte", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $qte;

    /**
     * @var float|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="PrixU", type="float", precision=24, scale=2, nullable=true)
     */
    private $prixu;

    /**
     * @var bool
     *
     * @Groups("post:read")
     * @ORM\Column(name="issup", type="boolean", nullable=false)
     */
    private $issup = '0';

    public function getIdarticle(): ?string
    {
        return $this->idarticle;
    }

    public function getDesignation(): ?string
    {
        return $this->designation;
    }

    public function setDesignation(string $designation): self
    {
        $this->designation = $designation;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getQte(): ?int
    {
        return $this->qte;
    }

    public function setQte(?int $qte): self
    {
        $this->qte = $qte;

        return $this;
    }

    public function getPrixu(): ?float
    {
        return $this->prixu;
    }

    public function setPrixu(?float $prixu): self
    {
        $this->prixu = $prixu;

        return $this;
    }

    public function getIssup(): ?bool
    {
        return $this->issup;
    }

    public function setIssup(bool $issup): self
    {
        $this->issup = $issup;

        return $this;
    }


}
