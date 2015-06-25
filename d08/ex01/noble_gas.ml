(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   noble_gas.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class helium = 
	object (me)
		inherit Atom.atom "Helium" "He" 2 as mom	
	end

class neon = 
	object (me)
		inherit Atom.atom "Neon" "Ne" 10 as mom	
	end

class argon = 
	object (me)
		inherit Atom.atom "Argon" "Ar" 18 as mom	
	end

class krypton = 
	object (me)
		inherit Atom.atom "Krypton" "Kr" 36 as mom	
	end

class xenon = 
	object (me)
		inherit Atom.atom "Xenon" "Xe" 54 as mom	
	end

class radon = 
	object (me)
		inherit Atom.atom "Radon" "Rn" 86 as mom	
	end

class ununoctium = 
	object (me)
		inherit Atom.atom "Ununoctium" "Uuo" 118 as mom	
	end
