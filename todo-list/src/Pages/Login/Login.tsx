import { useRef, useState } from "react";
import { connect } from "react-redux";
import styles from "./styles.module.scss";
import { FaEye, FaEyeSlash, FaKey, FaUser } from "react-icons/fa";
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
  Spinner,
} from "react-bootstrap";
import { TDLModal } from "../../Components";
import RegisterForm from "./Components";
import { ICredentials } from "../../Interfaces/Credentials.interface";
import timeout from "../../Utils/timeout";

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
  const [showRegisterModal, setShowRegisterModal] = useState(false);
  const [successMessage, setSuccessMessage] = useState<string | null>();
  const [isLoginLoading, setIsLoginLoading] = useState<boolean>(false);

  const triggerLoginButton = (e: any) => {
    if (e.key === "Enter" && loginButtonRef.current) {
      loginButtonRef.current.click();
    }
  };

  const toggleShowModal = () => {
    setShowRegisterModal(!showRegisterModal);
  };

  const handleLogin = async () => {
    setIsLoginLoading(true);
    handleSetErrorMessage(undefined);
    await timeout(1000);
    logInConnect({ username, password });
    setIsLoginLoading(false);
  };

  const handleSetSuccessMessage = (message: string) => {
    updateError(undefined);
    setSuccessMessage(message);
  };

  const handleSetErrorMessage = (message?: string) => {
    updateError(undefined);
    setSuccessMessage("");
  };

  return (
    <div className={`${styles.loginContainer}`}>
      <title>Login | Mudkip To-do List</title>
      <div className="fixed-branding">Mudkip To-do List</div>
      <Container
        className={`d-flex justify-content-center align-items-center h-100`}
      >
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
            {successMessage && (
              <Alert
                variant="success"
                show={!!successMessage}
                onClose={() => {
                  setSuccessMessage("");
                }}
                dismissible
              >
                {successMessage}
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
                className={`${styles.loginSuffix} transition-250ms user-select-none cursor-pointer`}
                onClick={() => setShowPassword(!showPassword)}
              >
                {!showPassword ? <FaEye /> : <FaEyeSlash />}
              </InputGroup.Text>
            </InputGroup>
            <Button
              ref={loginButtonRef}
              className={`${styles.loginButton} transition-250ms w-100 mb-2`}
              onClick={handleLogin}
              disabled={isLoginLoading}
            >
              {isLoginLoading ? <Spinner animation={"border"} /> : "Login"}
            </Button>
            <Button
              className={`${styles.registerButton} transition-250ms w-100`}
              onClick={() => setShowRegisterModal(true)}
              disabled={isLoginLoading}
            >
              Register
            </Button>
          </Card.Body>
        </Card>
      </Container>
      <TDLModal
        show={showRegisterModal}
        toggleShow={toggleShowModal}
        otherProps={{ size: "sm" }}
        header="Register"
        body={
          <RegisterForm
            toggleShowModal={toggleShowModal}
            setSuccessMessage={handleSetSuccessMessage}
          />
        }
      />
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
