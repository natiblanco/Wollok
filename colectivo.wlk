object colectivo {
  var pasajeros = 0
  const capacidad = 35
  var combustible = 50
  const consumo = 1

  method recargar() {
    combustible = 50
  }
  method consumoActual() {
    return consumo + 0.1 * pasajeros
  }
  method avanzar(sigParada) {
    if (sigParada.ultimaParada()) {
      return self.terminal()
    }
    
    if (combustible >= self.consumoActual()) {
      combustible -= self.consumoActual()
      const nuevos = sigParada.suben()
      if (pasajeros + nuevos <= capacidad) {
        pasajeros += nuevos
        return "Cantidad de pasajeros: " + pasajeros
      }
      return "Alcanzó la máxima capacidad"
    }
    return "No hay suficiente combustible" //no muestra este resultado
  }
  method terminal() {
    pasajeros = 0
    self.recargar()
    return "Última parada. Pasajeros bajan. Combustible recargado."
  }
    method estado() {
    return "Pasajeros: " + pasajeros + ", Combustible: " + combustible
  }
}

class Parada {
  var property suben = 0
  var property ultimaParada = true
}

const parada1 = new Parada(suben = 10, ultimaParada = false)
const parada2 = new Parada(suben = 4, ultimaParada = false)
const parada3 = new Parada(suben = 8, ultimaParada = false)
const parada4 = new Parada(suben = 3, ultimaParada = false)
const parada5 = new Parada(suben = 7, ultimaParada = false)
const parada6 = new Parada(suben = 5)