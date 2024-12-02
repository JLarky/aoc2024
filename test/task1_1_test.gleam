import gleeunit
import gleeunit/should
import simplifile
import task1_1

pub fn main() {
  gleeunit.main()
}

pub fn hello_world_test() {
  let filepath = "./test/task1_1_example.txt"
  let assert Ok(input) = simplifile.read(from: filepath)

  task1_1.task1_1(input)
  |> should.equal(11)
}
