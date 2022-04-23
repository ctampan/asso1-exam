import { useRef, useState } from "react";
import { ButtonGroup, Dropdown } from "react-bootstrap";
import { FaUser } from "react-icons/fa";
import { connect } from "react-redux";
import { useNavigate } from "react-router-dom";
import { logOut } from "../../Middleware/Redux/Redux.action";
import {
  deleteAvatar,
  getAvatar,
  saveAvatar,
} from "../../Services/Avatar.service";
import styles from "./styles.module.scss";

interface IProps {
  logOutConnect: () => void;

  username: string;
}

const LogoutMenu = ({ logOutConnect, username }: IProps) => {
  const navigate = useNavigate();
  const avatarRef = useRef<HTMLInputElement | null>(null);
  const [avatar, setAvatar] = useState<string>(() => {
    return getAvatar(username);
  });

  const handleAvatarChange = (event: React.FormEvent<HTMLInputElement>) => {
    const image = event.currentTarget.files
      ? event.currentTarget.files[0]
      : null;

    if (!image) return;

    if (!image.name.match(/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/)) {
      alert("Select a valid image!");
    } else {
      if (image.size > 10000000) {
        alert("Image size is too big!");
        return;
      }
      saveAvatar(username, image);
      setAvatar(URL.createObjectURL(image));
    }
  };

  return (
    <Dropdown
      as={ButtonGroup}
      className={`${styles.logoutMenu} position-fixed end-0 top-0 m-3 d-flex justify-content-center align-items-center transition-250ms user-select-none`}
    >
      <span>
        Hello, <b id="username-bold">{username}</b>
        <div className={`${styles.avatarWrapper}`}>
          {avatar ? (
            <img src={avatar} alt="avatar" className={`${styles.avatar}`} />
          ) : (
            <div className={`${styles.avatar}`}>
              <FaUser fontSize={25} />
            </div>
          )}
        </div>
      </span>

      <input
        ref={avatarRef}
        accept=".jpg, .jpeg, .png"
        type="file"
        onChange={handleAvatarChange}
        hidden
      />

      <Dropdown.Toggle
        split
        variant="warning"
        id="logout-dropdown"
        className={`${styles.logoutButton}`}
      />

      <Dropdown.Menu>
        <Dropdown.Item
          id="change-avatar"
          onClick={() => {
            avatarRef.current?.click();
          }}
        >
          Change Avatar
        </Dropdown.Item>
        {avatar && (
          <Dropdown.Item
            id="delete-avatar"
            onClick={() => {
              deleteAvatar(username);
              setAvatar("");
            }}
          >
            Delete Avatar
          </Dropdown.Item>
        )}
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
