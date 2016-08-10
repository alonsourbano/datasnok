// https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list

open System
open Microsoft.FSharp.Collections

let solve(l: int list) =
    let newList = List.rev l
    for i in 0 .. newList.Length - 1 do
        let item = newList.Item i
        if i % 2 = 1 then
            item.ToString() |> printfn "%s"

let rec readLines l: int list =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        (input |> int) :: l |> readLines

[<EntryPoint>]
let main argv =
    [] |> readLines |> solve
    0
