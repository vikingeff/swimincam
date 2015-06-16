(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   leibniz_pi.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 13:14:07 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 13:14:09 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec leibniz_pi delta =
	if delta <= 0.0 then (-1)
	else
	let rec leibniz acc nb = 
		let piref = 4.*.(atan 1.) in
		if delta > (piref -. acc) && piref >= acc || delta > (acc -. piref) && piref <= acc then nb
		else
			let result = (-1.0)**(float_of_int nb)/.(2.0*.(float_of_int nb)+.1.0) in 
			leibniz (acc+.(4.*.result)) (nb+1)
		in leibniz 0.0 0

let main () =
	print_string ("leibniz_pi [0.001]: ");
	print_int (leibniz_pi 0.001);
	print_char '\n';
	print_string ("leibniz_pi [0.01]: ");
	print_int (leibniz_pi 0.01);
	print_char '\n';
	print_string ("leibniz_pi [0.0001]: ");
	print_int (leibniz_pi 0.0001);
	print_char '\n';
	print_string ("leibniz_pi [0.02]: ");
	print_int (leibniz_pi 0.02);
	print_char '\n';
	print_string ("leibniz_pi [0.005]: ");
	print_int (leibniz_pi 0.005);
	print_char '\n';
	print_string ("leibniz_pi [0.0000042]: ");
	print_int (leibniz_pi 0.0000042);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()

