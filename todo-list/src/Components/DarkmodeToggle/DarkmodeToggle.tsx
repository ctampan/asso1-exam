import { FaSun, FaMoon } from "react-icons/fa";
import styles from "./styles.module.scss";

interface IProps {
  theme: string;
  switchTheme: () => void;
}

const DarkmodeToggle = ({ theme, switchTheme }: IProps) => (
  <div
    onClick={switchTheme}
    className={`${styles.darkmodeToggle} position-absolute m-3 d-flex justify-content-center align-items-center transition-250ms user-select-none cursor-pointer`}
  >
    {theme === "dark" ? <FaSun /> : <FaMoon />}
  </div>
);
export default DarkmodeToggle;
