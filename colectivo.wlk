class Parada {
 var property nombre = ""
 var property suben = 0
 var property pendientes = 0
 }
object bondi {
 var property pasajeros = 0
 const capacidad = 30
 var property combustible = 30
 const consumo = 1
 var property ida = true
 var property paradaActual = 0
 var property paradas = []

method consumoActual(pasajerosQueSuben) {
 return consumo + 0.1 * pasajerosQueSuben
 }
method recargar() {
 combustible = 30
 }
 
method avanzar() {
 if (paradaActual < 0 || paradaActual >= paradas.size()) {
 return "Error: No existe la parada."
 }
const parada = paradas.get(paradaActual)
const nuevos = parada.suben()
const pendientes = parada.pendientes()
var subenAhora = 0 
if (ida) {
    const espacio = capacidad - pasajeros
    if (nuevos <= espacio) {
      pasajeros += nuevos
      parada.pendientes(0)
      subenAhora = nuevos
    } else {
      pasajeros += espacio
      parada.pendientes(nuevos - espacio)
      subenAhora = espacio
    }
} else {
  const espacio = capacidad - pasajeros
  if (pendientes <= espacio) {
    pasajeros += pendientes
    parada.pendientes(0)
    subenAhora = pendientes
  } else {
    pasajeros += espacio
    parada.pendientes(pendientes - espacio)
    subenAhora = espacio
  }
}

if (combustible < self.consumoActual(subenAhora)) {
  return "No hay suficiente combustible."
}

combustible -= self.consumoActual(subenAhora)

if ((paradaActual == paradas.size() - 1 && ida) || (paradaActual == 0 && !ida)) {
  pasajeros = 0
  self.recargar()
  ida = !ida
  console.println("Terminal en " + parada.nombre() + ". Pasajeros bajan. Combustible recargado.")
  }

if (ida) {
  paradaActual += 1
} else {
  paradaActual -= 1
}

var mostrarSuben = ""
if (ida) {
  mostrarSuben = nuevos
} else {
  mostrarSuben = pendientes
}
return "Avanzando a parada " + parada.nombre() +
       ". Suben: " + mostrarSuben +
       ". Pasajeros: " + pasajeros +
       ". Pendientes: " + parada.pendientes() +
       ". Combustible: " + combustible

}
method estado() {
 return "Pasajeros: " + pasajeros + ", Combustible: " + combustible + ", Parada actual: " + paradaActual
 }
 }
object sistema {
 method iniciar() {
 bondi.paradas([
 new Parada(nombre = "Parada 0", suben = 10),
 new Parada(nombre = "Parada 1", suben = 9),
 new Parada(nombre = "Parada 2", suben = 7),
 new Parada(nombre = "Parada 3", suben = 5),
 new Parada(nombre = "Parada 4", suben = 8),
 new Parada(nombre = "Parada 5", suben = 11),
 new Parada(nombre = "Parada 6", suben = 6),
 new Parada(nombre = "Parada 7")
 ])
 bondi.paradaActual(0)
 }
 }