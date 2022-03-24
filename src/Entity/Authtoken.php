<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Authtoken
 *
 * @ORM\Table(name="authtoken", indexes={@ORM\Index(name="fk_User_token", columns={"CodeU"})})
 * @ORM\Entity
 */
class Authtoken
{
    /**
     * @var int
     *
     * @ORM\Column(name="idToken", type="bigint", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idtoken;

    /**
     * @var string
     *
     * @ORM\Column(name="token", type="string", length=255, nullable=false)
     */
    private $token;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateT", type="date", nullable=false)
     */
    private $datet;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="CodeU", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    public function getIdtoken(): ?string
    {
        return $this->idtoken;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(string $token): self
    {
        $this->token = $token;

        return $this;
    }

    public function getDatet(): ?\DateTimeInterface
    {
        return $this->datet;
    }

    public function setDatet(\DateTimeInterface $datet): self
    {
        $this->datet = $datet;

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


}
