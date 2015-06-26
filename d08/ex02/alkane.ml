(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let alkane_name = function
	| 1 -> "Methane"
	| 2 -> "Ethane"
	| 3 -> "Propane"
	| 4 -> "Butane"
	| 5 -> "Pentane"
	| 6 -> "Hexane"
	| 7 -> "Heptane"
	| 8 -> "Ocatane"
	| 9 -> "Nonane"
	| 10 -> "Decane"
	| 11 -> "Undecane"
	| 12 -> "Dodecane"
	| 13 -> "Tridecane"
	| 14 -> "Tetradecane"
	| 15 -> "Pentadecane"
	| 16 -> "Hexadecane"
	| 17 -> "Heptadecane"
	| 18 -> "Octadecane"
	| 19 -> "Nonadecane"
	| 20 -> "Eicosane"
	| 21 -> "Heneicosane"
	| 22 -> "Docosane"
	| 23 -> "Tricosane"
	| 24 -> "Tetracosane"
	| 25 -> "Pentacosane"
	| 26 -> "Hexacosane"
	| 27 -> "Heptacosane"
	| 28 -> "Octacosane"
	| 29 -> "Nonacosane"
	| 30 -> "Triacontane"
	| _ -> "SomeAlkane"

let create_formula nb =
	let rec loop carbo index acc =
		if index < carbo then
			loop carbo (index+1) ((new Non_metal.carbon)::acc)
		else if index < (carbo*3+2) then
			loop carbo (index+1) ((new Non_metal.hydrogen)::acc)
		else (Molecule.to_hill acc)
	in loop nb 0 []

class alkane nb_carbo =
(* 	object (me)
		inherit Molecule.molecule (Alkane_Name nb_carbo) "Sc" 21 *)
	object (me)
		val _name:string = (alkane_name nb_carbo)
		val _formula:string = (create_formula nb_carbo)

		method name = _name
		method formula = _formula

		initializer print_endline("Molecule of "^me#name^" created.")
		
		method to_string = "Name: "^me#name^" Formula: "^me#formula
		method equals (you: alkane) = (me#name = you#name) && (me#formula = you#formula)
	end