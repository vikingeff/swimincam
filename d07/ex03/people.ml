(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people name = 
	object (me)
		val _name:string = name
		val _hp = 100

		method get_name = _name
		method get_hp = _hp

		initializer print_endline("Random people named "^me#get_name^" appeared with "^(string_of_int (me#get_hp))^" life points.")
		
		method to_string = "Name: "^me#get_name^" _hp: "^(string_of_int (me#get_hp))
		method talk = print_endline ("I'm "^(me#get_name)^"! Do you know the Doctor?")
		method die = 
			begin
				print_endline ("Aaaarghh!");
				{< _name = me#get_name; _hp = 0 >}
			end
	end
