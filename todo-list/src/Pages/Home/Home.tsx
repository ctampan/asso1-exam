import { useEffect, useState } from "react";
import { Container } from "react-bootstrap";
import { connect } from "react-redux";
import { CreateNewTD, LogoutMenu, TDCollapse } from "../../Components";
import { ITodoList } from "../../Interfaces/Content.interface";
import { ICredentials } from "../../Interfaces/Credentials.interface";
import { GetTodoList } from "../../Services/Todo.service";
import { decrypt } from "../../Utils/encryptDecrypt";
import styles from "./styles.module.scss";

interface IProps {
  payload: ICredentials;
}

function Home({ payload }: IProps) {
  const [todoList, setTodoList] = useState<ITodoList[]>([]);
  const [triggerList, setTriggerList] = useState<boolean>(false);

  useEffect(() => {
    setTodoList(GetTodoList(payload.username));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [triggerList]);

  return (
    <div className={`${styles.homeContainer}`}>
      <title>Home | Todo List</title>
      <LogoutMenu username={payload.username} />
      <Container className="d-flex justify-content-center">
        <div className="w-50 py-3">
          <CreateNewTD
            username={payload.username}
            refreshList={() => setTriggerList(!triggerList)}
          />
          <hr />
          {todoList.map((todo) => (
            <div className="my-3">
              <TDCollapse
                title={decrypt(todo.title)}
                content={decrypt(todo.content)}
                id={todo.id}
                owner={payload.username}
                refreshList={() => setTriggerList(!triggerList)}
              />
            </div>
          ))}
        </div>
      </Container>
    </div>
  );
}

const mapStateToProps = (state: IProps) => ({
  payload: state.payload,
});

export default connect(mapStateToProps)(Home);
