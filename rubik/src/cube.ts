import { moves, stateValidator } from "./utils";

export default class Cube {
  private state: RubikCube.IPiece[] = [];

  constructor(...initialState: RubikCube.IPiece[]) {
    stateValidator(initialState);
    this.state = initialState;
  }

  private setState(nextState: RubikCube.IPiece[]) {
    stateValidator(nextState);
    this.state = nextState;
  }
}
