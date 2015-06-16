(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:37:06 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/16 11:37:07 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_m n =
	if n < 0 then (-1)
	else if n == 0 then 0
		else (n - hfs_f (hfs_m (n-1)))

and hfs_f n =
	if n < 0 then (-1)
	else if n == 0 then 1
		else (n - hfs_m (hfs_f (n-1)))

let main () =
	print_string ("hofstadter_m [-42]: ");
	print_int (hfs_m (-42));
	print_char '\n';
	print_string ("hofstadter_f [-42]: ");
	print_int (hfs_f (-42));
	print_char '\n';
	print_string ("hofstadter_m [0]: ");
	print_int (hfs_m 0);
	print_char '\n';
	print_string ("hofstadter_f [0]: ");
	print_int (hfs_f 0);
	print_char '\n';
	print_string ("hofstadter_m [4]: ");
	print_int (hfs_m 4);
	print_char '\n';
	print_string ("hofstadter_f [4]: ");
	print_int (hfs_f 4);
	print_char '\n';
	print_string ("hofstadter_m [150]: ");
	print_int (hfs_m 150);
	print_char '\n';
	print_string ("hofstadter_f [150]: ");
	print_int (hfs_f 150);
	print_char '\n'

(* ************************************************************************** *)
let () = main ()
