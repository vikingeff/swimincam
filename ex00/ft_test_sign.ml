(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 09:10:10 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/15 09:10:11 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign x =
	if x < 0 then
		print_endline "negative"
	else
		print_endline "positive"


let main () =
	print_string "This is a negative test with value [-12] : ";
	ft_test_sign (-12);
	print_string "This is a null test with value [0] : ";
	ft_test_sign (0);
	print_string "This is a positive test with value [678] : ";
	ft_test_sign (678)

(* ************************************************************************** *)
let () = main ()