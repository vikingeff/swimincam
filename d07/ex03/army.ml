(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a, 'b] army (type:'a) (nb:'b)  = 
	object (me)
		val _member:'a list = []

		method get_member = _member
		method add peon = _member <- peon::me#get_member

		initializer 
			begin
				print_endline "Something popped .. aaaaaah ... it's a ... ";
				for i=0 to nb do 

				done
			end
		
		method to_string = "Name: "^me#get_name^" _hp: "^(string_of_int (me#get_hp))^" _shield: "^(string_of_bool me#get_shield)
		method talk = print_endline (random_joke (Random.int 5))
		method die = print_endline ("Emergency Temporal Shift!")

		method exterminate: People.people -> People.people = fun victim -> 
			begin
				me#set_shield (not me#get_shield);
				victim#die				
			end
	end