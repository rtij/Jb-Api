<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Contacts
 *
 * @ORM\Table(name="contacts", indexes={@ORM\Index(name="fk_users_contacts", columns={"codeU"})})
 * @ORM\Entity
 */
class Contacts
{
    /**
     * @var int
     *
     * @ORM\Column(name="idContacts", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idcontacts;

    /**
     * @var string
     *
     * @ORM\Column(name="Contacts", type="string", length=15, nullable=false)
     */
    private $contacts;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="codeU", referencedColumnName="CodeU")
     * })
     */
    private $codeu;

    public function getIdcontacts(): ?int
    {
        return $this->idcontacts;
    }

    public function getContacts(): ?string
    {
        return $this->contacts;
    }

    public function setContacts(string $contacts): self
    {
        $this->contacts = $contacts;

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
