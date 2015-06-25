(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   halogen.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class fluorine = 
	object (me)
		inherit Atom.atom "Fluorine" "F" 9 as super
	end

class chlorine = 
	object (me)
		inherit Atom.atom "Chlorine" "Cl" 17 as super
	end

class bromine = 
	object (me)
		inherit Atom.atom "Bromine" "Br" 35 as super
	end

class iodine = 
	object (me)
		inherit Atom.atom "Iodine" "I" 53 as super
	end

class astatine = 
	object (me)
		inherit Atom.atom "Astatine" "At" 85 as super
	end

class ununseptium = 
	object (me)
		inherit Atom.atom "Ununseptium" "Uus" 117 as super
	end
