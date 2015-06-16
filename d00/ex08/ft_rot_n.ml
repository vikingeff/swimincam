(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 15:07:51 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 15:07:52 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let is_lower c = c >= 'a' && c <= 'z'
let is_upper c = c >= 'A' && c <= 'Z'

let ft_rot_n rot str =
	let rotation = rot mod 26 in
	let rotate_n c =
		let letter = int_of_char c in
		if (is_lower c) then
			begin
				if ((letter + rotation) > int_of_char 'z') then
					char_of_int (int_of_char 'a' + letter + rotation - int_of_char 'z' - 1)
				else
					char_of_int (letter + rotation)
			end
		else if (is_upper c) then
			begin
				if (letter + rotation > int_of_char 'Z') then
					char_of_int (int_of_char 'A' + letter + rotation - int_of_char 'Z' - 1)
				else
					char_of_int (letter + rotation)
			end
		else c
	in String.map rotate_n str

let main () =
	print_string "rot 1 of [abcdefghijklmnopqrstuvwxyz] becomes : ";
	print_endline (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
	print_string "rot 13 of [abcdefghijklmnopqrstuvwxyz] becomes : ";
	print_endline (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
	print_string "rot 13 of [abcdefghijklmNOPQRSTUVWXYZ] becomes : ";
	print_endline (ft_rot_n 13 "abcdefghijklmNOPQRSTUVWXYZ");
	print_string "rot 42 of [0123456789] becomes : ";
	print_endline (ft_rot_n 42 "0123456789");
	print_string "rot 2 of [OI2EAS67B9] becomes : ";
	print_endline (ft_rot_n 2 "OI2EAS67B9");
	print_string "rot 0 of [Damned !] becomes : ";
	print_endline (ft_rot_n 0 "Damned !");
	print_string "rot 8 of [Damned !] becomes : ";
	print_endline (ft_rot_n 8 "Damned !");
	print_string "rot 42 of [] becomes : ";
	print_endline (ft_rot_n 42 "");
	print_string "rot 1 of [NBzlk qnbjr !] becomes : ";
	print_endline (ft_rot_n 1 "NBzlk qnbjr !")

(* ************************************************************************** *)
let () = main ()