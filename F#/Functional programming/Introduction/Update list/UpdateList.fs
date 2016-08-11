// https://www.hackerrank.com/challenges/fp-update-list

open System

[<EntryPoint>]
let main argv =
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.map(fun item -> int item)
        |> Seq.map(fun item -> item |> abs)
        |> Seq.iter(fun item -> printfn "%d" item)
    0
