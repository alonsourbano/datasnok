// https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list

open System
open Microsoft.FSharp.Collections

let rec readLines l: int list =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        (input |> int) :: l
            |> readLines

[<EntryPoint>]
let main argv =
    []
        |> readLines
        |> List.rev
        |> List.mapi(fun i elem -> i, int elem)
        |> List.filter(fun(i, elem) -> i % 2 = 1)
        |> List.iter (fun (i, elem) -> printfn "%d" elem)
    0
