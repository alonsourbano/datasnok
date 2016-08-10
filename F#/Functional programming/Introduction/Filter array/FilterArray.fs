// https://www.hackerrank.com/challenges/fp-filter-array

open System
open Microsoft.FSharp.Collections

let rec readLines(l: int list) =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        readLines((input |> int) :: l)

[<EntryPoint>]
let main argv =
    let x = Console.ReadLine() |> int
    []
        |> readLines
        |> List.rev
        |> List.iter(fun elem ->
            if elem < x then
                printfn "%d" elem 
        )
    0

