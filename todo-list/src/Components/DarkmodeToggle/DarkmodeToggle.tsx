import { FaSun, FaMoon } from "react-icons/fa";

interface IProps {
  theme: string;
  switchTheme: () => void;
}

const DarkmodeToggle = ({ theme, switchTheme }: IProps) => (
  <div
    onClick={switchTheme}
    className={`position-absolute m-3 d-flex justify-content-center align-items-center darkmode-toggle transition-250ms user-select-none`}
  >
    {theme === "dark" ? <FaSun /> : <FaMoon />}
  </div>
);
export default DarkmodeToggle;
