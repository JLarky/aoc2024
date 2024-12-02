import gleeunit
import gleeunit/should
import simplifile
import task2

pub fn main() {
  gleeunit.main()
}

pub fn task2_example_test() {
  let filepath = "./test/task2_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part1(input)
  |> should.equal(2)
}

pub fn task2_test() {
  let filepath = "./test/task2_1_input.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part1(input)
  |> should.equal(680)
}
// pub fn task1_2_example_test() {
//   let filepath = "./test/task1_2_example.txt"
//   let assert Ok(input) = simplifile.read(from: filepath)

//   task2.task1_2(input)
//   |> should.equal(31)
// }

// pub fn task2_test() {
//   let filepath = "./test/task1_2_input.txt"
//   let assert Ok(input) = simplifile.read(from: filepath)

//   task2.task1_2(input)
//   |> should.equal(23_609_874)
// }
