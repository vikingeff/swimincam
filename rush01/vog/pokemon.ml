
let mI x = 
	if x < 0 then 0
	else if x > 100 then 100
	else x

class pokemon =	object (self)

	val _health : int = 100
	val _hygiene : int = 100
	val _energy : int = 100
	val _happyness : int = 100

	method eat = {< _health = mI(_health + 25); _energy = mI(_energy - 10); _hygiene = mI(_hygiene - 20); _happyness = mI(_happyness + 5) >} 
	method thunder = {< _health = mI(_health - 20); _energy = mI(_energy + 25); _hygiene = mI _hygiene; _happyness = mI(_happyness - 20) >} 
	method bath = {< _health = mI(_health - 20); _energy = mI(_energy - 10); _hygiene = mI(_hygiene + 25); _happyness = mI(_happyness + 5) >} 
	method kill = {< _health = mI(_health - 20); _energy = mI(_energy - 10); _hygiene = _hygiene; _happyness = mI(_happyness + 20) >} 
	method dance = self#thunder
	method walk = self#thunder
	method hello = self#kill
	method roar = self#eat

	method is_dead =
		(_health <= 0) || (_hygiene <= 0) || (_energy <= 0) || (_happyness <= 0)

	method entropy = {< _health = mI(_health - 1); _energy = _energy; _hygiene = _hygiene; _happyness = _happyness >} 

	method to_string =
		("---------\nHealth : " ^ (string_of_int _health) ^
		"\nHygiene : " ^ (string_of_int _hygiene) ^
		"\nEnergy : " ^ (string_of_int _energy) ^
		"\nHapyness : " ^ (string_of_int _happyness))

	method health = _health
	method hygiene = _hygiene
	method energy = _energy
	method happyness = _happyness

	method from_file fl =
		 let read_int () = Scanf.fscanf fl " %d" (fun n -> n) in
		 {< _health = mI(read_int()); _energy = mI(read_int()); _hygiene = mI(read_int()); _happyness = mI(read_int()) >} 
end
