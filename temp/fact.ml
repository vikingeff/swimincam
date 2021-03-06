(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fact.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/11 15:56:20 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/11 15:58:21 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec fact n =
    if n <= 1
    then 1
    else n * (fact (n-1))

let main () =
    print_string "factoriel 5 = ";
    print_int (fact 5);
    print_char '\n'


(* ************************************************************************** *)
let () = main ()
