(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
	let ninth = new Doctor.doctor "Christopher Eccleston" 51 in
	let rose = ninth#get_sidekick in
	let dal1 = new Dalek.dalek in
	print_endline (ninth#to_string);
	print_endline (rose#to_string);
	print_endline (dal1#to_string);
	rose#talk;
	ninth#talk;
	dal1#talk;
	let rose = dal1#exterminate rose in
	print_endline (rose#to_string);
	print_endline (dal1#to_string);
	dal1#die

	(* ************************************************************************** *)
let () = main ()
