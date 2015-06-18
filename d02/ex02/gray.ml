(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 16:38:27 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/17 16:38:28 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let get_gray value =
	value lxor (value lsr 1)

let rec ft_power x y =
	if y == 0
	then 1
	else x * ft_power x (y-1)

let get_binary nb size =
	let str = String.make size '0' in
	let rec binarize index bit =
		if bit land 1 = 1 then String.set str index '1';
		if index <= 0 then str
		else binarize (index-1) (bit lsr 1)
	in binarize (size-1) nb 

let print_gray nb = 
	let rec show_one acc =
		if acc < (ft_power 2 nb) then 
			begin
				print_string (get_binary (get_gray acc) nb); print_char ' ';
				show_one (acc+1)
			end
		in show_one 0

let main () =
	print_string "gray code of 2: ";
	print_gray 2;
	print_char '\n';
	print_string "gray code of 3: ";
	print_gray 3;
	print_char '\n';
	print_string "gray code of 4: ";
	print_gray 4;
	print_char '\n';
	print_string "gray code of 5: ";
	print_gray 5;
	print_char '\n'

	(* ************************************************************************** *)
let () = main ()
