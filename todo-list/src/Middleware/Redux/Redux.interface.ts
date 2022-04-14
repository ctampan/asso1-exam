import { ICredentials } from "../../Interfaces/Credentials.interface";

export interface ICurrent {
  isAuthenticated: boolean | null;
  payload?: ICredentials;
  errorMessage?: string;
}
