import { IAuthenticate, IUnauthenticate, IDefault } from "./Redux.action";
import { AUTHENTICATE, UNAUTHENTICATE } from "./Redux.constant";
import { ICurrent } from "./Redux.interface";

export default function currentReducer(
  state: ICurrent = { isAuthenticated: null },
  action: IAuthenticate | IUnauthenticate | IDefault
): ICurrent {
  switch (action.type) {
    case AUTHENTICATE:
      return {
        ...state,
        payload: action.payload,
        isAuthenticated: true,
        errorMessage: undefined,
      };
    case UNAUTHENTICATE:
      return {
        ...state,
        payload: undefined,
        isAuthenticated: false,
        errorMessage: action.errorMessage,
      };
    default:
      return { ...state };
  }
}
