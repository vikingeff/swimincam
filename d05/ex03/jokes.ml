(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 16:11:02 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 16:11:04 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let create_array file = 
	let input = open_in file in 
	let nb_jokes = int_of_string (input_line input) in
	let arrayz = Array.make nb_jokes "" in	
		for i=0 to (nb_jokes-1) do
			arrayz.(i) <- (input_line input)
		done;
	close_in input;
	arrayz

let main file =
	let jokez = create_array file in
	let input = open_in file in 
	let nb_jokes = int_of_string (input_line input) in
	close_in input;
	Random.self_init ();
	let index = Random.int nb_jokes in
	print_endline jokez.(index)

	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 1 then
		print_endline "Error: Need the name of joke file !"
	else if (List.length argv) > 2 then
		print_endline "Error: Need less args."
	else 
		main (List.nth argv 1)