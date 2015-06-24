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
	print_endline ninth#to_string;
	ninth#talk;
	ninth#use_sonic_screwdriver;
	ninth#travel_in_time 1986 2014;
	ninth#die		

	(* ************************************************************************** *)
let () = main ()
