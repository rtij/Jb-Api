<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * Users
 *
 * @ORM\Table(name="users", indexes={@ORM\Index(name="fk_users_equipe", columns={"idEquipe"}), @ORM\Index(name="fk_User_TypeU", columns={"idTypeU"})})
 * @ORM\Entity
 */
class Users implements UserInterface
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="CodeU", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $codeu;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="NomU", type="string", length=255, nullable=true)
     */
    private $nomu;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="Password", type="string", length=255, nullable=false)
     */
    private $password;

    /**
     * @var bool|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="IsSup", type="boolean", nullable=true)
     */
    private $issup = '0';

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="Tel_airtel", type="string", length=13, nullable=true)
     */
    private $telAirtel;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="Tel_telma", type="string", length=13, nullable=true)
     */
    private $telTelma;

    /**
     * @var string|null
     *
     * @Groups("post:read")
     * @ORM\Column(name="Tel_orange", type="string", length=13, nullable=true)
     */
    private $telOrange;

    /**
     * @var \Typeu
     *
     * @Groups("post:read")
     * @ORM\ManyToOne(targetEntity="Typeu")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idTypeU", referencedColumnName="idTypeU")
     * })
     */
    private $idtypeu;

    /**
     * @var \Equipe
     *
     * @Groups("post:read")
     * @ORM\ManyToOne(targetEntity="Equipe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idEquipe", referencedColumnName="idEquipe")
     * })
     */
    private $idequipe;

    public function getCodeu(): ?int
    {
        return $this->codeu;
    }

    public function getNomu(): ?string
    {
        return $this->nomu;
    }

    public function setNomu(?string $nomu): self
    {
        $this->nomu = $nomu;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getIssup(): ?bool
    {
        return $this->issup;
    }

    public function setIssup(?bool $issup): self
    {
        $this->issup = $issup;

        return $this;
    }

    public function getTelAirtel(): ?string
    {
        return $this->telAirtel;
    }

    public function setTelAirtel(?string $telAirtel): self
    {
        $this->telAirtel = $telAirtel;

        return $this;
    }

    public function getTelTelma(): ?string
    {
        return $this->telTelma;
    }

    public function setTelTelma(?string $telTelma): self
    {
        $this->telTelma = $telTelma;

        return $this;
    }

    public function getTelOrange(): ?string
    {
        return $this->telOrange;
    }

    public function setTelOrange(?string $telOrange): self
    {
        $this->telOrange = $telOrange;

        return $this;
    }

    public function getIdtypeu(): ?Typeu
    {
        return $this->idtypeu;
    }

    public function setIdtypeu(?Typeu $idtypeu): self
    {
        $this->idtypeu = $idtypeu;

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

    public function getUsername()
    {
        return $this->nomu;
    }
    public function getRoles()
    {
        return [];
    }
    public function getSalt()
    {
        return null;
    }
    public function eraseCredentials()
    {
        
    }
    public function getUserIdentifier()
    {
        return $this->codeu;
    }


}
