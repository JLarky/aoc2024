import gleeunit
import gleeunit/should
import simplifile
import task2

pub fn main() {
  gleeunit.main()
}

pub fn part1_example_test() {
  let filepath = "./test/task2_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part1(input)
  |> should.equal(2)
}

pub fn part1_test() {
  let filepath = "./test/task2_1_input.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part1(input)
  |> should.equal(680)
}

pub fn drop_random_element_test() {
  task2.drop_random_element([1, 2, 3])
  |> should.equal([[2, 3], [1, 3], [1, 2]])
}

pub fn part2_example_test() {
  let filepath = "./test/task2_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part2(input)
  |> should.equal(4)
}

pub fn part2_test() {
  let filepath = "./test/task2_1_input.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task2.part2(input)
  |> should.equal(710)
}
