(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkali_earth_metal.ml                              :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class beryllium = 
	object (me)
		inherit Atom.atom "Beryllium" "Be" 4 as mom	
	end

class magnesium = 
	object (me)
		inherit Atom.atom "Magnesium" "Mg" 12 as mom	
	end

class calcium = 
	object (me)
		inherit Atom.atom "Calcium" "Ca" 20 as mom	
	end

class strontium = 
	object (me)
		inherit Atom.atom "Strontium" "Sr" 38 as mom	
	end

class barium = 
	object (me)
		inherit Atom.atom "Barium" "Ba" 56 as mom	
	end

class radium = 
	object (me)
		inherit Atom.atom "Radium" "Ra" 88 as mom	
	end
