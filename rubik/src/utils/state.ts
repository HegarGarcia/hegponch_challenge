import * as _ from "lodash";
import pieces from "./pieces";

export function stateValidator(state: RubikCube.IMove[]): void {
  const hasValidLength = state.length === 54;
  const containsValidKeys = _.chain(state)
    .uniq()
    .sort()
    .isEqual(Object.keys(pieces))
    .value();

  if (!hasValidLength || !containsValidKeys) {
    throw new Error("State does not contains all pices");
  }
}
