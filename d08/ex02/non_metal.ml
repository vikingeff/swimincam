(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   non_metal.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class hydrogen = 
	object (me)
		inherit Atom.atom "Hydrogen" "H" 1 as mom	
	end

class carbon = 
	object (me)
		inherit Atom.atom "Carbon" "C" 6 as mom	
	end

class nitrogen = 
	object (me)
		inherit Atom.atom "Nitrogen" "N" 7 as mom	
	end

class oxygen = 
	object (me)
		inherit Atom.atom "Oxygen" "O" 8 as mom	
	end

class phosphorus = 
	object (me)
		inherit Atom.atom "Phosphorus" "P" 15 as mom	
	end

class sulfur = 
	object (me)
		inherit Atom.atom "Sulfur" "S" 16 as mom	
	end

class selenium = 
	object (me)
		inherit Atom.atom "Selenium" "Se" 34 as mom	
	end
