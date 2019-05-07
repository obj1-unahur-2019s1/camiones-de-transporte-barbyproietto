object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){return 1}
	
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto(){return 2}
	
}

object paqueteDeLadrillos {
	var cantidad = 0
	method cantidad() {return 20}
	method peso() { return self.cantidad() * 2 }
	method nivelPeligrosidad() { return 2 }
	method bulto(){
		if(cantidad.between(1,100)){return 1}
		else if(cantidad.between(101,300)){return 2}
		else{return 3}
	}
}
object arenaAGranel {
	method cantidad() {return 30}
	method peso() { return self.cantidad() }
	method nivelPeligrosidad() { return 1 }
	method bulto(){return 1}
	
}

object bateriaAntiaerea {
	var tieneMisiles = true
	method peso() { if (tieneMisiles) {return 300} else {return 200}}
	method nivelPeligrosidad() {if (tieneMisiles) {return 100} else {return 0} }
	method bulto(){
		if(tieneMisiles){return 2}
		else{return 1}
	}
}

object contenedorPortuario{
	var cosasContenedor = [knightRider]
	 method peso(){
	 	return cosasContenedor.sum({cosa => cosa.peso()}) + 100 }
	 	
	method nivelPeligrosidad(){
		if(cosasContenedor.size() == 0) {return 0}
		else{ 
		return cosasContenedor.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()}
	}
	method bulto(){
		return cosasContenedor.sum({cosas=>cosas.bulto()})+1}
}
object residuosRadioactivos {
	method cantidad() {return 30}
	method peso() { return self.cantidad() }
	method nivelPeligrosidad() { return 200 }
	method bulto(){return 1}	
}

object embalajeDeSeguridad{
	var cosas = 0
	method embalar(cosa) {cosas=cosa}
	method peso() { return cosas.peso() }
	method nivelPeligrosidad() { return cosas.peso() / 2}
	method bulto(){return 2}
	
}