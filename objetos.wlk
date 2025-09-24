/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
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
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}


/*
pelota.position( pelota.position.x().lest(2).max(0), pelota.position().y()
)
*/