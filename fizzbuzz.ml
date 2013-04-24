(* Variations of Fizzbuzz in OCaml, translated from the Rust version in
   "FizzBuzz Revisited" by Lindsey Kuper:
   http://composition.al/blog/2013/03/02/fizzbuzz-revisited/ *)

(* The FizzBuzz test proposed by Imran Ghory:
   http://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/ *)
(* and made famous by Jeff Atwood:
   http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html *)


(* Utility functions *)

let (--) i j =
  let rec aux n acc =
    if n < i then acc else aux (n-1) (n::acc) in
  aux j []

(* Version 0: Original *)

let is_three n = n mod 3 = 0
let is_five n = n mod 5  = 0
let is_fifteen n = n mod 15 = 0

let ver0 =
  let nums = 1 -- 100 in
  let rec aux x =
    if is_fifteen x then "Fizzbuzz" else
      if is_three x then "Fizz" else
        if is_five x then "Buzz" else
          string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Version 1: Transliterate into match *)
let ver1 =
  let nums = 1 -- 100 in
  let rec aux x =
    match x with
      | _ when is_fifteen x  -> "FizzBuzz"
      | _ when is_three x    -> "Fizz"
      | _ when is_five x     -> "Buzz"
      | _ -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Version 2: Match against tuples of bools *)
let ver2 =
  let nums = 1 -- 100 in
  let rec aux x =
    match (is_three(x), is_five(x)) with
      | (true, true) -> "FizzBuzz"
      | (true, false) -> "Fizz"
      | (false, true) -> "Buzz"
      | _ -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Version 2.1: Explicit (false, false) match *)
let ver2_1 =
  let nums = 1 -- 100 in
  let rec aux x =
    match (is_three(x), is_five(x)) with
      | (true, true) -> "FizzBuzz"
      | (true, false) -> "Fizz"
      | (false, true) -> "Buzz"
      | (false, false) -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Version 3: match against tuples of ints *)
let ver3 =
  let nums = 1 -- 100 in
  let rec aux x =
    match (x mod 3, x mod 5) with
      | (0, 0) -> "FizzBuzz"
      | (0, n) when n != 0 -> "Fizz"
      | (m, 0) when m != 0 -> "Buzz"
      | (m, n) when m != 0 && n != 0 -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Version 3.1: Get rid of pattern guards *)
let ver3_1 =
  let nums = 1 -- 100 in
  let rec aux x =
    match (x mod 3, x mod 5) with
      | (0, 0) -> "FizzBuzz"
      | (0, _) -> "Fizz"
      | (_, 0) -> "Buzz"
      | (_, _) -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))


(* Final version: Match against tuples of rems *)

type nonzerorem = One | Two | Three | Four
type rem = Zero | Other of nonzerorem

let int_to_rem n =
  match n with
    | 0 -> Zero
    | 1 -> Other(One)
    | 2 -> Other(Two)
    | 3 -> Other(Three)
    | 4 -> Other(Four)
    | _ -> failwith "No such remainder"

let ver_final =
  let nums = 1 -- 100 in
  let rec aux x =
    match (int_to_rem(x mod 3), int_to_rem(x mod 5)) with
      | (Zero, Zero) -> "FizzBuzz"
      | (Zero, Other(_)) -> "Fizz"
      | (Other(_), Zero) -> "Buzz"
      | (Other(_), Other(_)) -> string_of_int x in
  (map (Printf.sprintf "%s") (map aux nums))
    
