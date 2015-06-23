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

type coordz = (float array * string)
let is_lower c = c >= 'a' && c <= 'z'
let is_digit c = c >= '0' && c <= '9'

let get_left (left,_) = left
let get_right (_,right) = right

let print_array arrayz size =
	print_string "[|";
	for i=0 to (size-1) do
		print_string (string_of_float (Array.get arrayz i));
		if i != (size-1) then
			print_string "; "
		else
			print_string "|]"
	done

let print_tuple src = print_array (get_left src) (Array.length (get_left src));print_string ", "; print_string ("\""^(get_right src)^"\"")

let print_list lst =
	print_string "{\n";
	let rec print_tuples lst = match lst with
		| [] -> print_endline ")\n}"
		| last::[] -> print_string "[|";
					print_tuple last;
					print_endline ")\n}"
		| first::suite -> print_string "(";
						print_tuple first;
						print_string ");\n";
						print_tuples suite
		in print_tuples lst

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

let rev_list lst = 
	let rec backward lst acc = match lst with
		| [] -> []
		| last::[] -> last::acc
		| first::suite -> backward suite (first::acc)
		in backward lst []

let coma str = 
	let rec loop nb index src =
		if index < (String.length src) then
			if (String.get src index) = ',' then
				loop (nb+1) (index+1) src
			else
				loop (nb) (index+1) src
		else
			nb
	in loop 0 0 str

let sizes_lst lst =
	let int_list = ref [] in
	let rec get_sizes src = function
		| [] -> []
		| last::[] -> src:=(coma last)::!src; !src
		| first::suite -> (src:=(coma first)::!src); get_sizes src suite
	in get_sizes int_list lst

let file_to_list data_lst filez =
	let data = open_in filez in
	try
		while true do
			data_lst := input_line data :: !data_lst
		done;
	with
		| End_of_file -> close_in data
		| _ -> print_endline "Unknown error (file_to_list)."

let transform filez = 
	let data_lst = ref [] in
	let size_lst = ref [] in 
	file_to_list data_lst filez;
	data_lst := rev_list !data_lst;
	size_lst := sizes_lst !data_lst;
	size_lst := !size_lst;
	(* print_endline (List.nth !data_lst 0);
	print_int (List.nth !size_lst 0);
	print_char '\n'; *)
	let lst_return = ref [] in
	for j=0 to (List.length !data_lst)-1 do
		let farray = Array.make (List.nth !size_lst j) 0.0 in
		let str_list = Str.split (Str.regexp "[,]") (List.nth !data_lst j) in
		for i=0 to (List.nth !size_lst 0)-1 do
			farray.(i) <- float_of_string (List.nth str_list i)
		done;
		
		lst_return := (farray, (List.nth str_list (List.nth !size_lst j)))::!lst_return;
		(* print_float farray.(33);
		print_string " ";
		print_endline (List.nth str_list (List.nth !size_lst j)); *)
	done;
	print_endline (string_of_int(List.length !lst_return));
	(* size_lst *)lst_return := rev_list (!lst_return);
	lst_return
	(* print_int (List.nth size_lst 0) *)
	

let main filez =
	let lst = transform filez in
	if !lst = [] then
		print_endline "empty";
	print_list !lst
	(*else *)
	(* print_int (List.nth !lst 0) *)
	(* print_data  *)
		
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
			| Failure err -> print_string "Error: Failure ('"; print_string err; print_endline "')"
			| _ -> print_endline "Unknown error (main)."			
		end

