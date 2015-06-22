(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 16:11:02 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/22 16:11:04 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let random_joke = function
	| 0 -> "C'est un mec qui rentre dans un café, plouf !"
	| 1 -> "Quel est la différence entre un pigeon ?\n\nIl a une patte plus courte que l'autre !!"
	| 2 -> "Que se fait un Schtroumf quand il tombe ?\n\nUn bleu."
	| 3 -> "Pourquoi Michaël ouvre la porte ?\n\nParce que Jack Sonne !"
	| 4 -> "C'est deux oeuf dans une poele,\nl'un dis : tu trouves pas qu'il fait chaud ?\nl'autre : haaaaa un oeuf qui parle !!"
	| 5 -> "Quel est le sport le plus fruité ?\n\nLa boxe, parce que quand on te met une pêche dans la poire, tu tombes dans les pommes, t'as pas intérêt à ramener ta fraise et tout ça pour des prunes."
	| _ -> "Oulalala 5 blagues de merde c'est déjà bien."

let create_array = 
	let arrayz = Array.make 7 "" in
		for i=0 to ((Array.length arrayz)-1) do
			arrayz.(i) <- random_joke i
		done;
	arrayz

let main () =
	let jokez = create_array in
	Random.self_init ();
	let index = Random.int 7 in
	print_endline jokez.(index)

	(* ************************************************************************** *)
let () = main ()