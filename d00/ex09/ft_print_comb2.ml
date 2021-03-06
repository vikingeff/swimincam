(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb2.ml                                  :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 15:08:13 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 15:08:15 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb2 () =
	let rec loop n1 n2 =
		if n2 <= 99 then
			begin
				if n1 < 10 then print_int 0;
				print_int n1; print_char ' ';
				if n2 < 10 then print_int 0;
				print_int n2;
				if n1 = 98 then
					begin
						print_string "\n"
					end
				else
					begin
						print_string ", "; 
						loop n1 (n2+1)
					end
			end
		else
			if n1 <= (98) then
				loop (n1+1) (n1+2)
	in
	loop 0 1

let main () =
	ft_print_comb2 ()

(* ************************************************************************** *)
let () = main ()
