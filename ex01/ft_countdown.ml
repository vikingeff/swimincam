(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 09:38:45 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 09:38:46 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_countdown x =
	if x <= 0 then
		begin
			print_int (0);
			print_char '\n'
		end
	else
		begin
			print_int (x);
			print_char '\n';
			ft_countdown (x-1)
		end

let main () =
	print_endline "This is a countdown from value 4 : ";
	ft_countdown (4);
	print_endline "This is a countdown from value 0 : ";
	ft_countdown (0);
	print_endline "This is a countdown from value -4 : ";
	ft_countdown (-4)

(* ************************************************************************** *)
let () = main ()
