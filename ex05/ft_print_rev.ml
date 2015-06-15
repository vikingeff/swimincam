(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 13:40:39 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 13:40:41 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_rev str =
	let size = (String.length str)-1 in
	let rec loop current =
		if current >= 0 then
			let char_of_current = String.get str current in
			print_char char_of_current;
			loop (current - 1)
	in
	loop size;
	print_char '\n'

let main () =
	ft_print_rev ("Hello world !");
	ft_print_rev ("! dlrow olleH");
	ft_print_rev ("")

(* ************************************************************************** *)
let () = main ()