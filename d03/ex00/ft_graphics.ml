(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   test.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 11:40:11 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/18 11:40:12 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let get_left (left, _, _) = left

let node_to_string = function
	| Nil -> "Nil"
	| Node(truc, _, _) -> string_of_int (truc)

let draw_square x y size =
	Graphics.moveto (x-(size/2)) (y-(size/2));
	Graphics.lineto (x-(size/2)+size) (y-(size/2));
	Graphics.lineto (x-(size/2)+size) (y-(size/2)+size);
	Graphics.lineto (x-(size/2)) (y-(size/2)+size);
	Graphics.lineto (x-(size/2)) (y-(size/2))

let draw_tree_node node = match node with 
	| Nil -> ()
	| _ -> let h = 600 in
		Graphics.moveto 100 (h/2);
		Graphics.draw_string (node_to_string node);
		draw_square 100 (h/2) 75;
		Graphics.moveto 300 (h/3);
		Graphics.draw_string (node_to_string Nil);
		draw_square 300 (h/3) 75;
		Graphics.moveto 300 (2*h/3);
		Graphics.draw_string (node_to_string Nil);
		draw_square 300 (2*h/3) 75;
		Graphics.moveto (100+(75/2)) (h/2);
		Graphics.lineto (300-(75/2)) (h/3);
		Graphics.moveto (100+(75/2)) (h/2);
		Graphics.lineto (300-(75/2)) (2*h/3)


let main () =
	(* let width = 800 in
	let height = 600 in  *)
	Graphics.open_graph " 800x600";
	(* Graphics.moveto 400 300;
	Graphics.draw_string "42";
	draw_square (width/2) (height/2) 100; *)
	draw_tree_node (Node(118, Nil, Nil));
	Graphics.read_key ()
	
	(* ************************************************************************** *)

let () = 
	ignore(main ());
	print_endline ""