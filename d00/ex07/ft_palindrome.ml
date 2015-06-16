(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_palindrome.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 14:48:12 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 14:48:14 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_palindrome str =
	let size = (String.length str) in
	let rec loop current =
		if current > size/2
		then true
		else
			if String.get str current == String.get str (size-current-1) then
				loop (current + 1)
			else
				false
	in
	loop 0

let main () =
	print_string "[Hello world !] is palindrome : ";
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
	print_endline (string_of_bool (ft_palindrome "raftar"));
	print_string "[eluparcettecrapule] is palindrome : ";
	print_endline (string_of_bool (ft_palindrome "eluparcettecrapule"))

(* ************************************************************************** *)
let () = main ()