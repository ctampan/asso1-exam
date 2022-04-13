export interface ICurrent {
  isAuthenticated: boolean | null;
  payload?: ICredentials;
  errorMessage?: string;
}

export interface ICredentials {
  username: string;
  password: string;
}
