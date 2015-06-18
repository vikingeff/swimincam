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

let print_nucleotide nucleo = 
	print_string "Nucleoide { ";
	print_string nucleo.phosphate;
	print_string "; ";
	print_string nucleo.deoxyribose;
	print_string "; ";
	let define_nucleo = function
		| A -> print_string "A }\n"
		| T -> print_string "T }\n"
		| C -> print_string "C }\n"
		| G -> print_string "G }\n"
		| None -> print_string "None }\n"
	in define_nucleo nucleo.nucleobase

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

let main () =
	print_nucleotide (generate_nucleotide 't');
	print_nucleotide (generate_nucleotide 'A');
	print_nucleotide (generate_nucleotide 'z')

	(* ************************************************************************** *)
let () = main ()
