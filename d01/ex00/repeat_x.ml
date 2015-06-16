(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 09:27:00 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 09:27:02 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x x =
	if x < 0
	then "Error"
	else if x == 0
		then ""
		else if x == 1
			then "x"
			else "x"^repeat_x (x-1)

let main () =
	print_string ("repeat_x [-1]: ");
	print_endline (repeat_x (-1));
	print_string ("repeat_x [0]: ");
	print_endline (repeat_x 0);
	print_string ("repeat_x [1]: ");
	print_endline (repeat_x 1);
	print_string ("repeat_x [5]: ");
	print_endline (repeat_x 5);
	print_string ("repeat_x [42]: ");
	print_endline (repeat_x 42);
	print_string ("repeat_x [293]: ");
	print_endline (repeat_x 293)

(* ************************************************************************** *)
let () = main ()
