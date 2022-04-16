import { useEffect, useState } from "react";
import { Col, Container } from "react-bootstrap";
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
  const [isComplete, setIsComplete] = useState<boolean>(false);
  const [onHoverHeader, setOnHoverHeader] = useState<boolean>(false);

  useEffect(() => {
    setTodoList(GetTodoList({ owner: payload.username }));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [triggerList, isComplete]);

  return (
    <div className={`${styles.homeContainer}`}>
      <title>Mudkip Todo List</title>
      <LogoutMenu username={payload.username} />
      <div className="fixed-branding">Mudkip Todo List</div>
      <Container
        className={`${styles.homeInnerContainer} d-flex justify-content-center`}
      >
        <Col lg={6} xs={12} className="py-3">
          <div className="d-flex justify-content-between align-items-center pb-3">
            <div
              className={`${styles.header} transition-250ms`}
              onClick={() => {
                setIsComplete(!isComplete);
                setOnHoverHeader(false);
              }}
              onMouseOver={() => setOnHoverHeader(true)}
              onMouseOut={() => setOnHoverHeader(false)}
            >
              <span
                className={`${
                  !isComplete === !onHoverHeader
                    ? styles.headerUnderline + " opacity-100"
                    : "opacity-25"
                }`}
              >
                IN
              </span>
              <span className={`${styles.headerUnderline}`}>COMPLETE</span>
            </div>
            <CreateNewTD
              username={payload.username}
              isComplete={isComplete}
              refreshList={() => setTriggerList(!triggerList)}
            />
          </div>
          {/* <br /> */}
          {todoList.map((todo) => (
            <>
              {todo.isComplete === isComplete && (
                <div
                  className={`my-4 ${
                    !isComplete ? "opacity-100" : "opacity-50"
                  }`}
                >
                  <TDCollapse
                    title={decrypt(todo.title)}
                    content={decrypt(todo.content)}
                    id={todo.id}
                    owner={payload.username}
                    isComplete={todo.isComplete}
                    refreshList={() => setTriggerList(!triggerList)}
                  />
                </div>
              )}
            </>
          ))}
        </Col>
      </Container>
    </div>
  );
}

const mapStateToProps = (state: IProps) => ({
  payload: state.payload,
});

export default connect(mapStateToProps)(Home);
