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

let is_letter c = c >= 'A' && c <= 'z'

let rotate_n rot c =
	let letter = int_of_char c in
		if (letter >= 65 || letter <= 90) || (letter >= 97 || letter <= 122) then
			char_of_int (letter+ (rot mod 26))
		else
			c

let ft_rot_n rot str =
	String.map rotate_n (rot str) str  

let main () =
	(*print_string "[Hello world !] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "Hello world !"));
	print_string "[rafar] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "rafar"));
	print_string "[maoam] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "maoam"));
	print_string "[123321] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "123321"));
	print_string "[MAchinTruXC] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "MAchinTruXC"));
	print_string "[raftar] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "raftar"))*)

(* ************************************************************************** *)
let () = main ()
