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
	
	method validarPatear(){ 
		if(  position!= pelota.position()){ 
			self.error("no puedo patear")}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method irAlOrigen() {
		position = game.at(0, position.y())
	}	
}
