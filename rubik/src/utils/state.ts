import * as _ from "lodash";

const pieces = Object.values(RubikCube.IPiece);

export function stateValidator(state: RubikCube.IPiece[]): void {
  const hasValidLength = state.length === 54;
  const containsValidKeys = _.chain(state)
    .uniq()
    .sort()
    .isEqual(pieces)
    .value();

  if (!hasValidLength || !containsValidKeys) {
    throw new Error("State does not contains all pices");
  }
}
