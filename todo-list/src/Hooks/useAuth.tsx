import { useContext } from "react";
import { ReactReduxContext } from "react-redux";
import sha256 from "sha256";
import { ICredentials } from "../Interfaces/Credentials.interface";

function isUsernameAvailable(username: string) {
  const credentials: ICredentials[] = JSON.parse(
    localStorage.getItem("credentials") ?? `[]`
  );

  return !credentials.some((credential) => credential.username === username);
}

function addCredential({ username, password }: ICredentials) {
  const credentials: ICredentials[] = JSON.parse(
    localStorage.getItem("credentials") ?? `[]`
  );

  const hashedPassword = sha256(password);

  localStorage.setItem(
    "credentials",
    JSON.stringify([...credentials, { username, password: hashedPassword }])
  );
}

function isCredentialValid({ username, password }: ICredentials) {
  const credentials: ICredentials[] = JSON.parse(
    localStorage.getItem("credentials") ?? `[]`
  );

  return credentials.some(
    (credential) =>
      credential.username === username &&
      credential.password === sha256(password)
  );
}

export { addCredential, isCredentialValid, isUsernameAvailable };
