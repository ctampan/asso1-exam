import React from "react";
import ReactDOM from "react-dom/client";
import "./Assets/Styles/index.scss";
import App from "./App";
import reportWebVitals from "./reportWebVitals";
import { persistor, store } from "./Middleware/Redux/Redux.config";
import { Provider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
root.render(
  // <React.StrictMode>
    <Provider store={store}>
      <PersistGate loading={null} persistor={persistor}>
        <App />
      </PersistGate>
    </Provider>
  // </React.StrictMode>
);

reportWebVitals();
