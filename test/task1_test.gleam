import gleeunit
import gleeunit/should
import simplifile
import task1

pub fn main() {
  gleeunit.main()
}

pub fn task1_example_test() {
  let filepath = "./test/task1_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task1.task1_1(input)
  |> should.equal(11)
}

pub fn task1_test() {
  let filepath = "./test/task1_1_input.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task1.task1_1(input)
  |> should.equal(1_646_452)
}

pub fn task1_2_example_test() {
  let filepath = "./test/task1_2_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task1.task1_2(input)
  |> should.equal(31)
}

pub fn task2_test() {
  let filepath = "./test/task1_2_input.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task1.task1_2(input)
  |> should.equal(23_609_874)
}
