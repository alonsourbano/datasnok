// https://www.hackerrank.com/challenges/fp-list-replication

open System
open Microsoft.FSharp.Collections

let solve(s: int, l: int list) =
    let l = l |> List.sortBy(fun elem -> elem)
    for item in l do
        for i in 0 .. s - 1 do
            item.ToString() |> printfn "%s"

let rec readLines(l: int list) =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        readLines((input |> int) :: l)

[<EntryPoint>]
let main argv =
    let s = Console.ReadLine() |> int

    solve(s, readLines([]))
    0
