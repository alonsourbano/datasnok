// https://www.hackerrank.com/challenges/fp-hello-world-n-times

open System

let solve(n: int) =
    for i in 1 .. n do
        printfn "Hello World"

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    solve(n)
    0
