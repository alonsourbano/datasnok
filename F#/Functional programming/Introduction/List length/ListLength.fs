// https://www.hackerrank.com/challenges/fp-list-length

open System

[<EntryPoint>]
let main argv =
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.map(fun item -> int item)
        |> Seq.fold(fun acc _ -> acc + 1) 0
        |> printfn "%d"
    0
