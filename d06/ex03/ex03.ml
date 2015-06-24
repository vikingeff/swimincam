(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex03.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: gleger <marvin@42.fr>                      +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 10:30:33 by gleger            #+#    #+#             *)
(*   Updated: 2015/06/23 10:30:36 by gleger           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type FIXED = sig
	type t
	val of_float		: float	-> t
	val of_int			: int	-> t
	val to_float		: t		-> float
	val to_int			: t		-> int
	val to_string		: t		-> string
	val zero			: t
	val one				: t
	val succ			: t		-> t
	val pred			: t		-> t
	val min				: t		-> t -> t
	val max				: t		-> t -> t
	val gth				: t		-> t -> bool
	val lth				: t		-> t -> bool
	val gte				: t		-> t -> bool
	val lte				: t		-> t -> bool
	val eqp				: t		-> t -> bool
	val eqs				: t		-> t -> bool
	val add				: t		-> t -> t
	val sub				: t		-> t -> t
	val mul				: t		-> t -> t
	val div				: t		-> t -> t
	val foreach 		: t		-> t -> (t -> unit) -> unit
end

module type FRACTIONNAL_BITS = sig val bits : int end
module type MAKE = functor ( Bytes : FRACTIONNAL_BITS) -> FIXED

module Make : MAKE =
	functor (Bytes : FRACTIONNAL_BITS) ->
	struct
		type t = int
		let of_float		: float	-> t = fun fix -> int_of_float(fix *. (2. ** (float_of_int Bytes.bits)))
		let of_int			: int	-> t = fun i -> i lsl Bytes.bits
		let to_float		: t		-> float = fun fix -> (float_of_int fix) *. (2. ** (-1. *. float_of_int Bytes.bits))
		let to_string		: t		-> string = fun fix -> string_of_float(to_float(fix))
		let to_int			: t		-> int = fun fix -> Bytes.bits lsr  fix
		let zero			: t =  0
		let one				: t =  of_int(1)
		let succ			: t		-> t = fun fix -> fix + 1
		let pred			: t		-> t = fun fix -> fix - 1
		let min				: t		-> t -> t = fun f1 f2 -> if f1 < f2 then f1 else f2
		let max				: t		-> t -> t = fun f1 f2 -> if f1 > f2 then f1 else f2
		let gth				: t		-> t -> bool = fun f1 f2 -> f1 > f2
		let lth				: t		-> t -> bool = fun f1 f2 -> f1 < f2
		let gte				: t		-> t -> bool = fun f1 f2 -> f1 >= f2
		let lte				: t		-> t -> bool = fun f1 f2 -> f1 <= f2
		let eqp				: t		-> t -> bool = fun f1 f2 -> f1 == f2
		let eqs				: t		-> t -> bool = fun f1 f2 -> f1 != f2
		let add				: t		-> t -> t = fun f1 f2 -> f1 + f2
		let sub				: t		-> t -> t = fun f1 f2 -> f1 - f2
		let mul				: t		-> t -> t = fun f1 f2 -> f1 * f2
		let div				: t		-> t -> t = fun f1 f2 -> f1 / f2
		let foreach : t -> t -> (t -> unit) -> unit = fun f1 f2 ptrFct ->
				let rec loop fix1 fix2 cmpfct incre =
					if (cmpfct fix1 fix2) then ()
					else (ptrFct fix1; loop (incre fix1) fix2 cmpfct incre)
					in
					if (gth f1 f2) then loop f1 f2 lth pred
					else loop f1 f2 gth succ
	end

module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

	(* ************************************************************************** *)

let () =
let x8 = Fixed8.of_float 21.10 in
let y8 = Fixed8.of_float 21.32 in
let r8 = Fixed8.add x8 y8 in
print_endline (Fixed8.to_string r8);
Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f))
