// https://www.hackerrank.com/challenges/fp-array-of-n-elements

open System
open Microsoft.FSharp.Collections

let f n = //Complete this function
    [1 .. n]

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    printfn "%d" (f n).Length
    0
