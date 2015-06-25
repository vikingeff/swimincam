(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom name symbol atomic_number = 
	object (me)
		val _name:string = name
		val _symbol:string = symbol
		val _atomic_number:int = atomic_number 

		method name = _name
		method symbol = _symbol
		method atomic_number = _atomic_number

		initializer print_endline(me#name^" atom created.")
		
		method to_string = "Name: "^me#name^" Symbol: "^me#symbol^" Atomic number: "^(string_of_int (me#atomic_number))
		method equals (you: atom) = (me#name = you#name) && (me#symbol = me#symbol) && (me#atomic_number = you#atomic_number)
	end
