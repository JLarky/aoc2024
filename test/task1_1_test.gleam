import gleeunit
import gleeunit/should
import task1_1

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  task1_1.task1_1()
  |> should.equal("test")
}
