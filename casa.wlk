import cosas.*

object casaDePepeYJulian {
  const cosasCompradas = []
  var cuentaCorriente = 0
  var cuentaConGastos = 0
  var costoOperacion = 0
  
  //Metodos de la casa
  method cosasCompradas() = cosasCompradas
  
  method comprar(cosa) {
    self.extraerEnCuentaCorriente(cosa.precio())
    return cosasCompradas.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
  method tieneAlgun(categoria) = self.obtenerCategorias().contains(categoria)
  
  method vieneDeComprar(categoria) = self.obtenerCategorias().last() == categoria
  
  method esDerrochona() = self.obtenerPrecios().sum() > 9000
  
  method compraMasCara() = cosasCompradas.max({ cosa => cosa.precio() })
  
  method comprados(categoria) = cosasCompradas.filter({ cosa => cosa.categoria() == categoria })
  
  method malaEpoca() = !(self.tieneAlgun(electrodomestico) || self.tieneAlgun(mueble))
  
  method queFaltaComprar(lista) = lista.filter({ cosa => !cosasCompradas.contains(cosa) })
  
  method faltaComida() = self.comprados(comida).size() < 2
  
  method categoriasCompradas() = self.obtenerCategorias().asSet()
  
  //Metodos de cuentas bancarias
  method cuentaCorriente() = cuentaCorriente
  
  method cuentaCorriente(_saldo) {
    cuentaCorriente = _saldo
  }
  
  method cuentaConGastos() = cuentaConGastos
  
  method cuentaConGastos(_saldo) {
    cuentaConGastos = _saldo
  }
  
  method depositarEnCuentaCorriente(saldo) {
    cuentaCorriente += saldo
  }
  
  method depositarEnCuentaGastos(saldo) {
    if (saldo > 1000) {
      self.error("El saldo que se intenta cargar supera los $1000.")
    } else {
      cuentaConGastos += saldo - costoOperacion
    }
  }
  
  method extraerEnCuentaCorriente(saldo) {
    if (saldo > cuentaCorriente) {
      self.error("El saldo que se intenta extraer es mayor a los fondos disponibles")
    } else {
      cuentaCorriente -= saldo
    }
  }
  
  method extraerEnCuentaConGastos(saldo) {
    cuentaConGastos -= saldo
  }
  
  method costoOperacion() = costoOperacion
  
  method costoOperacion(_monto) {
    costoOperacion = _monto
  }
  
  //Utils
  method obtenerCategorias() = cosasCompradas.map({ cosa => cosa.categoria() })
  
  method obtenerPrecios() = cosasCompradas.map({ cosa => cosa.precio() })
}