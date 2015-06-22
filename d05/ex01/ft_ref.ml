(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 13:04:27 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 13:04:28 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = {
	mutable contents : 'a;
}

let return src =
	let new_ref = { contents = src} in
		new_ref

let get src = 
	let value = src.contents in
		value

let set src value =
	src.contents <- value

let bind:'a ft_ref -> ('a -> 'b ft_ref) -> 'b ft_ref = fun src fct ->
	fct (get src)

let square_it x =
	return (x * x)

let add_str str = 
	return (str ^ " !")

let print_content src wprint =
	print_string "Content of ['a ref]: ";
	wprint (get src);
	print_char '\n'

let main () =
	let ref_int = return 42 in
	let ref_square = bind ref_int square_it in
	let ref_string = return "Hello World" in
	let ref_world = bind ref_string add_str in
	print_content ref_int print_int;
	print_content ref_square print_int;
	print_content ref_string print_string;
	print_content ref_world print_string

	(* ************************************************************************** *)
let () = main ()