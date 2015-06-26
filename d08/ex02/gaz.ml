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

class methane =
	object (me)
		inherit Alkane.alkane 1 as mom
	end

class ethane =
	object (me)
		inherit Alkane.alkane 2 as mom
	end

class octane =
	object (me)
		inherit Alkane.alkane 8 as mom
	end

class eicosane =
	object (me)
		inherit Alkane.alkane 20 as mom
	end

class triacontane =
	object (me)
		inherit Alkane.alkane 30 as mom
	end
	