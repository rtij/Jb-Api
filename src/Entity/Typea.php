<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Typea
 *
 * @ORM\Table(name="typea")
 * @ORM\Entity
 */
class Typea
{
    /**
     * @var int
     *
     * @ORM\Column(name="idTypeA", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idtypea;

    /**
     * @var string
     *
     * @ORM\Column(name="DesTA", type="string", length=255, nullable=false)
     */
    private $desta;

    public function getIdtypea(): ?int
    {
        return $this->idtypea;
    }

    public function getDesta(): ?string
    {
        return $this->desta;
    }

    public function setDesta(string $desta): self
    {
        $this->desta = $desta;

        return $this;
    }


}
