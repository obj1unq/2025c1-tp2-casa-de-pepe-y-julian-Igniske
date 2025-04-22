import cosas.*

object casaDePepeYJulian {
  const cosasCompradas = []
  var property metodoDePago = cuentaCorriente
  
  method cosasCompradas() = cosasCompradas
  
  method comprar(cosa) {
    metodoDePago.extraer(cosa.precio())
    return cosasCompradas.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
  method tieneAlgun(categoria) = self.cosasCompradas().any({cosa => cosa.categoria().equals(categoria)})
  
  method vieneDeComprar(categoria) = cosasCompradas.last().categoria() == categoria
  
  method esDerrochona() = cosasCompradas.sum({cosa => cosa.precio()}) > 9000
  
  method compraMasCara() = cosasCompradas.max({ cosa => cosa.precio() })
  
  method comprados(categoria) = cosasCompradas.filter({ cosa => cosa.categoria() == categoria })
  
  method malaEpoca() = !(self.tieneAlgun(electrodomestico) || self.tieneAlgun(mueble))
  
  method queFaltaComprar(lista) = lista.filter({ cosa => !cosasCompradas.contains(cosa) })
  
  method faltaComida() = self.comprados(comida).size() < 2
  
  method categoriasCompradas() = self.obtenerCategorias().asSet()
  
  method obtenerCategorias() = cosasCompradas.map({ cosa => cosa.categoria() })
  
  method obtenerPrecios() = cosasCompradas.map({ cosa => cosa.precio() })
}

object cuentaCorriente{
  var property balance = 0

  method depositar(saldo) {
    balance += saldo
  }
  
  method extraer(saldo) {
      self.validarMonto(saldo)
      balance -= saldo
    
  }

  method validarMonto(saldo){
    if (saldo > balance){
      self.error("El saldo de $" + saldo + " que se intenta extraer es mayor a los fondos disponibles: $" + balance)
    }
      
  }

}

object cuentaConGastos{
  var property balance = 0
  var property costoOperacion = 0

    method depositar(saldo) {
      self.validarMonto(saldo)
      balance += saldo - costoOperacion
  }

    method extraer(saldo) {
    balance -= saldo
  }

  method validarMonto(saldo){
     if (saldo > 1000) {
      self.error("El saldo de $" + saldo + " supera el limite de $1000.")
    }
  }
}