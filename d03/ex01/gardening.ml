(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gardening.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 11:40:11 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/18 11:40:12 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let get_left (left, _, _) = left

let rec count_leaves = function
	| Nil -> 0
	| Node(_, Nil, Nil) -> 1
	| Node(_, left, right) -> count_leaves left + count_leaves right

let rec size = function
	| Nil -> 0
	| Node(_, left, right) -> 1 + size left + size right

let rec height = function
	| Nil -> 0
	| Node(_, left, right) -> 1 + max (height left) (height right)

let node_to_string = function
	| Nil -> "Nil"
	| Node(truc, _, _) -> truc(*string_of_int (truc) *)

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

let draw_string_center x y str =
    let (sx, sy) = Graphics.text_size str in
    Graphics.moveto (x - sx / 2) (y - sy / 2);
    Graphics.draw_string str

let draw_node x y size str =
    draw_square x y size;
    draw_string_center x y str

let draw_tree n =
      let rec ft_draw xstart ystart n acc = match n with
              | Nil -> draw_node (xstart + 50) ystart 50 "Nil"
              | Node (v, l, r) ->
                  draw_node (xstart + 50) ystart 50 v;
                  Graphics.moveto (xstart + 75) (ystart);
                  Graphics.lineto (xstart + acc + 140) (ystart + 105 + ((height l) * 30));
                  ft_draw (xstart + acc + 90) (ystart + 130 + ((height l) * 30)) l (acc + 20);
                  Graphics.moveto (xstart + 75) ystart;
                  Graphics.lineto (xstart + acc + 140) (ystart - 105 - ((height r) * 30));
                  ft_draw (xstart + acc + 90) (ystart - 130 - ((height r) * 30)) r (acc + 20)
      in ft_draw 0 (800 / 2) n 0

let main () =
	(* let width = 800 in
	let height = 600 in  *)
	Graphics.open_graph " 800x600";
	(* Graphics.moveto 400 300;
	Graphics.draw_string "42";
	draw_square (width/2) (height/2) 100; *)
	let example_tree = Node(1, Node(2, Node(3, Nil, Nil), Node(4, Nil, Nil)), Node(5, Nil, Node(6, Node(7, Node(8, Nil, Nil), Nil), Nil))) in
	let other_tree = Node("118", Node("114", Node("113", Nil, Nil), Nil), Node("113", Nil, Nil)) in
	print_int(count_leaves (example_tree));
	print_char '\n';
	print_int(size (example_tree));
	print_char '\n';
	print_int(height (example_tree));
	print_char '\n';
	print_int(count_leaves (other_tree));
	print_char '\n';
	print_int(size (other_tree));
	print_char '\n';
	print_int(height (other_tree));
	print_char '\n';
	draw_tree (other_tree)
	Graphics.read_key ()

	(* ************************************************************************** *)
let () = main ()