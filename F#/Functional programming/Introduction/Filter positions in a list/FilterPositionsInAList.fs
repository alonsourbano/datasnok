// https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list

open System

let solve(l: int list) =
    
    for i in l.Length - 1 .. -1 .. 0 do
        let item = l.Item i
        if i % 2 = 1 then
            i.ToString() |> printfn "%s"

let rec readLines l: int list =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        (input |> int) :: l |> readLines

[<EntryPoint>]
let main argv =
    [] |> readLines |> solve
    0
