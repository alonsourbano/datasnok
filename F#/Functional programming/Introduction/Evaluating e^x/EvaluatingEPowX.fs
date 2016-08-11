// https://www.hackerrank.com/challenges/eval-exp

open System

let factorial n =
    if n = 0 || n = 1 then
        1
    else
        {2 .. n}
            |> Seq.fold(fun a b -> a * b) 1

let evalex x =
    {1 .. 9}
        |> Seq.fold(fun acc item ->
            acc + Math.Pow(x, (item |> double)) / (item |> factorial |> double)
        ) 1.0

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    {1 .. n}
        |> Seq.map(fun _ -> Console.ReadLine())
        |> Seq.map(fun item -> double item)
        |> Seq.map(fun item -> evalex item)
        |> Seq.iter(fun item -> printfn "%.4f" item)
    0
