(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/11 15:56:20 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/11 16:11:08 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
	let rec loop c d u =
		if u <= 9 then
			begin
				print_int c; print_int d; print_int u;
				if c = 7 then
					begin
						print_string "\n"
					end
				else
					begin
						print_string ", "; 
						loop c d (u+1)
					end
			end
		else
			if d <= (8) then
				loop c (d+1) (d+2)
			else if c <= (7) then
				loop (c+1) (c+2) (c+3)
	in
	loop 0 1 2

let main () =
	ft_print_comb ()

(* ************************************************************************** *)
let () = main ()
