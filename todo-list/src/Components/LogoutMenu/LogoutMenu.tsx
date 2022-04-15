import { ButtonGroup, Dropdown } from "react-bootstrap";
import { connect } from "react-redux";
import { ICredentials } from "../../Interfaces/Credentials.interface";
import { logOut } from "../../Middleware/Redux/Redux.action";
import styles from "./styles.module.scss";

interface ICurrent {
  payload: ICredentials;
}

interface IProps {
  logOutConnect: () => void;
}

type Props = ICurrent & IProps;

const LogoutMenu = ({ payload, logOutConnect }: Props) => (
  <Dropdown
    as={ButtonGroup}
    className={`${styles.logoutMenu} position-absolute end-0 top-0 m-3 d-flex justify-content-center align-items-center transition-250ms user-select-none`}
  >
    <span>
      Hello, <b>{payload.username}</b>
    </span>

    <Dropdown.Toggle
      split
      variant="warning"
      id="dropdown-split-basic"
      className={`${styles.logoutButton}`}
    />

    <Dropdown.Menu>
      <Dropdown.Item href="#/action-1">Logout</Dropdown.Item>
    </Dropdown.Menu>
  </Dropdown>
);

const mapStateToProps = (state: ICurrent) => ({
  payload: state.payload,
});

const mapDispatchToProps = {
  logOutConnect: logOut,
};

export default connect(mapStateToProps, mapDispatchToProps)(LogoutMenu);
