exception FilterFail
exception BinderFail

	
	type 'a t = Success of 'a | Failure of exn

	let return : 'a -> 'a t = fun param -> Success param

	let bind : 'a t -> ('a -> 'b t) -> 'b t = fun param f ->
		match param with
		| Failure v -> Failure BinderFail
		| Success v -> ( 
			try
				f v				
			with
			| ex -> Failure ex
		)

	let recover : 'a t -> (exn -> 'b t) -> 'b t = fun param f ->
		match param with
		| Success v -> param
		| Failure v -> (
			try
				f v		
			with
			| ex -> Failure ex
		)

	let filter : 'a t -> ('a -> bool) -> 'a t = fun param f ->
		match param with
		| Failure v -> param
		| Success v -> 
			if f v then param
			else Failure FilterFail

	let flatten : 'a t t -> 'a t = fun param ->
		match param with
		| Failure v -> Failure v
		| Success v -> 	(match v with
						| Failure vf -> Failure vf
						| Success vf -> Success vf)

