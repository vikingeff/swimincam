(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 19:07:13 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/17 19:07:15 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let encode str =
	let rec count src index acc answer =
		if index < ((String.length src) - 2) then
			begin
				print_int index;
				print_string " - ";
				print_int acc;
				print_string " :";
				print_char (String.get src index);
				print_char '-';
				print_char (String.get src (index+1));
				print_string " :";
				print_endline answer;
				if (String.get src index) = (String.get src (index+1)) then
					begin
						count src (index+1) (acc+1) answer
					end
				else
					begin
						print_endline "here";
						print_string (String.make 1 (String.get src index));
						answer^(String.make 1 (String.get src index))^(string_of_int acc);
						count src (index+1) 1 answer
					end
			end
		else
			begin
				if (String.get src (index)) == (String.get src (index+1)) then
					answer^(String.make 1 (String.get src index))^(string_of_int (acc+1))
				else
					begin
						answer^(String.make 1 (String.get src index))^(string_of_int acc);
						answer^(String.make 1 (String.get src (index+1)))^(string_of_int 1)
					end
			end
		in count str 0 1 ""

(* let encode lst =
	let rec count lst nb acc = match lst with
		| [] -> []
		| last::[] -> nb::last::acc
		| first::(suite::_ as tail) -> if first = suite then count tail (nb+1) (acc)
						else count tail 1 (nb:: first::acc)
		in count lst 1 [] *)

let sequence nb =
	if nb <= 0 then ""
		else
			let rec get_seq str index =
					if index == nb then str
						else get_seq (encode str) (index+1)
				in get_seq "1" 1
