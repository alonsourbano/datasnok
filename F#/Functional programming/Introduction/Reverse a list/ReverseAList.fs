// https://www.hackerrank.com/challenges/fp-reverse-a-list

open System

[<EntryPoint>]
let main argv =
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.toList
        |> List.map(fun item -> int item)
        |> List.rev
        |> List.iter(fun item -> printfn "%d" item)
    0
