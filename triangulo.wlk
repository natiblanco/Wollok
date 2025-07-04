class Triangulo {
    var property lado1 = 0
    var property lado2 = 0
    var property lado3 = 0

    method esValido() {
        return (lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1)
    }

    method esEquilatero() {
        return self.esValido() && (lado1 == lado2 && lado2 == lado3)
    }

    method esIsosceles() {
        return self.esValido() && 
        ((lado1 == lado2) || (lado2 == lado3) || (lado1 == lado3) && 
        !(lado1 == lado2 && lado2 == lado3))
    }

    method esEscaleno() {
        return self.esValido() && (lado1 != lado2 && lado1 != lado3 && lado2 != lado3)
    }
}