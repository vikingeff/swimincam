(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkali_metal.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class lithium = 
	object (me)
		inherit Atom.atom "Lithium" "Li" 3 as super
	end

class sodium = 
	object (me)
		inherit Atom.atom "Sodium" "Na" 11 as super
	end

class potassium = 
	object (me)
		inherit Atom.atom "Potassium" "K" 19 as super
	end

class rubidium = 
	object (me)
		inherit Atom.atom "Rubidium" "Rb" 37 as super
	end

class caesium = 
	object (me)
		inherit Atom.atom "Caesium" "Cs" 55 as super
	end

class francium = 
	object (me)
		inherit Atom.atom "Francium" "Fr" 87 as super
	end
