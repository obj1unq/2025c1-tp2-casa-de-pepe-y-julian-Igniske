import cosas.* 

object casaDePepeYJulian {

    const cosasCompradas = []

    method cosasCompradas(){
        return cosasCompradas
    }

    method comprar(cosa){
        return cosasCompradas.add(cosa)
    }

    method cantidadDeCosasCompradas(){
        return cosasCompradas.size()
    }

    method tieneAlgun(categoria){
        return self.obtenerCategorias().contains(categoria)
    }

    method vieneDeComprar(categoria){
        return self.obtenerCategorias().last() == categoria
    }

    method esDerrochona(){
        return self.obtenerPrecios().sum() > 9000
    }

    method compraMasCara(){
        return cosasCompradas.max({cosa => cosa.precio()})
    }

    method comprados(categoria){
        return cosasCompradas.filter({cosa => cosa.categoria() == categoria})
    }

    method malaEpoca(){
        return !(self.tieneAlgun(electrodomestico) || self.tieneAlgun(mueble))
    }

    method queFaltaComprar(lista){
        return lista.filter({cosa => !cosasCompradas.contains(cosa)})
    }

    method faltaComida() {
        return self.comprados(comida).size() < 2
    }

    method categoriasCompradas(){
        return self.obtenerCategorias().asSet()
    }

    //Utils
    method obtenerCategorias(){
        return cosasCompradas.map({cosa => cosa.categoria()})
    }

    method obtenerPrecios(){
        return cosasCompradas.map({cosa => cosa.precio()})
    }

    
}

