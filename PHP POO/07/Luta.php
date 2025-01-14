<?php
require_once 'Lutador.php';
class Luta {
  private $desafiado;
  private $desafiante;
  private $rounds;
  private $aprovada;
  public function marcarLuta($l1, $l2) {
    if ($l1->getCategoria() === $l2->getCategoria() && ($l1 != $l2)) {
      $this->aprovada = true;
      $this->desafiado = $l1;
      $this->desafiante = $l2;
    } else {
      $this->aprovada = false;
      $this->desafiado = null;
      $this->desafiante = null;
    }
  }
  public function lutar() {
    if ($this->aprovada) {
      $this->desafiado->apresentar();
      $this->desafiante->apresentar();
      $vencedor = rand(0, 2);
      switch ($vencedor) {
        case 0:
          echo "<p>Empatou!</p>";
          $this->desafiado->empatarLuta();
          $this->desafiante->empatarLuta();
          break;
        case 1:
          echo "<p>Ganhou o desafiado ";
          echo "{$this->desafiado->getNome()}!</p>";
          $this->desafiado->ganharLuta();
          $this->desafiante->perderLuta();
          break;
        case 2:
          echo "<p>Ganhou o desafiante ";
          echo "{$this->desafiante->getNome()}!</p>";
          $this->desafiado->perderLuta();
          $this->desafiante->ganharLuta();
          break;
      }
    } else {
      echo "<p>Luta não pode acontecer</p>";
    }
  }
  public function getDesafiado() {
    return $this->desafiado;
  }
  public function getDesafiante() {
    return $this->desafiante;
  }
  public function getRounds() {
    return $this->rounds;
  }
  public function getAprovada() {
    return $this->aprovada;
  }
  public function setDesafiado($desafiado) {
    return $this->desafiado = $desafiado;
  }
  public function setDesafiante($desafiante) {
    return $this->desafiante = $desafiante;
  }
  public function setRounds($rounds) {
    return $this->rounds = $rounds;
  }
  public function setAprovada($aprovada) {
    return $this->aprovada = $aprovada;
  }
}
?>