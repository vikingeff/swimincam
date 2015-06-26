(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rev_list lst = 
	let rec backward lst acc = match lst with
		| [] -> []
		| last::[] -> last::acc
		| first::suite -> backward suite (first::acc)
		in backward lst []

let rec get_min letter = function
	| [] -> ""
	| last::[] -> if letter <= last then letter else last
	| first::suite -> if letter <= first then get_min letter suite else get_min first suite

let rec take_out letter acc = function
	| [] -> []
	| last::[] -> if letter = last then rev_list acc else rev_list (last::acc)
	| first::suite -> if letter = first then take_out letter acc suite else take_out letter (first::acc) suite

let rec make_hill letter acc = function
	| [] -> acc
	| last::[] -> if last = letter then rev_list (letter::acc) else rev_list acc
	| first::suite -> if first = letter then make_hill letter (letter::acc) suite else make_hill letter acc suite

let rec atomlist_to_stringlist acc = function
	| [] -> []
	| last::[] ->  rev_list((last#symbol)::acc)
	| first::suite -> atomlist_to_stringlist ((first#symbol)::acc) suite

let rec stringlist_to_string acc = function
	| [] -> ""
	| last::[] ->  acc^last
	| first::suite -> stringlist_to_string (acc^first) suite

let encode lst =
	let rec count lst nb acc = match lst with
		| [] -> []
		| last::[] -> if nb = 1 then rev_list (last::acc) else rev_list ((string_of_int nb)::last::acc)
		| first::(suite::_ as tail) -> if first = suite then count tail (nb+1) (acc)
						else if nb = 1 then count tail 1 (first::acc)
					else count tail 1 ((string_of_int nb)::first::acc)
		in count lst 1 []

let to_hill formula = 
	let formz = atomlist_to_stringlist [] formula in
	let hill = (List.sort compare formz) in
	let temp = encode hill in
	let final = stringlist_to_string "" temp in
	final	

class virtual molecule name (formula:Atom.atom list) = 
	object (me)
		val _name:string = name
		val _formula:string = to_hill(formula)

		method name = _name
		method formula = _formula

		initializer print_endline("Molecule of "^me#name^" created.")
		
		method to_string = "Name: "^me#name^" Formula: "^me#formula
		method equals (you: molecule) = (me#name = you#name) && (me#formula = you#formula)
		
	end