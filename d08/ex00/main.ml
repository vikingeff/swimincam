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
	let hydro = new Non_metal.hydrogen in
	let hydro2 = new Non_metal.hydrogen in
	let pluto = new Actinoid.plutonium in
	print_endline hydro#to_string;
	print_endline hydro2#to_string;
	print_endline pluto#to_string;
	print_endline (string_of_bool (hydro2#equals hydro));
	print_endline (string_of_bool (pluto#equals hydro))

	(* ************************************************************************** *)
let () = main ()
