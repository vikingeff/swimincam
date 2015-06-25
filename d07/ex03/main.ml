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
	Random.self_init ();
	let ninth = new Doctor.doctor "Christopher Eccleston" 51 in
	let rose = ninth#get_sidekick in
	let dal1 = new Dalek.dalek in
	print_endline (ninth#to_string);
	print_endline (rose#to_string);
	print_endline (dal1#to_string);
	rose#talk;
	ninth#talk;
	dal1#talk;
	let army1 = new Army.army (rose::[]) in
	let army2 = new Army.army (ninth::[]) in
	let army3 = new Army.army (dal1::[]) in
	(List.nth army1#get_member 0)#talk;
	(List.nth army2#get_member 0)#talk;
	(List.nth army3#get_member 0)#talk;
	print_string "Dalek army size: ";
	print_int (List.length army3#get_member);
	print_char '\n';
	let army3 = (army3#add dal1) in
	let army3 = (army3#add dal1) in
	print_string "Dalek army size: ";
	print_int (List.length army3#get_member);
	print_char '\n';	
	(List.nth army2#get_member 0)#use_sonic_screwdriver;
	let army3 = (army3#delete) in 
	print_string "Dalek army size: ";
	print_int (List.length army3#get_member);
	print_char '\n'

	(* ************************************************************************** *)
let () = main ()
