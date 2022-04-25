import { useMemo, useState } from "react";
import TextareaAutosize from "react-autosize-textarea/lib";
import { FaPlusCircle } from "react-icons/fa";
import useDidUpdate from "../../Hooks/useDidUpdate";
import {
  PostCreateUpdateTodo,
  TodoCheckCleanUp,
} from "../../Services/Todo.service";
import TDLModal from "../TDLModal";
import styles from "./styles.module.scss";

interface IProps {
  username: string;
  refreshList: () => void;
  isComplete: boolean;
}

const CreateNewTD = ({ username, refreshList, isComplete }: IProps) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  // eslint-disable-next-line react-hooks/exhaustive-deps
  const id = useMemo(() => Date.now(), [isModalOpen]);

  useDidUpdate(() => {
    PostCreateUpdateTodo({ id, title, content, owner: username, isComplete });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [title, content]);

  const handleChangeTitle = (newTitle: string) => {
    setTitle(newTitle);
  };

  const handleChangeContent = (newContent: string) => {
    setContent(newContent);
  };

  return (
    <>
      <FaPlusCircle
        id="create-new-button"
        className={`${styles.createNewButton} transition-250ms`}
        onClick={() => {
          setTitle("");
          setContent("");
          setIsModalOpen(true);
        }}
      />
      <TDLModal
        show={isModalOpen}
        toggleShow={() => {
          setIsModalOpen(!isModalOpen);
          refreshList();
          TodoCheckCleanUp({ id, owner: username });
        }}
        header={
          <div>
            <TextareaAutosize
              id="title-input"
              className={`${styles.tdcTitleInput} w-100`}
              maxLength={500}
              placeholder="Title"
              onInput={(e) => handleChangeTitle(e.currentTarget.value)}
              autoFocus
            />
          </div>
        }
        body={
          <div>
            <TextareaAutosize
              id="content-input"
              className={`${styles.tdcContentInput} w-100`}
              maxLength={2000}
              placeholder="Take a note..."
              onInput={(e) => handleChangeContent(e.currentTarget.value)}
            />
          </div>
        }
      />
    </>
  );
};

export default CreateNewTD;
