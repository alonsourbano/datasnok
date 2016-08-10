// https://www.hackerrank.com/challenges/fp-array-of-n-elements

open System
open Microsoft.FSharp.Collections

let appendToList(n: int, l: int list) =
    let newList = n :: l
    newList

let f n = //Complete this function
    let l = []
    let newList = l
    for i in 0 .. n - 1 do
        newList = appendToList(i, newList)
    l

let main() =
    let input = Console.ReadLine()
    let n = int input
    printfn "%d" (f n).Length
 
main()
