// https://www.hackerrank.com/challenges/fp-filter-array

open System
open Microsoft.FSharp.Collections

[<EntryPoint>]
let main argv =
    let x = Console.ReadLine() |> int
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.map(fun item -> int item)
        |> Seq.toList
        |> List.iter(fun elem ->
            if elem < x then
                printfn "%d" elem 
        )
    0
