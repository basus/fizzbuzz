-- Write a program that prints the numbers from 1 to 100. But for multiples of
-- three print “Fizz” instead of the number and for the multiples of five print
-- “Buzz”. For numbers which are multiples of both three and five print
-- “FizzBuzz”.

fizzbuzz :: Int -> String
fizzbuzz x
  | x `mod` 15 == 0 = "FizzBuzz"
  | x `mod` 3 == 0 = "Fizz"
  | x `mod` 5 == 0 = "Buzz"
  | otherwise = show x

main = do putStrLn $ unwords $ [fizzbuzz x | x <- [1..100]]