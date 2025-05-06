import cosas.*
object camion {
  const carga = []
  method cargarCosa(unaCosa){
    carga.add(unaCosa) 
    unaCosa.consecuenciaDeLaCarga()
  }
  method descargarCosa(unaCosa){
    carga.remove(unaCosa)
  }
  method cargaTotal() = carga.sum({c=>c.peso()})
  method pesoTotal() = 1000 + self.cargaTotal()
  method todoPesoPar() = carga.all({c=>c.peso().even()})
  method algoQuePesa(unValor) = carga.any({c=>c.peso() == unValor})
  method cosaConPeligrosidad(unNivel) = carga.find({c=>c.peligrosidad() == unNivel})
  method cosasSuperanPeligrosidad(unNivel) = carga.filter({c=>c.peligrosidad() > unNivel})
  method cosasMasPeligrosasQue(unaCosa) = carga.filter({c=>c.peligrosidad() > unaCosa.peligrosidad()})
  method excedidoDePeso() = self.pesoTotal() > 2500
  method puedeCircular(unNivel) = not self.excedidoDePeso() && self.cosasSuperanPeligrosidad(unNivel).isEmpty()
  method tieneAlgoQuePesaEntre(min,max) = carga.any({c=>c.peso().between(min, max)})
  method cosaMasPesada() = carga.max({c=>c.peso()})
}