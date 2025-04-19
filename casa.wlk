import cosas.* 

object casaDePepeYJulian {

    const cosasCompradas = []

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
        return cosasCompradas.filter({cosa => !lista.contains(cosa)})
    }

    method faltaComida() {
        return self.comprados(comida).size() < 2
    }

    method categoríasCompradas(){
        return self.obtenerCategorias().uniqueElement()
    }

    //Utils
    method obtenerCategorias(){
        return cosasCompradas.map({cosa => cosa.categoria()})
    }

    method obtenerPrecios(){
        return cosasCompradas.map({cosa => cosa.precio()})
    }

    
}

