(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 18:08:27 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 18:08:28 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fill_array arrayz size = 
	Random.self_init ();
	let rec generate_array index =
		if index < size then
			begin
				let neg = Random.int 2 in
				if neg = 0 then
					begin
						arrayz.(index) <- (Random.float 1.);
						generate_array (index+1)
					end
				else
					begin
						arrayz.(index) <- (Random.float (-1.));
						generate_array (index+1)
					end
			end
	in generate_array 0

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


let main dim =
	if dim <= 0 then
		raise (Invalid_argument "Error: Need a positive int value !")
	else
		begin
			let coord1 = Array.make dim 0.0 in
			let coord2 = Array.make dim 0.0 in
			let coord3 = Array.make (dim+1) 0.0 in
			print_endline ("There is "^(string_of_int dim)^" dimension.");
			fill_array coord1 dim;
			fill_array coord2 dim;
			print_array coord1 dim;
			print_array coord2 dim;
			print_endline "The Euclidian distance between those two points is about :";
			print_float (get_dist coord1 coord2);
			print_char '\n';
			print_float (get_dist coord1 coord3)
		end
	
	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 1 then
		print_endline "Error: Need a dimension number !"
	else if (List.length argv) > 2 then
		print_endline "Error: Need less args."
	else
		begin
			try
				main (int_of_string(List.nth argv 1))
			with
			| Invalid_argument err -> print_endline err
			| Failure err -> print_endline "Error: Please give me at least a number."
			| _ -> print_endline "Unknown error."			
		end

