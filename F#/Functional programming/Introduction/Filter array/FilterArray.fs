// https://www.hackerrank.com/challenges/fp-filter-array

open System

let solve(x: int, l: int list) =
    for i in l.Length - 1 .. -1 .. 0 do
        let item = l.Item i
        if item < x then
            item.ToString() |> printfn "%s"

let rec readLines(l: int list) =
    let input = Console.ReadLine()
    if String.IsNullOrEmpty input then
        l
    else
        readLines((input |> int) :: l)

[<EntryPoint>]
let main argv =
    let x = Console.ReadLine() |> int
    solve(x, readLines([]))
    0
