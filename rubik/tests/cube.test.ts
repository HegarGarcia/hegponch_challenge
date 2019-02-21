import Cube from "../src/cube";
import { moves } from "../src/utils";

test("Create cube", () => {
  expect(() => new Cube(moves.B)).toThrow();
});
