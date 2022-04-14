import React, { useEffect } from "react";
import { connect } from "react-redux";
import { BrowserRouter } from "react-router-dom";
import { checkAuthentication } from "./Middleware/Redux/Redux.action";
import { ICurrent } from "./Middleware/Redux/Redux.interface";
import Pages from "./Routes/Pages";
import "bootstrap/dist/css/bootstrap.min.css";
import { DarkmodeToggle } from "./Components";
import useDarkMode from "./Hooks/useDarkmode";

interface IAppProps {
  checkAuthenticationConnect: () => void;
  isAuthenticated: boolean | null;
}

function App({ checkAuthenticationConnect, isAuthenticated }: IAppProps) {
  useEffect(() => checkAuthenticationConnect(), [checkAuthenticationConnect]);
  const [theme, switchTheme] = useDarkMode();

  return (
    <div className="App" data-theme={theme}>
      <BrowserRouter>
        <DarkmodeToggle theme={theme} switchTheme={switchTheme} />
        <Pages isAuthenticated={isAuthenticated} />
      </BrowserRouter>
    </div>
  );
}

const mapStateToProps = (state: ICurrent) => ({
  isAuthenticated: state.isAuthenticated,
});

const mapDispatchToProps = {
  checkAuthenticationConnect: checkAuthentication,
};

export default connect(mapStateToProps, mapDispatchToProps)(App);
