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
	let h2o = new Liquid.water in
	let whis = new Liquid.whiskey in
	let co2 = new Gaz.carbon_dioxyde in
	let explo = new Other.tnt in
	let penis = new Other.dickite in
	let fuch = new Other.fuchsite in
	let kino = new Other.kinoshitalite in
	print_endline h2o#to_string;
	print_endline whis#to_string;
	print_endline co2#to_string;
	print_endline explo#to_string;
	print_endline penis#to_string;
	print_endline fuch#to_string;
	print_endline kino#to_string

	(* ************************************************************************** *)
let () = main ()