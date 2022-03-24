<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Mvt
 *
 * @ORM\Table(name="mvt", indexes={@ORM\Index(name="fk_users_destinataire", columns={"idDestinataire"}), @ORM\Index(name="fk_users_source", columns={"idSource"})})
 * @ORM\Entity
 */
class Mvt
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="idmvt", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idmvt;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="action", type="string", length=255, nullable=false)
     */
    private $action;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="source", type="string", length=255, nullable=false)
     */
    private $source;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="idsourceF", type="string", length=255, nullable=true)
     */
    private $idsourcef;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="DestinataireF", type="string", length=255, nullable=true)
     */
    private $destinatairef;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="livreur", type="string", length=255, nullable=true)
     */
    private $livreur;

    /**
     * @var \DateTime
     *
     * @Groups("post:read")
     * @ORM\Column(name="dateM", type="date", nullable=false)
     */
    private $datem;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="refDoc", type="string", length=255, nullable=true)
     */
    private $refdoc;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="IdDest", type="string", length=255, nullable=true)
     */
    private $iddest;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idDestinataire", referencedColumnName="CodeU")
     * })
     */
    private $iddestinataire;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idSource", referencedColumnName="CodeU")
     * })
     */
    private $idsource;

     

    public function getIdmvt(): ?string
    {
        return $this->idmvt;
    }

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getSource(): ?string
    {
        return $this->source;
    }

    public function setSource(string $source): self
    {
        $this->source = $source;

        return $this;
    }

    public function getIdsourcef(): ?string
    {
        return $this->idsourcef;
    }

    public function setIdsourcef(?string $idsourcef): self
    {
        $this->idsourcef = $idsourcef;

        return $this;
    }

    public function getDestinatairef(): ?string
    {
        return $this->destinatairef;
    }

    public function setDestinatairef(?string $destinatairef): self
    {
        $this->destinatairef = $destinatairef;

        return $this;
    }

    public function getLivreur(): ?string
    {
        return $this->livreur;
    }

    public function setLivreur(?string $livreur): self
    {
        $this->livreur = $livreur;

        return $this;
    }

    public function getDatem(): ?\DateTimeInterface
    {
        return $this->datem;
    }

    public function setDatem(\DateTimeInterface $datem): self
    {
        $this->datem = $datem;

        return $this;
    }

    public function getRefdoc(): ?string
    {
        return $this->refdoc;
    }

    public function setRefdoc(?string $refdoc): self
    {
        $this->refdoc = $refdoc;

        return $this;
    }

    public function getIddest(): ?string
    {
        return $this->iddest;
    }

    public function setIddest(?string $iddest): self
    {
        $this->iddest = $iddest;

        return $this;
    }

    public function getIddestinataire(): ?Users
    {
        return $this->iddestinataire;
    }

    public function setIddestinataire(?Users $iddestinataire): self
    {
        $this->iddestinataire = $iddestinataire;

        return $this;
    }

    public function getIdsource(): ?Users
    {
        return $this->idsource;
    }

    public function setIdsource(?Users $idsource): self
    {
        $this->idsource = $idsource;

        return $this;
    }


}
