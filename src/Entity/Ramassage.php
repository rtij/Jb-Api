<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Ramassage
 *
 * @ORM\Table(name="ramassage", indexes={@ORM\Index(name="fk_tsena_ramassage", columns={"CodeT"}), @ORM\Index(name="fk_users_ramassage", columns={"CodeU"}), @ORM\Index(name="fk_depot_ramassage", columns={"idDep"})})
 * @ORM\Entity
 */
class Ramassage
{
    /**
     * @var int
     *
     * @ORM\Column(name="idRamassage", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idramassage;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateR", type="date", nullable=false)
     */
    private $dater;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="DateR1", type="date", nullable=true)
     */
    private $dater1;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="DateR2", type="date", nullable=true)
     */
    private $dater2;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="RamassageA", type="boolean", nullable=true)
     */
    private $ramassagea = '0';

    /**
     * @var string|null
     *
     * @ORM\Column(name="action", type="string", length=255, nullable=true)
     */
    private $action;

    /**
     * @var \Depotu
     *
     * @ORM\ManyToOne(targetEntity="Depotu")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idDep", referencedColumnName="idDep")
     * })
     */
    private $iddep;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeU", referencedColumnName="CodeU")
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

    public function getIdramassage(): ?string
    {
        return $this->idramassage;
    }

    public function getDater(): ?\DateTimeInterface
    {
        return $this->dater;
    }

    public function setDater(\DateTimeInterface $dater): self
    {
        $this->dater = $dater;

        return $this;
    }

    public function getDater1(): ?\DateTimeInterface
    {
        return $this->dater1;
    }

    public function setDater1(?\DateTimeInterface $dater1): self
    {
        $this->dater1 = $dater1;

        return $this;
    }

    public function getDater2(): ?\DateTimeInterface
    {
        return $this->dater2;
    }

    public function setDater2(?\DateTimeInterface $dater2): self
    {
        $this->dater2 = $dater2;

        return $this;
    }

    public function getRamassagea(): ?bool
    {
        return $this->ramassagea;
    }

    public function setRamassagea(?bool $ramassagea): self
    {
        $this->ramassagea = $ramassagea;

        return $this;
    }

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(?string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getIddep(): ?Depotu
    {
        return $this->iddep;
    }

    public function setIddep(?Depotu $iddep): self
    {
        $this->iddep = $iddep;

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
