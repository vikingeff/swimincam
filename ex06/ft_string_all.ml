(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 14:12:34 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 14:12:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let is_digit c = c >= '0' && c <= '9'
let is_lower c = c >= 'a' && c <= 'z'
let is_upper c = c >= 'A' && c <= 'Z'
let is_letter c = c >= 'A' && c <= 'z'
let is_ascii c = c >= (char_of_int 0) && c <= (char_of_int 255)

let ft_string_all fct str =
	let size = (String.length str) in
	let rec loop current =
		if current == size 
		then true
		else 
			if fct (String.get str current) then
				loop (current+1)
			else false
	in
	loop 0 

let main () =
	print_string "[Hello world !] is letters : ";
	print_endline (string_of_bool (ft_string_all is_letter "Hello world !"));
	print_string "[Helloworld] is letters : ";
	print_endline (string_of_bool (ft_string_all is_letter "Helloworld"));
	print_string "[0123456789] is digits : ";
	print_endline (string_of_bool (ft_string_all is_digit "0123456789"));
	print_string "[O12EAS67B9] is digits : ";
	print_endline (string_of_bool (ft_string_all is_digit "O12EAS67B9"));
	print_string "[Hello world] is lower letters : ";
	print_endline (string_of_bool (ft_string_all is_lower "Hello world"));
	print_string "[Helloworld] is ascii : ";
	print_endline (string_of_bool (ft_string_all is_ascii "Hello world !"))

(* ************************************************************************** *)
let () = main ()
