<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Equipe
 *
 * @ORM\Table(name="equipe", indexes={@ORM\Index(name="fk_equipe_VilleI", columns={"idVilleI"})})
 * @ORM\Entity
 */
class Equipe
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="idEquipe", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idequipe;

    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="equipe", type="bigint", nullable=false, options={"unsigned"=true})
     */
    private $equipe;

    /**
     * @var bool
     *
     * @Groups("post:read")
     * @ORM\Column(name="IsSup", type="boolean", nullable=false)
     */
    private $issup = '0';

    /**
     * @var int|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="zoneA", type="integer", nullable=true, options={"unsigned"=true})
     */
    private $zonea;

    /**
     * @var string|null
     *
     * @ORM\Column(name="localite", type="string", length=255, nullable=true)
     */
    private $localite;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="faritany", type="string", length=255, nullable=true)
     */
    private $faritany;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="quartierV", type="string", length=255, nullable=true)
     */
    private $quartierv;

    /**
     * @var \Villei
     *
     * @Groups("post:read")
     * @ORM\ManyToOne(targetEntity="Villei")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idVilleI", referencedColumnName="idVilleI")
     * })
     */
    private $idvillei;

    public function getIdequipe(): ?string
    {
        return $this->idequipe;
    }

    public function getEquipe(): ?string
    {
        return $this->equipe;
    }

    public function setEquipe(string $equipe): self
    {
        $this->equipe = $equipe;

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

    public function getZonea(): ?int
    {
        return $this->zonea;
    }

    public function setZonea(?int $zonea): self
    {
        $this->zonea = $zonea;

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

    public function getIdvillei(): ?Villei
    {
        return $this->idvillei;
    }

    public function setIdvillei(?Villei $idvillei): self
    {
        $this->idvillei = $idvillei;

        return $this;
    }


}
