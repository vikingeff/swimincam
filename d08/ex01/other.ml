(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   other.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

	(*C6H2(NO2)3CH3					Trinitrotoluene*)
class tnt =
	object (me)
		inherit Molecule.molecule "Trinitrotoluene" [(new Non_metal.carbon);(new Non_metal.carbon);(new Non_metal.carbon);(new Non_metal.carbon);(new Non_metal.carbon);(new Non_metal.carbon);
		(new Non_metal.hydrogen); (new Non_metal.hydrogen); (new Non_metal.nitrogen); new Non_metal.oxygen; new Non_metal.oxygen; (new Non_metal.nitrogen); new Non_metal.oxygen; new Non_metal.oxygen; (new Non_metal.nitrogen); new Non_metal.oxygen; new Non_metal.oxygen;
		(new Non_metal.carbon);(new Non_metal.hydrogen);(new Non_metal.hydrogen);(new Non_metal.hydrogen)] as mom
	end

	(*Al2Si2O5(OH)4					Dickite*)
class dickite =
	object (me)
		inherit Molecule.molecule "Dickite" [(new Post_transition_metal.aluminium); (new Post_transition_metal.aluminium); (new Metalloid.silicon);(new Metalloid.silicon);
		new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; (new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen)] as mom
	end

	(*KAl2(AlSi3O10)(F, OH)2		Fuchsite*)
class fuchsite =
	object (me)
		inherit Molecule.molecule "Fuchsite" [(new Alkali_metal.potassium); (new Post_transition_metal.aluminium); (new Post_transition_metal.aluminium); (new Post_transition_metal.aluminium); (new Metalloid.silicon); (new Metalloid.silicon); (new Metalloid.silicon);
		new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Halogen.fluorine; (new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen); (new Non_metal.oxygen)] as mom
	end

	(*(Ba,K)(Mg,Mn)3Si2Al2O10(OH)2	Kinoshitalite*)
class kinoshitalite =
	object (me)
		inherit Molecule.molecule "Kinoshitalite" [(new Alkali_earth_metal.barium); (new Alkali_metal.potassium); (new Alkali_earth_metal.magnesium); (new Transition_metal.manganese); (new Alkali_earth_metal.magnesium); (new Transition_metal.manganese); (new Alkali_earth_metal.magnesium); (new Transition_metal.manganese);
		(new Metalloid.silicon); (new Metalloid.silicon); (new Post_transition_metal.aluminium); (new Post_transition_metal.aluminium); new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen; new Non_metal.oxygen;
		(new Non_metal.hydrogen); new Non_metal.oxygen; (new Non_metal.hydrogen); (new Non_metal.oxygen)] as mom
	end