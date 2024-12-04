import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub fn part1(size, input) {
  let field =
    input
    |> input_to_filed()
  let #(new_field, count) =
    list.range(0, size - 1)
    |> list.fold(#(dict.new(), 0), fn(acc, x) {
      list.range(0, size - 1)
      |> list.fold(acc, fn(acc, y) {
        let cell_value = field |> dict.get(#(x, y)) |> result.unwrap(0)
        case cell_value {
          // first step have to be 1, start searching for 2 nearby
          1 -> {
            let directions = possible_directions()
            directions
            |> list.fold(acc, fn(acc, direction) {
              let next_step = apply_direction(x, y, direction)
              let next_cell = field |> dict.get(next_step) |> result.unwrap(0)
              case next_cell {
                2 -> {
                  let next_next_step =
                    apply_direction(next_step.0, next_step.1, direction)
                  let next_next_cell =
                    field |> dict.get(next_next_step) |> result.unwrap(0)
                  case next_next_cell {
                    3 -> {
                      {
                        let next_next_next_step =
                          apply_direction(
                            next_next_step.0,
                            next_next_step.1,
                            direction,
                          )
                        let next_next_next_cell =
                          field
                          |> dict.get(next_next_next_step)
                          |> result.unwrap(0)
                        case next_next_next_cell {
                          4 -> {
                            let #(acc_field, acc_count) = acc
                            #(
                              acc_field
                                |> dict.insert(
                                  next_next_next_step,
                                  next_next_next_cell,
                                )
                                |> dict.insert(next_next_step, next_next_cell)
                                |> dict.insert(next_step, next_cell)
                                |> dict.insert(#(x, y), 1),
                              acc_count + 1,
                            )
                          }
                          _ -> acc
                        }
                      }
                    }
                    _ -> acc
                  }
                }
                _ -> acc
              }
            })
          }
          _ -> acc
        }
      })
    })
  #(field_to_str(new_field, size), count)
}

fn possible_directions() {
  [#(-1, 0), #(1, 0), #(0, -1), #(0, 1), #(-1, -1), #(-1, 1), #(1, -1), #(1, 1)]
}

fn apply_direction(x, y, direction) {
  let #(dx, dy) = direction
  #(x + dx, y + dy)
}

pub fn possible_steps(x, y) {
  possible_directions()
  |> list.map(fn(direction) { apply_direction(x, y, direction) })
}

fn input_to_filed(input) {
  input
  |> string.trim()
  |> string.split(on: "\n")
  |> list.index_fold(dict.new(), fn(acc, line, x) {
    string.split(line, on: "")
    |> list.index_fold(acc, fn(acc, char, y) {
      let cell_value = case char {
        "X" -> 1
        "M" -> 2
        "A" -> 3
        "S" -> 4
        _ -> 9
      }
      case cell_value {
        9 -> acc
        _ -> acc |> dict.insert(#(x, y), cell_value)
      }
    })
  })
}

fn field_to_str(field, size) {
  list.range(0, size - 1)
  |> list.map(fn(x) {
    list.range(0, size - 1)
    |> list.map(fn(y) {
      field
      |> dict.get(#(x, y))
      |> result.map(fn(cell) {
        case cell {
          1 -> "X"
          2 -> "M"
          3 -> "A"
          4 -> "S"
          _ -> " "
        }
      })
      |> result.unwrap(" ")
    })
    |> string.join("")
  })
  |> string.join("\n")
}
