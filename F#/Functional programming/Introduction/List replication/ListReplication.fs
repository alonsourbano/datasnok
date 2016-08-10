// https://www.hackerrank.com/challenges/fp-list-replication

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
    let s = Console.ReadLine() |> int

    []
        |> readLines
        |> List.sortBy(fun elem -> elem)
        |> List.iter(fun elem ->
            for i in 1 .. s do
                printfn "%d" elem
        )
    0
