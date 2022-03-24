<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Typeu
 *
 * @ORM\Table(name="typeu")
 * @ORM\Entity
 */
class Typeu
{
    /**
     * @var int
     *
     * @Groups("post:read")
     * @ORM\Column(name="idTypeU", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idtypeu;

    /**
     * @var string
     *
     * @Groups("post:read")
     * @ORM\Column(name="DesTypeU", type="string", length=255, nullable=false)
     */
    private $destypeu;

    public function getIdtypeu(): ?int
    {
        return $this->idtypeu;
    }

    public function getDestypeu(): ?string
    {
        return $this->destypeu;
    }

    public function setDestypeu(string $destypeu): self
    {
        $this->destypeu = $destypeu;

        return $this;
    }


}
