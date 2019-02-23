import Cube from "../src/cube";
import { moves } from "../src/utils";

const pieces = Object.values(RubikCube.IPiece);

test("Create cube", () => {
  expect(() => new Cube(pieces[0])).toThrow();
  expect(new Cube(...pieces)).toBeTruthy();
});
