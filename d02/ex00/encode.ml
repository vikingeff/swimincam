(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 10:13:21 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/17 10:13:22 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let get_left (left,_) = left
let get_right (_,right) = right
let print_tuple src = print_int (get_left src);print_string ", ";print_int(get_right src)

let print_list lst =
	print_string "[";
	let rec print_tuples lst = match lst with
		| [] -> print_endline "]"
		| last::[] -> print_string "(";
					print_tuple last;
					print_endline ")]"
		| first::suite -> print_string "(";
						print_tuple first;
						print_string "); ";
						print_tuples suite
		in print_tuples lst

let rev_list lst = 
	let rec backward lst acc = match lst with
		| [] -> []
		| last::[] -> last::acc
		| first::suite -> backward suite (first::acc)
		in backward lst [] 

let encode lst =
	let rec count lst nb acc = match lst with
		| [] -> []
		| last::[] -> (nb, last)::acc
		| first::(suite::_ as tail) -> if first = suite then count tail (nb+1) (acc)
						else count tail 1 ((nb, first)::acc)
		in count lst 1 []

let main () =
	print_string ("encode [11;12;21;21;18]: ");
	print_list (rev_list(encode [11;12;21;21;18]));
	print_string ("encode [118]: ");
	print_list (rev_list(encode [118]));
	print_string ("encode [42;42;42;42;42;42]: ");
	print_list (rev_list(encode [42;42;42;42;42;42]))(*;
	print_list (rev_list(encode ['a';'a';'a';'t';'P';'W';'W']))*)

(* ************************************************************************** *)
let () = main ()
