object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee {
  var estaComoRobot = false
  method estaComoRobot() = estaComoRobot
  method transformarseEnAuto(){
    estaComoRobot = false
  }
  method transformarseEnRobot(){
    estaComoRobot = true
  }
  method peso() = 800
  method peligrosidad() = if(estaComoRobot) 30 else 15
}
object ladrillos {
  var cantidad = 0
  method cantidad(unaCantidad){
    cantidad = unaCantidad
  }
  method peso() = cantidad * 2
  method peligrosidad() = 2
}
object arena {
  var peso = 0
  method peso(unPeso){
    peso = unPeso
  }
  method peso() = peso
  method peligrosidad() = 1
}
object bateriaAntiAerea {
  var estaConMisiles = false
  method cargarMisiles(){
    estaConMisiles = true
  }
  method descargarMisiles(){
    estaConMisiles = false
  }
  method peso() = if(estaConMisiles) 300 else 200
  method peligrosidad() = if(estaConMisiles) 100 else 0
}
object contenedor {
  const cosas = []
  method agregarCosa(unaCosa){
    cosas.add(unaCosa)
  }
  method quitarCosa(unaCosa){
    cosas.remove(unaCosa)
  }
  method agregarVariasCosas(unaListaDeCosas){
    cosas.addAll(unaListaDeCosas)
  }
  method quitarTodo(){
    cosas.clear()
  }
  method pesoDeLasCosas() = cosas.sum({c => c.peso()})
  method peso() = 100 + self.pesoDeLasCosas()
  method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({c=> c.peligrosidad()}).peligrosidad()
}
object residuos {
  var property peso = 0
  method peligrosidad() = 200
}
object embalaje {
  var property cosaEnvuelta = arena
  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
}