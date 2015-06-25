(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   liquid.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class water =
	object (me)
		inherit Molecule.molecule "Water" [(new Non_metal.hydrogen); (new Non_metal.hydrogen); new Non_metal.oxygen] as mom
	end

class whiskey =
	object (me)
		inherit Molecule.molecule "Whiskey" [(new Non_metal.carbon); (new Non_metal.hydrogen); (new Non_metal.hydrogen); (new Non_metal.hydrogen); (new Non_metal.carbon); (new Non_metal.hydrogen); (new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen);] as mom
	end
