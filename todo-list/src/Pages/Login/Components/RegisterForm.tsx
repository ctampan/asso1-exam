import { useState } from "react";
import {
  Card,
  Alert,
  InputGroup,
  FormControl,
  Button,
  Spinner,
} from "react-bootstrap";
import { FaUser, FaKey, FaEye, FaEyeSlash } from "react-icons/fa";
import { PostRegisterUser } from "../../../Services/Auth.service";
import styles from "./styles.module.scss";

interface IProps {
  toggleShowModal: () => void;
  setSuccessMessage: (message: string) => void;
}

const RegisterForm = ({ toggleShowModal, setSuccessMessage }: IProps) => {
  const [errorMessage, setErrorMessage] = useState<string>("");
  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [showPassword, setShowPassword] = useState(false);
  const [isRegisterLoading, setIsRegisterLoading] = useState(false);

  const handleRegister = async () => {
    setIsRegisterLoading(true);

    try {
      const result = await PostRegisterUser({ username, password });

      setSuccessMessage(result);

      toggleShowModal();
    } catch (error) {
      setUsername("");
      setPassword("");
      setErrorMessage((error as Error).message);
    }

    setIsRegisterLoading(false);
  };

  return (
    <Card.Body className={`${styles.registerCardBody}`}>
      {errorMessage && (
        <Alert
          variant="danger"
          show={!!errorMessage}
          onClose={() => {
            setErrorMessage("");
          }}
          dismissible
        >
          {errorMessage}
        </Alert>
      )}
      <InputGroup className="mb-3">
        <InputGroup.Text
          className={`${styles.registerPrefix} transition-250ms`}
        >
          <FaUser />
        </InputGroup.Text>
        <FormControl
          placeholder="Username"
          aria-label="Username"
          value={username}
          onChange={(event) => setUsername(event.target.value)}
        />
      </InputGroup>
      <InputGroup className="mb-3">
        <InputGroup.Text
          className={`${styles.registerPrefix} transition-250ms`}
        >
          <FaKey />
        </InputGroup.Text>
        <FormControl
          type={showPassword ? "text" : "password"}
          placeholder="Password"
          aria-label="Password"
          value={password}
          onChange={(event) => setPassword(event.target.value)}
        />
        <InputGroup.Text
          className={`${styles.registerSuffix} transition-250ms user-select-none cursor-pointer`}
          onClick={() => setShowPassword(!showPassword)}
        >
          {!showPassword ? <FaEye /> : <FaEyeSlash />}
        </InputGroup.Text>
      </InputGroup>
      <Button
        className={`${styles.registerButton} transition-250ms w-100`}
        onClick={handleRegister}
        disabled={isRegisterLoading}
      >
        {isRegisterLoading ? <Spinner animation={"border"} /> : "Register"}
      </Button>
    </Card.Body>
  );
};

export default RegisterForm;