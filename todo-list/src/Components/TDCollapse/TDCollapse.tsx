import { useCallback, useEffect, useState } from "react";
import TextareaAutosize from "react-autosize-textarea/lib";
import { Col, Collapse, Row } from "react-bootstrap";
import { FaExpandAlt, FaTrash } from "react-icons/fa";
import { ITodoList } from "../../Interfaces/Content.interface";
import { DeleteTodo, PostCreateUpdateTodo } from "../../Services/Todo.service";
import TDLModal from "../TDLModal";
import styles from "./styles.module.scss";

interface IProps {
  refreshList: () => void;
}

type Props = ITodoList & IProps;

const TDCollapse = ({ id, title, content, owner, refreshList }: Props) => {
  const [isOpen, setIsOpen] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const [titleState, setTitleState] = useState(title);
  const [contentState, setContentState] = useState(content);

  const [exeRef, setExeRef] = useState(true);
  const titleRef = useCallback((element: HTMLTextAreaElement | null) => {
    if (element && exeRef) {
      setExeRef(false);
      element.focus();
      element.setSelectionRange(element.value.length, element.value.length);
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    PostCreateUpdateTodo({
      id,
      title: titleState,
      content: contentState,
      owner,
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [titleState, contentState]);

  const handleChangeTitle = (newTitle: string) => {
    setTitleState(newTitle);
  };

  const handleChangeContent = (newContent: string) => {
    setContentState(newContent);
  };

  return (
    <div className="w-100">
      <Row>
        <Col xs={11}>
          <Row>
            <div
              className={`${styles.tdcTitle}`}
              onClick={() => setIsOpen(!isOpen)}
            >
              {title}
            </div>
          </Row>
          <Row className="d-flex justify-content-center">
            <Collapse in={isOpen}>
              <div className={`${styles.tdcContent} position-relative`}>
                {content}
                <FaExpandAlt
                  className={`${styles.resizeIcon} position-absolute bottom-0 end-0 m-2 cursor-pointer transition-250ms`}
                  onClick={() => setIsModalOpen(true)}
                />
              </div>
            </Collapse>
          </Row>
        </Col>
        <Col xs={1} className="d-flex justify-content-center">
          <FaTrash
            className={`${styles.deleteIcon} mt-3`}
            onClick={() => {
              DeleteTodo({ id, owner });
              refreshList();
            }}
          />
        </Col>
      </Row>
      <TDLModal
        show={isModalOpen}
        toggleShow={() => {
          setIsModalOpen(!isModalOpen);
          refreshList();
        }}
        header={
          <div>
            <TextareaAutosize
              className={`${styles.tdcTitleInput} w-100`}
              maxLength={500}
              placeholder="Title"
              value={titleState}
              onInput={(e) => handleChangeTitle(e.currentTarget.value)}
              ref={titleRef}
            />
          </div>
        }
        body={
          <div>
            <TextareaAutosize
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
