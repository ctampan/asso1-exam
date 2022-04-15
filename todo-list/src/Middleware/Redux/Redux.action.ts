import { ThunkDispatch as Dispatch } from "redux-thunk";
import sha256 from "sha256";
import { isCredentialValid } from "../../Hooks/useAuth";
import { ICredentials } from "../../Interfaces/Credentials.interface";
import { store } from "./Redux.config";

import * as constants from "./Redux.constant";

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
  if (isCredentialValid({ username, password })) {
    return async (dispatch: Dispatch<AuthenticationAction, {}, any>) => {
      const payload: ICredentials = {
        username,
        password: sha256(password),
      };
      dispatch(authenticate(payload));
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
