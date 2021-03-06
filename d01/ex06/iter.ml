(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:59:28 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 11:59:32 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter fct x n =
	if n < 0 then (-1)
	else 
		begin
			let rec loop acc nb = 
			if nb == 0 then acc
			else 
				loop (fct acc) (nb-1)
				in loop x n
		end


let main () =
	print_string ("fun (x * x) / val 2 - 4: ");
	print_int (iter (fun x -> x * x) 2 4);
	print_char '\n';
	print_string ("fun (x * 2) / val 2 - 4: ");
	print_int (iter (fun x -> x * 2) 2 4);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()
