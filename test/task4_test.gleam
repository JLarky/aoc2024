import gleeunit
import gleeunit/should
import simplifile
import task4

pub fn main() {
  gleeunit.main()
}

pub fn posible_steps_test() {
  task4.possible_steps(5, 5)
  |> should.equal([
    #(4, 5),
    #(6, 5),
    #(5, 4),
    #(5, 6),
    #(4, 4),
    #(4, 6),
    #(6, 4),
    #(6, 6),
  ])
}

pub fn part1_example_test() {
  let filepath = "./test/task4_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task4.part1(10, input)
  |> should.equal(#(
    "    XXMAS \n SAMXMS   \n   S  A   \n  A A MS X\nXMASAMX MM\nX     XA A\nS S S S SS\n A A A A A\n  M M M MM\n X X XMASX",
    18,
  ))
}

pub fn part1_test() {
  let filepath = "./test/task4_1.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  let #(_, count) = task4.part1(140, input)
  count |> should.equal(2434)
}
// pub fn drop_random_element_test() {
//   task2.drop_random_element([1, 2, 3])
//   |> should.equal([[2, 3], [1, 3], [1, 2]])
// }

// pub fn part2_example_test() {
//   let filepath = "./test/task2_1_example.txt"
//   let assert Ok(input) = simplifile.read(from: filepath)

//   task2.part2(input)
//   |> should.equal(4)
// }

// pub fn part2_test() {
//   let filepath = "./test/task2_1_input.txt"
//   let assert Ok(input) = simplifile.read(from: filepath)

//   task2.part2(input)
//   |> should.equal(710)
// }
