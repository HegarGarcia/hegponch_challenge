import { moves, stateValidator } from "./utils";

export default class Cube {
  constructor(...initialState: RubikCube.IMove[]) {
    stateValidator(initialState);
  }
}
