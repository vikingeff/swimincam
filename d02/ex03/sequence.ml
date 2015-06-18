(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 19:07:13 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/17 19:07:15 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec list_to_string lst str =
	match lst with
	| [] -> str
	| q :: l -> list_to_string l (str ^ (string_of_int q))

let rec generate lst acc ret =
	match lst with
	| queue :: [] -> ret @ ((acc + 1) :: queue :: [])
	| head :: ( queue :: _ as ne) ->	if (head = queue) then generate ne (acc + 1) ret
										else generate ne 0 (ret @ ( (acc + 1) :: head :: []))
	| [] -> ret

let sequence n =
	if n <= 0 then
		""
	else
		let rec loop lst index =
			if (index = n) then
				lst
			else
				loop (generate lst 0 []) (index + 1)
		in
	list_to_string (loop (1 :: []) 1) ""

let main () =
	print_endline ( sequence 0);
	print_endline ( sequence 1);
	print_endline ( sequence 2);
	print_endline ( sequence 3);
	print_endline ( sequence 4);
	print_endline ( sequence 5);
	print_endline ( sequence 6);
	print_endline ( sequence 7)

	(* ************************************************************************** *)
let () = main ()