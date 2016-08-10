// https://www.hackerrank.com/challenges/fp-sum-of-odd-elements

open System

[<EntryPoint>]
let main argv =
    Seq.initInfinite(fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun s -> s |> String.IsNullOrEmpty |> not)
        |> Seq.map(fun item -> int item)
        |> Seq.filter(fun item -> abs(item) % 2 = 1)
        |> Seq.sum
        |> printfn "%d"
    0
