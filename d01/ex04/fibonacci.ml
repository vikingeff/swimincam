(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:58:07 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 10:58:16 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec fibonacci n =
	let rec fib_temp n x y =
		if n < 0 then (-1)
		else if n == 0 then x
		else fib_temp (n-1) y (x+y)
	in
	fib_temp n 0 1

let main () =
	print_string ("fibonacci [-42]: ");
	print_int (fibonacci (-42));
	print_char '\n';
	print_string ("fibonacci [1]: ");
	print_int (fibonacci 1);
	print_char '\n';
	print_string ("fibonacci [3]: ");
	print_int (fibonacci 3);
	print_char '\n';
	print_string ("fibonacci [6]: ");
	print_int (fibonacci 6);
	print_char '\n';
	print_string ("fibonacci [29]: ");
	print_int (fibonacci 18);
	print_char '\n';
	print_string ("fibonacci [50]: ");
	print_int (fibonacci 50);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()