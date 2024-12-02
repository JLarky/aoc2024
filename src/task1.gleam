import gleam/dict
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn task1_1(input) {
  let number_pairs =
    string.split(input, on: "\n")
    |> list.filter(fn(x) { x != "" })
    |> list.map(fn(x) {
      let assert [a, b] =
        string.split(x, on: "   ")
        |> list.map(fn(x) { int.parse(x) })
        |> result.values()
      #(a, b)
    })
  let left_numbers =
    number_pairs |> list.map(fn(pait) { pait.0 }) |> list.sort(by: int.compare)
  let right_numbers =
    number_pairs |> list.map(fn(pait) { pait.1 }) |> list.sort(by: int.compare)
  list.zip(left_numbers, right_numbers)
  |> list.map(fn(x) { int.absolute_value(x.0 - x.1) })
  |> int.sum()
}

pub fn task1_2(input) {
  let number_pairs =
    string.split(input, on: "\n")
    |> list.filter(fn(x) { x != "" })
    |> list.map(fn(x) {
      let assert [a, b] =
        string.split(x, on: "   ")
        |> list.map(fn(x) { int.parse(x) })
        |> result.values()
      #(a, b)
    })
  let left_numbers =
    number_pairs
    |> list.map(fn(pait) { pait.0 })
  let right_numbers =
    number_pairs
    |> list.map(fn(pait) { pait.1 })
    |> list.sort(by: int.compare)
    |> list.group(fn(x) { x })
  left_numbers
  |> list.map(fn(x) {
    let matches = dict.get(right_numbers, x) |> result.unwrap([])
    x * list.length(matches)
  })
  |> int.sum()
}
