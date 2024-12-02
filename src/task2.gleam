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
  let safe_reports =
    reports_as_numbers
    |> list.filter(fn(report) { is_report_safe(report) })
  safe_reports |> list.length()
}

fn is_report_safe(report) {
  let #(_, diffs) =
    report
    |> list.fold(#(0, []), fn(acc, x) {
      case acc {
        #(0, []) -> #(x, [])
        #(prev, acc) -> #(x, [prev - x, ..acc])
      }
    })

  let has_safe_amount =
    !list.any(diffs, fn(x) {
      let diff = int.absolute_value(x)
      let safe_amount = diff == 1 || diff == 2 || diff == 3
      !safe_amount
    })
  let assert [first, ..rest] = diffs
  let has_different_sign = rest |> list.any(fn(x) { first * x < 0 })
  !has_different_sign && has_safe_amount
}

pub fn drop_random_element(diffs) {
  let indexes = list.range(1, list.length(diffs))
  let alternatives =
    indexes
    |> list.map(fn(x) {
      let assert #(left, [_drop, ..right]) = list.split(diffs, x - 1)
      list.flatten([left, right])
    })
  alternatives
}

pub fn is_report_safe_part2(report) {
  let alternatives = drop_random_element(report)
  alternatives |> list.any(fn(x) { is_report_safe(x) })
}

pub fn part2(input) {
  let reports_as_numbers =
    input
    |> string.trim()
    |> string.split(on: "\n")
    |> list.map(fn(x) {
      string.split(x, on: " ")
      |> list.map(fn(x) { int.parse(x) })
      |> result.values()
    })
  let safe_reports =
    reports_as_numbers
    |> list.filter(fn(report) {
      is_report_safe(report) || is_report_safe_part2(report)
    })
  safe_reports |> list.length()
}
