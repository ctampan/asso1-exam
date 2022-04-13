import { useRef, useState } from "react";
import { connect } from "react-redux";
import styles from "./styles.module.scss";
import { FaEye, FaEyeSlash, FaKey, FaUser } from "react-icons/fa";
import "animate.css";
import { ICredentials } from "../../Middleware/Redux/Redux.interface";
import {
  logInWithCredentials,
  updateError,
} from "../../Middleware/Redux/Redux.action";
import {
  Alert,
  Button,
  Card,
  Container,
  FormControl,
  InputGroup,
} from "react-bootstrap";

interface ICurrent {
  errorMessage: string;
}

interface IProps {
  logInConnect: (credentials: ICredentials) => void;
  updateError: (errorMessage?: string) => void;
}

type Props = ICurrent & IProps;

function Login({ errorMessage, logInConnect, updateError }: Props) {
  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [showPassword, setShowPassword] = useState(false);
  const loginButtonRef = useRef<HTMLButtonElement | null>(null);

  const triggerLoginButton = (e: any) => {
    if (e.key === 'Enter' && loginButtonRef.current) {
      loginButtonRef.current.click();
    }
  };

  return (
    <div className={`${styles.loginContainer}`}>
      <Container className="d-flex justify-content-center align-items-center h-100">
        <Card className={`${styles.loginCard}`}>
          <Card.Header
            className={`${styles.loginCardHeader} user-select-none transition-250ms`}
          >
            Login
          </Card.Header>
          <Card.Body className={`${styles.loginCardBody}`}>
            {errorMessage && (
              <Alert
                variant="danger"
                show={!!errorMessage}
                onClose={() => {
                  updateError(undefined);
                }}
                dismissible
              >
                {errorMessage}
              </Alert>
            )}
            <InputGroup className="mb-3">
              <InputGroup.Text
                className={`${styles.loginPrefix} transition-250ms`}
              >
                <FaUser />
              </InputGroup.Text>
              <FormControl
                placeholder="Username"
                aria-label="Username"
                value={username}
                onChange={(event) => setUsername(event.target.value)}
                onKeyDown={triggerLoginButton}
              />
            </InputGroup>
            <InputGroup className="mb-3">
              <InputGroup.Text
                className={`${styles.loginPrefix} transition-250ms`}
              >
                <FaKey />
              </InputGroup.Text>
              <FormControl
                type={showPassword ? "text" : "password"}
                placeholder="Password"
                aria-label="Password"
                value={password}
                onChange={(event) => setPassword(event.target.value)}
                onKeyDown={triggerLoginButton}
              />
              <InputGroup.Text
                className={`${styles.loginSuffix} transition-250ms user-select-none`}
                onClick={() => setShowPassword(!showPassword)}
              >
                {!showPassword ? <FaEye /> : <FaEyeSlash />}
              </InputGroup.Text>
            </InputGroup>
            <Button
              ref={loginButtonRef}
              className={`${styles.loginButton} transition-250ms w-100`}
              onClick={() => logInConnect({ username, password })}
            >
              Login
            </Button>
          </Card.Body>
        </Card>
      </Container>
    </div>
  );
}

const mapStateToProps = (state: ICurrent) => ({
  errorMessage: state.errorMessage,
});

const mapDispatchToProps = {
  logInConnect: logInWithCredentials,
  updateError: updateError,
};

export default connect(mapStateToProps, mapDispatchToProps)(Login);
