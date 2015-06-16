(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 12:24:22 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 12:24:23 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges fct x n =
	if n < 0 then false
	else 
		begin
			let rec loop acc nb = 
			if fct acc == acc then true
			else if nb == 0 then false
				else 
					loop (fct acc) (nb-1)
				in loop x n
		end


let main () =
	print_string ("fun (*2) / val 2 - 5: ");
	print_endline (string_of_bool (converges (( * ) 2) 2 5));
	print_string ("fun (x / 2) / val 2 - 3: ");
	print_endline (string_of_bool (converges (fun x -> x / 2) 2 3));
	print_string ("fun (x / 2) / val 2 - 2: ");
	print_endline (string_of_bool (converges (fun x -> x / 2) 2 2));
	print_string ("fun (x / 2) / val 2 - 1: ");
	print_endline (string_of_bool (converges (fun x -> x / 2) 2 1))

(* ************************************************************************** *)
let () = main ()
