// https://www.hackerrank.com/challenges/fp-list-replication

open System
open Microsoft.FSharp.Collections

[<EntryPoint>]
let main argv =
    let s = Console.ReadLine() |> int
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.map(fun item -> int item)
        |> Seq.toList
        |> List.sortBy(fun item -> item)
        |> List.iter(fun item ->
            {1 .. s}
                |> Seq.iter(fun _ ->
                        printfn "%d" item
                )
        )
    0
