import { ButtonGroup, Dropdown } from "react-bootstrap";
import { connect } from "react-redux";
import { useNavigate } from "react-router-dom";
import { logOut } from "../../Middleware/Redux/Redux.action";
import styles from "./styles.module.scss";

interface IProps {
  logOutConnect: () => void;

  username: string;
}

const LogoutMenu = ({ logOutConnect, username }: IProps) => {
  const navigate = useNavigate();
  return (
    <Dropdown
      as={ButtonGroup}
      className={`${styles.logoutMenu} position-fixed end-0 top-0 m-3 d-flex justify-content-center align-items-center transition-250ms user-select-none`}
    >
      <span>
        Hello, <b id="username-bold">{username}</b>
      </span>

      <Dropdown.Toggle
        split
        variant="warning"
        id="logout-dropdown"
        className={`${styles.logoutButton}`}
      />

      <Dropdown.Menu>
        <Dropdown.Item
          id="logout-button"
          onClick={() => {
            logOutConnect();
            navigate("/login");
          }}
        >
          Logout
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown>
  );
};

const mapDispatchToProps = {
  logOutConnect: logOut,
};

export default connect(null, mapDispatchToProps)(LogoutMenu);
