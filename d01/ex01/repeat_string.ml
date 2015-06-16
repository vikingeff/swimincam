(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 09:47:16 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 09:47:17 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?str:(str="x") nb =
	let rec repeat_x x =
		if x < 0
		then "Error"
		else if x == 0
			then ""
			else if x == 1
				then "x"
				else "x"^repeat_x (x-1)
	in if (str=="x") then
		repeat_x nb
		else if nb < 0
			then "Error"
			else if nb == 0
				then ""
				else if nb == 1
					then str
					else str^repeat_string ~str:str (nb-1)


let main () =
	print_string ("repeat_string [-1]: ");
	print_endline (repeat_string (-1));
	print_string ("repeat_string [0]: ");
	print_endline (repeat_string 0);
	print_string ("repeat_string [1]: ");
	print_endline (repeat_string 1);
	print_string ("repeat_string [42]: ");
	print_endline (repeat_string 42);
	print_string ("repeat_string [Toto - 1]: ");
	print_endline (repeat_string ~str:"Toto" 1);
	print_string ("repeat_string [a - 25]: ");
	print_endline (repeat_string ~str:"a" 25);
	print_string ("repeat_string [TesT 8]: ");
	print_endline (repeat_string ~str:"TesT" 8)

(* ************************************************************************** *)
let () = main ()
