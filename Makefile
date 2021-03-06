all: c haskell java ocaml python rust ruby


bin:
	mkdir bin
c: bin fizzbuzz.c
	gcc -o bin/fizzbuzz-c fizzbuzz.c
haskell: bin fizzbuzz.hs
	ghc -o bin/fizzbuzz-hs fizzbuzz.hs
	mv fizzbuzz.o bin/
	mv fizzbuzz.hi bin/
java: bin fizzbuzz.java
	javac fizzbuzz.java
	mv fizzbuzz.class bin/
	echo "java -classpath $(PWD)/bin fizzbuzz" > bin/fizzbuzz-java
	chmod +x bin/fizzbuzz-java
ocaml:
	ocamlc fizzbuzz.ml -o bin/fizzbuzz-ocaml
	mv fizzbuzz.cmo bin/
	mv fizzbuzz.cmi bin/
python: bin fizzbuzz.py
	cp fizzbuzz.py bin/fizzbuzz-py
	chmod +x bin/fizzbuzz-py
ruby: bin fizzbuzz.rb
	cp fizzbuzz.py bin/fizzbuzz-rb
	chmod +x bin/fizzbuzz-rb
rust: fizzbuzz.rs
	rustc -o bin/fizzbuzz-rs fizzbuzz.rs
clean: bin
	rm bin/*
	rmdir bin
