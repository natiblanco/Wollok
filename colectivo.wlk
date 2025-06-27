class Parada {
 var property nombre = ""
 var property suben = 0
 }
object colectivo {
 var pasajeros = 0
 const capacidad = 35
 var combustible = 20
 const consumo = 1
 var property ida = true
 var property paradaActual = 0
 var property paradas = []

method consumoActual() {
 return consumo + 0.1 * pasajeros
 }
method recargar() {
 combustible = 20
 }
 
method avanzar() {
 if (paradaActual < 0 || paradaActual >= paradas.size()) {
 return "Error: No existe la parada."
 }
const parada = paradas.get(paradaActual)

if (paradaActual == paradas.size() - 1) {
  pasajeros = 0
  self.recargar()
  ida = !ida
  console.println ("Terminal en " + parada.nombre() + ". Pasajeros bajan. Combustible recargado.")
}

if (combustible < self.consumoActual()) {
  return "No hay suficiente combustible."
}

combustible -= self.consumoActual()

const nuevos = parada.suben()
if (pasajeros + nuevos <= capacidad) {
    pasajeros += nuevos
}

if (ida) {
  paradaActual += 1
} else {
  paradaActual -= 1
}

return "Avanzando a parada " + parada.nombre() +
       ". Suben: " + nuevos +
       ". Pasajeros: " + pasajeros +
       ". Combustible: " + combustible

}
method estado() {
 return "Pasajeros: " + pasajeros + ", Combustible: " + combustible + ", Parada actual: " + paradaActual
 }
 }
object sistema {
 method iniciar() {
 colectivo.paradas([
 new Parada(nombre = "Parada 0", suben = 5),
 new Parada(nombre = "Parada 1", suben = 4),
 new Parada(nombre = "Parada 2", suben = 6),
 new Parada(nombre = "Parada 3", suben = 3),
 new Parada(nombre = "Parada 4", suben = 2),
 new Parada(nombre = "Parada 5", suben = 3)
 ])
 colectivo.paradaActual(0)
 }
 }