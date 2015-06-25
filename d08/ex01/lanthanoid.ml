(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   lanthanoid.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class lanthanum = 
	object (me)
		inherit Atom.atom "Lanthanum" "La" 57 as mom	
	end

class cerium = 
	object (me)
		inherit Atom.atom "Cerium" "Ce" 58 as mom	
	end

class praseodymium = 
	object (me)
		inherit Atom.atom "Praseodymium" "Pr" 59 as mom	
	end

class neodymium = 
	object (me)
		inherit Atom.atom "Neodymium" "Nd" 60 as mom	
	end

class promethium = 
	object (me)
		inherit Atom.atom "Promethium" "Pm" 64 as mom	
	end

class samarium = 
	object (me)
		inherit Atom.atom "Samarium" "Sm" 62 as mom	
	end

class europium = 
	object (me)
		inherit Atom.atom "Europium" "Eu" 63 as mom	
	end

class gadolinium = 
	object (me)
		inherit Atom.atom "Gadolinium" "Gd" 64 as mom	
	end

class terbium = 
	object (me)
		inherit Atom.atom "Terbium" "Tb" 65 as mom	
	end

class dysprosium = 
	object (me)
		inherit Atom.atom "Dysprosium" "Dy" 66 as mom	
	end

class holmium = 
	object (me)
		inherit Atom.atom "Holmium" "Ho" 67 as mom	
	end

class erbium = 
	object (me)
		inherit Atom.atom "Erbium" "Er" 68 as mom	
	end

class thulium = 
	object (me)
		inherit Atom.atom "Thulium" "Tm" 69 as mom	
	end

class ytterbium = 
	object (me)
		inherit Atom.atom "ytterbium" "Yb" 70 as mom	
	end

class lutetium = 
	object (me)
		inherit Atom.atom "Lutetium" "Lu" 71 as mom	
	end
