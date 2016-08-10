// https://www.hackerrank.com/challenges/fp-array-of-n-elements

open System
open Microsoft.FSharp.Collections

let rec appendToList(n: int, l: int list) =
    if n = 0 then
        l
    else
        appendToList(n - 1, n :: l)

let f n = //Complete this function
    appendToList(n, [])

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    printfn "%d" (f n).Length
    0
