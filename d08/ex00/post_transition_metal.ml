(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   post_transition_metal.ml                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class alumonium = 
	object (me)
		inherit Atom.atom "Alumonium" "Al" 13 as super
	end

class gallium = 
	object (me)
		inherit Atom.atom "Gallium" "Ga" 31 as super
	end

class indium = 
	object (me)
		inherit Atom.atom "Indium" "In" 49 as super
	end

class tin = 
	object (me)
		inherit Atom.atom "Tin" "Sn" 50 as super
	end

class thallium = 
	object (me)
		inherit Atom.atom "Thallium" "Tl" 81 as super
	end

class lead = 
	object (me)
		inherit Atom.atom "Lead" "Pb" 82 as super
	end

class bismuth = 
	object (me)
		inherit Atom.atom "Bismuth" "Bi" 83 as super
	end

class ununtium = 
	object (me)
		inherit Atom.atom "Ununtium" "Uut" 113 as super
	end

class flerovium = 
	object (me)
		inherit Atom.atom "Flerovium" "Fl" 114 as super
	end

class ununpentium = 
	object (me)
		inherit Atom.atom "Ununpentium" "Uup" 115 as super
	end

class livermorium = 
	object (me)
		inherit Atom.atom "Livermorium" "Lv" 116 as super
	end
