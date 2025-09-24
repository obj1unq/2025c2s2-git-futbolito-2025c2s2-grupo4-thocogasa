/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var estadoDeCamiseta = titular
	method image() {
		//return "lionel-titular.png"
		return "lionel-" + estadoDeCamiseta.nombreDeEstado() + ".png"
	}
//validacion self.error(lionel no esta en la posicion)
	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method estadoDeCamiseta() {return estadoDeCamiseta }

// el jugador se manda a si mismo como parametro
//en vez de usar if hacemos doble ______ dispatch 
	method cambiarEstadoDeCamiseta() {
	  self.validarQueLionelEstaEnBordeIzquierdo()
	  estadoDeCamiseta.cambiarAEstado(self)
	} 
	// aca el jugador dice que cambia al suṕlente/titular
	method cambiarASuplente() {
	  console.println(estadoDeCamiseta)
	  estadoDeCamiseta = suplente 
	  console.println(estadoDeCamiseta)
	  
	}
	method cambiarATitular() {
	  estadoDeCamiseta = titular
	}
	//crearemos Validar que solo se puede realizar si lionel está sobre el borde izquierdo (El x de la posición debe ser 0)

	method validarQueLionelEstaEnBordeIzquierdo() {
	  if(not (position.x() == 0)){
		self.error("No esta en la izquierda")
	  }
	}
	


	method taquito(){
		
		self.validarPatear()
		if(self.tieneEspacioParaTaquito()){
			pelota.position().left(2)
		} else{
			pelota.position().x().min()
		}
	}

	method validarPatear(){
		if(!self.posesionDeLaPelota()){
			self.error("No tiene la pelota")
		}
	}

	method posesionDeLaPelota() = pelota.position() == self.position()

	method tieneEspacioParaTaquito() = pelota.position.x() >= 2

	method levantarla(){
		self.validarPatear()
		pelota.position( pelota.position().up(1))
		game.schedule(2*1000, {
			pelota.position( pelota.position().down(1))
			}
		)
	}

	method buscarla() {
		position =  pelota.position()
	}
	

}


// crear objeto de estado de las camisetas con lionel 
object titular{
	method cambiarAEstado(jugador){
		jugador.cambiarASuplente()
	}
	method nombreDeEstado() {
	return "titular"
  }
}
object suplente {
  method nombreDeEstado() {
	return "suplente"
  }
  method cambiarAEstado(jugador){
		jugador.cambiarATitular()
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method irAlOrigen() {
		position = game.at(0, position.y())
	}	
}

