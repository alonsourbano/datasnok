// https://www.hackerrank.com/challenges/fp-hello-world-n-times

open System

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    {1 .. n}
        |> Seq.iter(fun _ ->
            printfn "Hello World"
        )
    0
