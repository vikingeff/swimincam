(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 09:38:45 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 09:38:46 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power x y =
	if y == 0
	then 1
	else x * ft_power x (y-1)

let main () =
	print_string "This is 2^4 : ";
	print_int (ft_power 2 4);
	print_char '\n';
	print_string "This is 3^0 : ";
	print_int (ft_power 3 0);
	print_char '\n';
	print_string "This is 0^5 : ";
	print_int (ft_power 0 5);
	print_char '\n';
	print_string "This is 8^5 : ";
	print_int (ft_power 8 5);
	print_char '\n';
	print_string "This is 4^12 : ";
	print_int (ft_power 4 12);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()
