(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   examples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 18:08:27 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 18:08:28 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let print_array arrayz size =
	print_string "Point of coordinate [|";
	for i=0 to (size-1) do
		print_string (string_of_float (Array.get arrayz i));
		if i != (size-1) then
			print_string ", "
		else
			print_string "|]\n"
	done

let get_dist ar1 ar2 =
	if Array.length ar1 != Array.length ar2 then
		raise (Invalid_argument "Error: The arrayz are not from the same dimension !")
	else
	begin
		let rec sub index acc =
			if index < Array.length ar1 then
				sub (index+1) (acc+.(((Array.get ar1 index) -. (Array.get ar2 index))**2.))
			else
				sqrt(acc)
		in sub 0 0.0
	end

let transform filez = 
	let data = open_in filez in
	let coordz = input_line data in
	print_endline coordz;
	close_in data

let main filez =
	let lst = transform filez in
	print_data 
		
	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 1 then
		print_endline "Error: Need the name of a file to work!"
	else if (List.length argv) > 2 then
		print_endline "Error: Need less args."
	else
		begin
			try
				main (List.nth argv 1)
			with
			| Sys_error err -> print_endline "Error: Yeah like that file exists ..."
			| Invalid_argument err -> print_endline err
			| Failure err -> print_endline "Error: Please give me at least a number."
			| _ -> print_endline "Unknown error."			
		end

