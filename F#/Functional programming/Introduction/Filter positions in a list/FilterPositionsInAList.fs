// https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list

open System
open Microsoft.FSharp.Collections

[<EntryPoint>]
let main argv =
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.toList
        |> List.mapi(fun i elem -> i, int elem)
        |> List.filter(fun(i, elem) -> i % 2 = 1)
        |> List.iter (fun (i, elem) -> printfn "%d" elem)
    0
