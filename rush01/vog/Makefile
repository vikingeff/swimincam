NAME = tamagoshi

SRC =  try.ml  pokemon.ml  main.ml

OBJOPT = $(SRC:.ml=.cmx)

OBJC = $(SRC:.ml=.cmo)

LIBS =  -g -package lablgtk2 -linkpkg

CC_OPT = ocamlfind ocamlopt unix.cmxa $(LIBS)

CC_BYT = ocamlfind ocamlc unix.cma $(LIBS)

all: $(NAME)

$(NAME): $(NAME).opt $(NAME).byt
	rm -rf $(NAME)
	ln -s $(NAME).byt $(NAME)

$(NAME).opt: $(OBJOPT)
	$(CC_OPT) $(OBJOPT) -o $(NAME).opt

$(NAME).byt: $(OBJC)
	$(CC_BYT) $(OBJC) -o $(NAME).byt

%.cmx: %.ml
	$(CC_OPT) -c $(SRC) $<

%.cmo: %.ml
	$(CC_BYT) -c $(SRC) $<

clean:
	rm -rf $(SRC:.ml=.cm*) $(SRC:.ml=.o)

fclean: clean
	rm -rf $(NAME).byt $(NAME).opt $(NAME)

re: fclean all
