import { Navigate } from "react-router-dom";

interface IProps {
  isAuthenticated: boolean | null;
  children: JSX.Element;
}

const UnprotectedRoute = ({ isAuthenticated, children }: IProps) => {
  if (isAuthenticated) return <Navigate to="/" replace />;

  return children;
};

export default UnprotectedRoute;
