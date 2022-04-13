import { Route, Routes } from "react-router-dom";
import { Login } from "../Pages";
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
            <h1>asd</h1>
          </ProtectedRoute>
        }
        path="/"
      />
    </Routes>
  );
}
