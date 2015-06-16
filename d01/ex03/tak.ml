(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:32:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 10:32:34 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let rec tak x y z =
	if y >= x then z
	else 
		begin
			let a = tak (x-1) y z in
			let b = tak (y-1) z x in 
			let c = tak (z-1) x y in
			tak a b c
		end

let main () =
	print_string ("tak [1 - 2 - 3]: ");
	print_int (tak 1 2 3);
	print_char '\n';
	print_string ("tak [5 - 23 - 7]: ");
	print_int (tak 5 23 7);
	print_char '\n';
	print_string ("tak [9 - 1 - 0]: ");
	print_int (tak 9 1 0);
	print_char '\n';
	print_string ("tak [1 - 1 - 1]: ");
	print_int (tak 1 1 1);
	print_char '\n';
	print_string ("tak [0 - 42 - 0]: ");
	print_int (tak 0 42 0);
	print_char '\n';
	print_string ("tak [23498 98734 98776]: ");
	print_int (tak 23498 98734 98776);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()