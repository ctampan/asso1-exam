import { Route, Routes } from "react-router-dom";
import { Home, Login } from "../Pages";
import ProtectedRoute from "./ProtectedRoute";
import UnprotectedRoute from "./UnprotectedRoute";

interface IProps {
  isAuthenticated: boolean | null;
}

export default function Pages({ isAuthenticated }: IProps) {
  return (
    <Routes>
      <Route
        element={
          <UnprotectedRoute isAuthenticated={isAuthenticated}>
            <Login />
          </UnprotectedRoute>
        }
        path="/login"
      />
      <Route
        element={
          <ProtectedRoute isAuthenticated={isAuthenticated}>
            <Home />
          </ProtectedRoute>
        }
        path="/"
      />
    </Routes>
  );
}
