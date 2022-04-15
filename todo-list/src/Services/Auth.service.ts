import { addCredential, isUsernameAvailable } from "../Hooks/useAuth";
import { ICredentials } from "../Interfaces/Credentials.interface";

function PostRegisterUser({
  username,
  password,
}: ICredentials): Promise<string> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (!username || !password) {
        reject(Error("Username or password must not be null"));
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

export { PostRegisterUser };
