(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* let generate_name () =
	Random.self_init ();
	let name = "dalek" in
	let c1 = String.make  1 (char_of_int ((Random.int 26)+65)) in
	let c2 = String.make  1 (char_of_int ((Random.int 26)+97)) in 
	let c3 = String.make  1 (char_of_int ((Random.int 26)+97)) in
	name^c1^c2^c3 *)

let random_joke = function
	| 0 -> "Explain! Explain!"
	| 1 -> "Exterminate! Exterminate!"
	| 2 -> "I obey!"
	| _ -> "You are the Doctor! You are the enemy of the Daleks!"

let () = Random.self_init ()

class dalek = 
	let c1 = String.make  1 (char_of_int ((Random.int 26)+65)) in
	let c2 = String.make  1 (char_of_int ((Random.int 26)+97)) in 
	let c3 = String.make  1 (char_of_int ((Random.int 26)+97)) in

	object (me)
		val _name:string = "Dalek"^c1^c2^c3
		val _hp = 100
		val mutable _shield = true

		method get_name = _name
		method get_hp = _hp
		method get_shield = _shield
		method set_shield state = _shield <- state

		initializer print_endline("Something popped .. aaaaaah ... it's a "^me#get_name)
		
		method to_string = "Name: "^me#get_name^" _hp: "^(string_of_int (me#get_hp))^" _shield: "^(string_of_bool me#get_shield)
		method talk = print_endline (random_joke (Random.int 5))
		method die = print_endline ("Emergency Temporal Shift!")

		method exterminate: People.people -> People.people = fun victim -> 
			begin
				me#set_shield (not me#get_shield);
				victim#die				
			end
	end