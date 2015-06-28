
let pika = ref (new Pokemon.pokemon)

let realQuit () =
    ignore (Unix.system( "kill -9 `ps ax | grep \"afplay sound.mp3\" | head -n +2 | cut -d' ' -f2`" ));
    GMain.quit ()

let log_to_file tar file_name =
	let bind_call name =
		let oc = open_out name in
		Printf.fprintf oc "%d %d %d %d\n"
			(tar#health) (tar#hygiene) (tar#energy) (tar#happyness);
		close_out oc;
		Try.return name
	in
	match Try.bind (Try.return file_name) bind_call with
	| Try.Success v ->
		prerr_endline "Success Save"
	| Try.Failure v ->
		prerr_endline ("Save Failure from " ^ (Printexc.to_string v))

let log_from_file file_name =
	let bind_call name =
		let oc = open_in name in
		let newpika = ((!pika)#from_file oc) in
		close_in oc;
		Try.return newpika
	in
	match (Try.bind (Try.return file_name) bind_call) with
	| Try.Success v ->
		prerr_endline "Success Load"; pika := v
	| Try.Failure v ->
		prerr_endline ("Load Failure from " ^ (Printexc.to_string v))

module Aux = struct

	let load file = log_from_file file; true

	let save file = log_to_file (!pika) file; true
		   
end

let _ = ignore(GMain.init ())

let window =
	ignore (Unix.system( "(osascript -e 'set volume 4' ; afplay sound.mp3) > /dev/null 2>&1 &" ));
	let wnd =	GWindow.window
				~resizable: false
				~position: `CENTER
				~title: "Pokemon v.1-0" () in
	ignore (wnd#connect#destroy GMain.quit);
	wnd

let confirm _ =
	let dlg =	GWindow.message_dialog
				~message:	"<b><big>Voulez-vous vraiment quitter ?</big>\n\n\
					Attention :\nToutes les modifications seront perdues</b>\n"
				~parent: window
				~destroy_with_parent: true
				~use_markup: true
				~message_type: `WARNING
				~position: `CENTER_ON_PARENT
				~buttons: GWindow.Buttons.yes_no () in
	let res = dlg#run () = `NO in
	realQuit();
	dlg#destroy ();
	res

let vbox = GPack.vbox ~spacing: 5 ~border_width: 5 ~packing:window#add ()

let spawnAbout () =
	let dlg =	GWindow.about_dialog
				~authors: ["rda-cost gleger"]
				~icon_name: "Test"
				~copyright: "Copyright © 2015-2015 rda-cost"
				~license: "GNU General Public License v3"
				~version: "Pokemon v.1-0"
				~website: "http://www.42.fr"
				~website_label: "42"
				~position: `CENTER_ON_PARENT
				~parent: window
				~destroy_with_parent: true () in
	ignore (dlg#run ());
	dlg#misc#hide ()

let spawnLoad () =
	let dlg =	GWindow.file_chooser_dialog
				~action: `OPEN
				~parent: window
				~position: `CENTER_ON_PARENT
				~destroy_with_parent: true () in
	dlg#add_button_stock `CANCEL `CANCEL;
	dlg#add_select_button_stock `OPEN `OPEN;
	if dlg#run () = `OPEN then Gaux.may (Aux.load)
	dlg#filename;
	dlg#misc#hide ()

let spawnSave () =
	let dlg =	GWindow.file_chooser_dialog
				~action: `OPEN
				~parent: window
				~position: `CENTER_ON_PARENT
				~destroy_with_parent: true () in
	dlg#add_button_stock `CANCEL `CANCEL;
	dlg#add_select_button_stock `SAVE `SAVE;
	if dlg#run () = `SAVE then Gaux.may (Aux.save)
	dlg#filename;
	dlg#misc#hide ()

let menu_bar =
	let menubar = GMenu.menu_bar ~packing: vbox#pack () in
	let factory = new GMenu.factory menubar in
	let accel_group = factory#accel_group in
	let file_menu = factory#add_submenu "File" in
	let about_menu = factory#add_submenu "About" in
	let factory = new GMenu.factory file_menu ~accel_group in
	let about_factory = new GMenu.factory about_menu ~accel_group in
	ignore (about_factory#add_item "About"
		~key: GdkKeysyms._r ~callback: spawnAbout);
	ignore (factory#add_item "Open" ~key: GdkKeysyms._o ~callback: spawnLoad);
	ignore (factory#add_item "Save" ~key: GdkKeysyms._r ~callback: spawnSave);
	ignore (factory#add_item "Quit" ~key: GdkKeysyms._Q ~callback: realQuit)

let nbox =	GPack.vbox
			~spacing: 5
			~border_width: 5
			~packing: (vbox#pack ~expand: false) ()

let image = GMisc.image ~packing: nbox#add ()

let updateImage str =
	let bind_call name =
		image#set_pixbuf (GdkPixbuf.from_file_at_size name 200 200);
		Try.return  name
	in
	ignore(Try.bind (Try.return ("png/" ^ str ^ ".png")) bind_call)

let genPbar () =
	let align =	GBin.alignment
				~xalign: 0.5
				~yalign: 0.1
				~xscale: 0.0
				~yscale: 0.0
				~packing: nbox#add () in
	GRange.progress_bar ~packing: align#add ()

let pbars =	(genPbar (), genPbar (), genPbar (), genPbar ())

let updatePbars () =
	(match pbars with | (pbar1, pbar2, pbar3, pbar4) ->
	pbar1#set_fraction (float_of_int((!pika)#health) /. 100.0);
	pbar2#set_fraction (float_of_int((!pika)#hygiene)  /. 100.0);
	pbar3#set_fraction (float_of_int((!pika)#energy) /. 100.0);
	pbar4#set_fraction (float_of_int((!pika)#happyness)  /. 100.0);
	pbar1#set_text ("health : " ^ (string_of_int ((!pika)#health)));
	pbar2#set_text ("hygiene : " ^ (string_of_int ((!pika)#hygiene)));
	pbar3#set_text ("energy : " ^ (string_of_int ((!pika)#energy)));
	pbar4#set_text ("happyness : " ^ (string_of_int ((!pika)#happyness))););
	true

let bbox =	GPack.button_box `HORIZONTAL
			~spacing: 5
			~layout: `SPREAD
			~packing: (vbox#pack ~expand: false) ()

let action_button stock event action =
	let dlg =	GWindow.file_chooser_dialog
				~action: `OPEN
				~parent: window
				~position: `CENTER_ON_PARENT
				~destroy_with_parent: true () in
	dlg#add_button_stock `CANCEL `CANCEL;
	dlg#add_select_button_stock stock event;
	let btn = GButton.button ~stock ~packing: bbox#add () in
	ignore(GMisc.image ~stock ~packing: btn#set_image ());
	ignore (btn#connect#clicked (fun () ->
		if dlg#run () = `OPEN then Gaux.may action
		dlg#filename;
		dlg#misc#hide ()));
	btn

let checkPika () =
	if ((!pika)#is_dead = true) then 
		(let dlg =	GWindow.message_dialog
					~message: "<b><big>Tu as perdu grosse merde</big></b>"
					~parent: window
					~destroy_with_parent: true
					~use_markup: true
					~message_type: `QUESTION
					~position: `CENTER_ON_PARENT
					~buttons: GWindow.Buttons.close () in
		ignore(dlg#run () = `CLOSE); 
		dlg#destroy ();
		realQuit ())
	else
		()

let	generateButton lbl cbox =
	let btn = GButton.button
		~label: (String.uppercase lbl)
		~packing: cbox#add () in
	let anonym () =
		pika := (match lbl with
		| "eat" -> (!pika)#eat
		| "bath" -> (!pika)#bath
		| "kill" -> (!pika)#kill
		| "thunder" -> (!pika)#thunder
		| "dance" -> (!pika)#dance
		| "walk" -> (!pika)#walk
		| "hello" -> (!pika)#hello
		| "roar" -> (!pika)#roar
		| _ -> (!pika));
		checkPika();
		ignore(updatePbars());
		updateImage(lbl)
	in
	ignore (btn#connect#clicked ~callback: anonym)

let eat_button = generateButton "eat" bbox 

let bath_button = generateButton "bath" bbox

let kill_button = generateButton "kill" bbox

let thunder_button = generateButton "thunder" bbox

let bbox1 =	GPack.button_box `HORIZONTAL
			~spacing: 5
			~layout: `SPREAD
			~packing: (vbox#pack ~expand: false) ()

let dance_button = generateButton "dance" bbox1

let walk_button = generateButton "walk" bbox1

let hello_button = generateButton "hello" bbox1

let roar_button = generateButton "roar" bbox1

let updatePika () =
	pika := (!pika)#entropy;
	checkPika(); 
	updatePbars ()

let _ =
	ignore (GMain.Timeout.add ~ms:1000 ~callback:(updatePika));
	updateImage "pika";
	ignore (window#event#connect#delete confirm);
	window#show ();
	GMain.main ()
