import { connect } from "react-redux";
import { Navigate } from "react-router-dom";
import { updateError } from "../Middleware/Redux/Redux.action";

interface IProps {
  updateError: (errorMessage?: string) => void;
  isAuthenticated: boolean | null;
  children: JSX.Element;
}

const ProtectedRoute = ({ updateError, isAuthenticated, children }: IProps) => {
  if (!isAuthenticated) {
    updateError('You must be logged in.');
    return <Navigate to="/login" replace />;
  }

  return children;
};

const mapDispatchToProps = {
  updateError: updateError,
};

export default connect(null, mapDispatchToProps)(ProtectedRoute);
