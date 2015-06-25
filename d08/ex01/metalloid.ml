(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   metalloid.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class boron = 
	object (me)
		inherit Atom.atom "Boron" "B" 5 as mom	
	end

class silicon = 
	object (me)
		inherit Atom.atom "Silicon" "Si" 14 as mom	
	end

class germanium = 
	object (me)
		inherit Atom.atom "Germanium" "Ge" 32 as mom	
	end

class arsenic = 
	object (me)
		inherit Atom.atom "Arsenic" "As" 33 as mom	
	end

class antimony = 
	object (me)
		inherit Atom.atom "Antimony" "Sb" 51 as mom	
	end

class tellurium = 
	object (me)
		inherit Atom.atom "Tellurium" "Te" 52 as mom	
	end

class polonium = 
	object (me)
		inherit Atom.atom "Polonium" "Po" 84 as mom	
	end
