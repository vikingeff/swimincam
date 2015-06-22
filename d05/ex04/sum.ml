(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sum.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 17:46:47 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 17:46:52 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let sum f1 f2 = f1 +. f2

let main nb1 nb2 =
	let f1 = float_of_string nb1 in
	let f2 = float_of_string nb2 in
	print_endline (nb1^" + "^nb2^" = "^(string_of_float (sum f1 f2)))


	(* ************************************************************************** *)
let () =
	let argv = Array.to_list Sys.argv in
	if (List.length argv) <= 2 then
		print_endline "Error: Need 2 floats please !"
	else if (List.length argv) > 3 then
		print_endline "Error: Need less args."
	else 
		main (List.nth argv 1) (List.nth argv 2)
