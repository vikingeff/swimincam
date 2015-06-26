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
	let meth = new Gaz.methane in
	let eth = new Gaz.ethane in
	let octo = new Gaz.octane in
	let twenty = new Gaz.eicosane in
	let third = new Gaz.triacontane in
	let twenty2 = new Gaz.eicosane in
	
	print_endline meth#to_string;
	print_endline eth#to_string;
	print_endline octo#to_string;
	print_endline twenty#to_string;
	print_endline third#to_string;
	print_endline twenty2#to_string;
	print_endline (twenty#name^" equals "^twenty2#name^" : "^(string_of_bool (twenty#equals twenty2)));
	print_endline (twenty#name^" equals "^third#name^" : "^(string_of_bool (twenty#equals third)))

	(* ************************************************************************** *)
let () = main ()