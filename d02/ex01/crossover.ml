(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 15:21:43 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/17 15:21:45 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let print_list lst wprint =
	print_string "[";
	let rec print_each lst = match lst with
		| [] -> print_endline "]";()
		| last::[] -> wprint last; print_endline "]";()
		| first::suite -> wprint first;
						print_string "; ";
						print_each suite
		in print_each lst

let rev_list lst = 
	let rec backward lst acc = match lst with
		| [] -> []
		| last::[] -> last::acc
		| first::suite -> backward suite (first::acc)
		in backward lst [] 

let rec inside_list lst elem = match lst with
	| [] -> false
	| first::suite -> (elem = first) || (inside_list suite elem)

let crossover lst1 lst2 =
	if lst2 == [] || lst1 == [] then []
	else
		let rec check acc = function
			| [] -> acc
			| first::suite -> if (inside_list lst2 first) then check (first::acc) suite
							else check acc suite
			in check [] lst1

let main () =
	print_string ("crossover [] [1;2;3] ---> ");
	print_list (rev_list(crossover [] [1;2;3])) print_int;
	print_string ("crossover [1;2;3] [] ---> ");
	print_list (rev_list(crossover [1;2;3] [])) print_int;
	print_string ("crossover [3;2;1] [1;2;3] ---> ");
	print_list (rev_list(crossover [3;2;1] [1;2;3])) print_int;
	print_string ("crossover [2;2;1] [1;2;3] ---> ");
	print_list (rev_list(crossover [2;2;1] [1;2;3])) print_int;
	print_string ("crossover [8;9;6;5;2] [1;2;3] ---> ");
	print_list (rev_list(crossover [8;9;6;5;2] [1;2;3])) print_int;
	print_string ("crossover [\"test\";\"truc\";\"machin\"] [\"hello\";\"world\";\"machin\"] ---> ");
	print_list (rev_list(crossover ["test";"truc";"machin"] ["hello";"world";"machin"])) print_string;
	print_string ("crossover ['a';'9';'g'] ['k';a';'t';'y'] ---> ");
	print_list (rev_list(crossover ['a';'9';'g'] ['k';'a';'t';'y'])) print_char


(* ************************************************************************** *)
let () = main ()
