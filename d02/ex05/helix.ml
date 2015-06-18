(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 17:52:23 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/18 17:52:25 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = {
	phosphate : phosphate;
	deoxyribose : deoxyribose;
	nucleobase : nucleobase
}
type helix = nucleotide list

(* comestique needed by print_helix *)

let print_nucleo_base nucleo =
	let define_nucleo = function
		| A -> print_string "A"
		| T -> print_string "T"
		| C -> print_string "C"
		| G -> print_string "G"
		| None -> print_string "None"
	in define_nucleo nucleo

(* cosmetique sexy print *)

let print_helix lst =
	print_string "[";
	let rec print_nucleobase = function
		| [] -> print_endline "]"
		| last::[] -> print_nucleo_base last.nucleobase; print_endline "]"
		| first::suite -> print_nucleo_base first.nucleobase;
						print_string "; ";
						print_nucleobase suite
	in print_nucleobase lst

(* needed by helix_to_string *)

let string_of_nucleobase = function
	| A -> "A"
	| T -> "T"
	| C -> "C"
	| G -> "G"
	| _ -> "None"

(* function 02 ex05 d02 *)

let helix_to_string:helix -> string = fun helix -> 
	let rec loop str = function
	| [] -> str
	| first::suite -> loop (str ^(string_of_nucleobase first.nucleobase)) suite 
	in loop "" helix

(* function 01 ex04 d02 *)

let generate_nucleotide letter =
	let nucleochoice = function
		| 'a' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = A }
		| 'A' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = A }
		| 't' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = T }
		| 'T' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = T }
		| 'c' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = C }
		| 'C' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = C }
		| 'g' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = G }
		| 'G' -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = G }
		| _ -> { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = None }
	in nucleochoice letter

(* needed by complementary_helix *)

let generate_match = function
	| A -> generate_nucleotide 'T'
	| T -> generate_nucleotide 'A'
	| C -> generate_nucleotide 'G'
	| G -> generate_nucleotide 'C'
	| _ -> generate_nucleotide 'W' 

(* needed by complementary_helix *)

let rev_list lst = 
	let rec backward lst acc = match lst with
		| [] -> []
		| last::[] -> last::acc
		| first::suite -> backward suite (first::acc)
		in backward lst []

(* function 03 ex05 d02 *)

let complementary_helix:helix -> helix = fun helix_src ->
	let rec loop comp_helix = function
		| [] -> []
		| last::[] -> rev_list((generate_match(last.nucleobase))::comp_helix)
		| first::suite -> loop ((generate_match(first.nucleobase))::comp_helix) suite
		in loop [] helix_src

(* needed by generate_helix *)

let random_nucleo = function
	| 0 -> generate_nucleotide 'A'
	| 1 -> generate_nucleotide 'T'
	| 2 -> generate_nucleotide 'C'
	| 3 -> generate_nucleotide 'G'
	| _ -> generate_nucleotide 'W'

(* function 01 ex05 d02 *)

let generate_helix:int -> helix = fun nb ->
	if nb <= 0 then []
	else 
	let rec fill_helix index acc = 
		if index < nb then
			begin
				Random.self_init ();
				fill_helix (index+1) ((random_nucleo (Random.int 5))::acc)
			end
		else acc
		in fill_helix 0 []

let main () =
	let helix = generate_helix 12 in
		print_helix (helix);
		print_endline(helix_to_string(helix));
		print_helix (complementary_helix (helix));
		print_endline(helix_to_string(complementary_helix (helix)))

	(* ************************************************************************** *)
let () = main ()
