import { Container } from "react-bootstrap";
import { LogoutMenu } from "../../Components";
import styles from "./styles.module.scss";

function Home() {
  return (
    <div className={`${styles.homeContainer}`}>
      <title>Home | Todo List</title>
      <LogoutMenu />
      <Container fluid className="h-100"></Container>
    </div>
  );
}

export default Home;
