(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 10:24:44 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 10:24:45 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let micronap nb =
	for i=0 to nb do
		my_sleep ()
	done
	
let main arg =
	try
		micronap (int_of_string arg)
	with
		| Failure err -> print_endline "Error: You must provide an int !"
		| _ -> print_endline "Error: There was an error !" 

	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 1 then
		print_endline "Error: Need an int arg."
	else if (List.length argv) > 2 then
		print_endline "Error: Need less args."
	else 
		main (List.nth argv 1) 
