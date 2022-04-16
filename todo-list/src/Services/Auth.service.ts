import sha256 from "sha256";
import { ICredentials } from "../Interfaces/Credentials.interface";

function PostRegisterUser({
  username,
  password,
}: ICredentials): Promise<string> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (!username || !password) {
        reject(Error("Username or password must not be null"));
        return;
      }

      if (isUsernameAvailable(username)) {
        addCredential({ username, password });
        resolve("Account Successfully Added.");
      } else {
        reject(Error("Username has already taken."));
      }
    }, 1000);
  });
}

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

export {
  PostRegisterUser,
  addCredential,
  isCredentialValid,
  isUsernameAvailable,
};
