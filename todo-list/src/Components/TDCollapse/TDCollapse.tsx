import { useEffect, useState } from "react";
import TextareaAutosize from "react-autosize-textarea/lib";
import { Col, Collapse, Row } from "react-bootstrap";
import { FaCheckCircle, FaCircle, FaExpandAlt, FaTrash } from "react-icons/fa";
import { ITodoList } from "../../Interfaces/Content.interface";
import {
  DeleteTodo,
  PostCreateUpdateTodo,
  TodoCheckCleanUp,
} from "../../Services/Todo.service";
import TDLModal from "../TDLModal";
import styles from "./styles.module.scss";

interface IProps {
  refreshList: () => void;
}

type Props = ITodoList & IProps;

const TDCollapse = ({
  id,
  title,
  content,
  owner,
  isComplete,
  refreshList,
}: Props) => {
  const [isOpen, setIsOpen] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [onHover, setOnHover] = useState(false);

  const [titleState, setTitleState] = useState(title);
  const [contentState, setContentState] = useState(content);
  const [icState, setIcState] = useState(isComplete);

  useEffect(() => {
    setTitleState(title);
    setContentState(content);
  }, [title, content]);

  useEffect(() => {
    PostCreateUpdateTodo({
      id,
      title: titleState,
      content: contentState,
      owner,
      isComplete: icState,
    });
    refreshList();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [titleState, contentState, icState]);

  const handleChangeTitle = (newTitle: string) => {
    setTitleState(newTitle);
  };

  const handleChangeContent = (newContent: string) => {
    setContentState(newContent);
  };

  const handleChangeIc = () => {
    setIcState(!icState);
  };

  return (
    <div className="w-100">
      <Row>
        <Col md={1} sm={2} xs={3} className="d-flex justify-content-center">
          <div
            id={`todo-incomplete-toggle-${id}`}
            className={`${styles.completeIcon} mt-2 transition-250ms`}
            onClick={handleChangeIc}
            onMouseOver={() => setOnHover(true)}
            onMouseOut={() => setOnHover(false)}
          >
            {icState !== onHover ? <FaCheckCircle /> : <FaCircle />}
          </div>
        </Col>
        <Col md={10} sm={8} xs={6}>
          <Row>
            <div
              id={`todo-title-${id}`}
              className={`${styles.tdcTitle} transition-250ms`}
              onClick={() => setIsOpen(!isOpen)}
            >
              {title}
            </div>
          </Row>
          <Row className="d-flex justify-content-center">
            <Collapse in={isOpen}>
              <div
                id={`todo-content-${id}`}
                className={`${styles.tdcContent} position-relative`}
              >
                {content ? (
                  content
                ) : (
                  <span
                    className="opacity-75 cursor-pointer"
                    onClick={() => setIsModalOpen(true)}
                  >
                    Take a note...
                  </span>
                )}
                <FaExpandAlt
                  id={`todo-expand-${id}`}
                  className={`${styles.resizeIcon} position-absolute bottom-0 end-0 m-2 cursor-pointer transition-250ms`}
                  onClick={() => setIsModalOpen(true)}
                />
              </div>
            </Collapse>
          </Row>
        </Col>
        <Col md={1} sm={2} xs={3} className="d-flex justify-content-center">
          <div
            id={`todo-delete-button-${id}`}
            className={`${styles.deleteIcon} mt-2 transition-250ms`}
            onClick={() => {
              DeleteTodo({ id, owner });
              refreshList();
            }}
          >
            <FaTrash />
          </div>
        </Col>
      </Row>
      <TDLModal
        show={isModalOpen}
        toggleShow={() => {
          setIsModalOpen(!isModalOpen);
          refreshList();
          TodoCheckCleanUp({ id, owner });
        }}
        header={
          <div>
            <TextareaAutosize
              id={`title-input-${id}`}
              className={`${styles.tdcTitleInput} w-100`}
              maxLength={500}
              placeholder="Title"
              value={titleState}
              onInput={(e) => handleChangeTitle(e.currentTarget.value)}
              autoFocus
            />
          </div>
        }
        body={
          <div>
            <TextareaAutosize
              id={`content-input-${id}`}
              className={`${styles.tdcContentInput} w-100`}
              maxLength={2000}
              placeholder="Take a note..."
              value={contentState}
              onInput={(e) => handleChangeContent(e.currentTarget.value)}
            />
          </div>
        }
      />
    </div>
  );
};

export default TDCollapse;
