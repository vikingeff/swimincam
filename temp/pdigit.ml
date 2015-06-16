(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fact.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/11 15:56:20 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/11 16:07:55 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_digits () =
    let ascii_of_0 = int_of_char '0' in
    let ascii_of_9 = int_of_char '9' in
    let rec loop ascii_of_current_digit =
        if ascii_of_current_digit <= ascii_of_9 then
            let char_of_current_digit = char_of_int ascii_of_current_digit in
            print_char char_of_current_digit;
            loop (ascii_of_current_digit + 1)
    in
    loop ascii_of_0;
    print_char '\n'

let main () =
    ft_print_digits ()


(* ************************************************************************** *)
let () = main ()
