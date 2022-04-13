import { ThunkDispatch as Dispatch } from "redux-thunk";
import { store } from "./Redux.config";

import * as constants from "./Redux.constant";
import { ICredentials } from "./Redux.interface";

export interface IDefault {
  type: typeof constants.DEFAULT;
}

export interface IAuthenticate {
  type: typeof constants.AUTHENTICATE;
  payload: ICredentials;
}

function authenticate(payload: ICredentials): IAuthenticate {
  return {
    type: constants.AUTHENTICATE,
    payload: payload,
  };
}

export interface IUnauthenticate {
  type: typeof constants.UNAUTHENTICATE;
  errorMessage?: string;
}

function unauthenticate(errorMessage?: string): IUnauthenticate {
  return {
    type: constants.UNAUTHENTICATE,
    errorMessage: errorMessage,
  };
}

export type AuthenticationAction = IAuthenticate | IUnauthenticate;

export function logInWithCredentials({ username, password }: ICredentials) {
  if (username === "admin" && password === "123") {
    return async (dispatch: Dispatch<AuthenticationAction, {}, any>) => {
      const dummyPayload: ICredentials = {
        username: "admin",
        password: "123",
      };
      dispatch(authenticate(dummyPayload));
    };
  }

  return async (dispatch: Dispatch<AuthenticationAction, {}, any>) => {
    dispatch(unauthenticate("Invalid Credentials"));
  };
}

export function logOut(errMsg?: string) {
  return async (dispatch: Dispatch<AuthenticationAction, {}, any>) => {
    dispatch(unauthenticate(errMsg));
  };
}

export function checkAuthentication() {
  return async (dispatch: Dispatch<AuthenticationAction, {}, any>) => {
    const formattedErrMsg = store.getState().errorMessage;

    const formattedPayload = store.getState().payload as ICredentials;

    formattedPayload !== undefined
      ? dispatch(authenticate({ ...formattedPayload }))
      : dispatch(logOut(formattedErrMsg));
  };
}

export function updateError(errorMessage?: string): IUnauthenticate {
  return {
    type: constants.UNAUTHENTICATE,
    errorMessage: errorMessage,
  };
}
