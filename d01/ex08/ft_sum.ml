(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 13:13:31 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 13:13:33 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_sum fct beg last =
	if beg > last then (-1.0)
	else
	let rec loop acc nb = 
		if nb > last then acc
		else
			let result = fct nb in
			loop (result +. acc) (nb+1)
		in loop 0.0 beg

let main () =
	print_string ("fun (i^2) / val 1 - 10: ");
	print_endline (string_of_float (ft_sum (fun i -> float_of_int (i * i)) 1 10))

(* ************************************************************************** *)
let () = main ()
