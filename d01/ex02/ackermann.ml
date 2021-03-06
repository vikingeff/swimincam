(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:17:58 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 10:18:00 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let rec ackermann m n =
	if m < 0 || n < 0 then (-1)
	else if m == 0 then (n+1)
		else if n == 0 then ackermann (m-1) 1
			else ackermann (m-1) (ackermann m (n-1))


let main () =
	print_string ("ackermann [(-1) - 7]: ");
	print_int (ackermann (-1) 7);
	print_char '\n';
	print_string ("ackermann [2 - (-1)]: ");
	print_int (ackermann 2 (-1));
	print_char '\n';
	print_string ("ackermann [0 - 0]: ");
	print_int (ackermann 0 0);
	print_char '\n';
	print_string ("ackermann [2 - 3]: ");
	print_int (ackermann 2 3);
	print_char '\n';
	print_string ("ackermann [4 - 1]: ");
	print_int (ackermann 4 1);
	print_char '\n'


(* ************************************************************************** *)
let () = main ()