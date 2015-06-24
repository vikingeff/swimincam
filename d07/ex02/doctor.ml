(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor name age = 
	object (me)
		val _name:string = name
		val _age:int = age
		val _hp = 100
		val _sidekick:People.people = new People.people ("Rose")

		method get_name = _name
		method get_hp = _hp
		method get_age = _age
		method get_sidekick = _sidekick

		initializer print_endline("A new doctor called "^me#get_name^" appeared. He's ruggedly handsome and is "^(string_of_int (me#get_age))^" years old.")
		
		method to_string = "Name: "^me#get_name^" _age: "^(string_of_int (me#get_age))^" _hp: "^(string_of_int (me#get_hp))
		method talk = print_endline ("Hi ! I'm the Doctor!")
		method die = print_endline ("Aaaarghh!")
		method use_sonic_screwdriver = print_endline ("Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii")

		method private regenerate = {< _name = me#get_name; _age = me#get_age; _hp = 100 ; _sidekick = me#get_sidekick ;>}

		method tardis =
			begin
				print_endline ("\t\t\t\t╔═══╩═══╗  
\t\t\t\t╠╦╦╦═╦╦╦╣
\t\t\t\t╠╬╬╣ ╠╬╬╣
\t\t\t\t╠╩╩╣ ╠╩╩╣
\t\t\t\t║░░║ ║  ║
\t\t\t\t╠══╣ ╠══╣
\t\t\t\t║  ║ ║  ║
\t\t\t\t╠══╣ ╠══╣
\t\t\t\t║  ║ ║  ║
\t\t\t\t╩══╩═╩══╩")
			end
		method travel_in_time: int -> int -> unit = fun start arrival ->
			begin 
				me#tardis;
				print_endline ("\t\t\tTravelling from "^(string_of_int start)^" to "^(string_of_int arrival));
				print_endline (me#regenerate)#to_string
			end 
	end
