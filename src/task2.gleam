import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn part1(input) {
  let reports_as_numbers =
    input
    |> string.trim()
    |> string.split(on: "\n")
    |> list.map(fn(x) {
      string.split(x, on: " ")
      |> list.map(fn(x) { int.parse(x) })
      |> result.values()
    })
  let reports_as_diffs =
    reports_as_numbers
    |> list.map(fn(report) {
      let #(_, diff) =
        report
        |> list.fold(#(0, []), fn(acc, x) {
          case acc {
            #(0, []) -> #(x, [])
            #(prev, acc) -> #(x, [prev - x, ..acc])
          }
        })
      diff
    })
  let reports_safe_amounts =
    reports_as_diffs
    |> list.filter(fn(diffs) {
      !list.any(diffs, fn(x) {
        let diff = int.absolute_value(x)
        let safe_amount = diff == 1 || diff == 2 || diff == 3
        !safe_amount
      })
    })
  let reports_all_same_sign =
    reports_safe_amounts
    |> list.filter(fn(x) {
      let assert [first, ..rest] = x
      let has_different_sign = rest |> list.any(fn(x) { first * x < 0 })
      !has_different_sign
    })
  reports_all_same_sign |> list.length()
}
