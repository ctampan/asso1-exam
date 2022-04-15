import { useMemo, useState } from "react";
import TextareaAutosize from "react-autosize-textarea/lib";
import { Button } from "react-bootstrap";
import useDidUpdate from "../../Hooks/useDidUpdate";
import { PostCreateUpdateTodo } from "../../Services/Todo.service";
import TDLModal from "../TDLModal";
import styles from "./styles.module.scss";

interface IProps {
  username: string;
  refreshList: () => void;
}

const CreateNewTD = ({ username,refreshList }: IProps) => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  // eslint-disable-next-line react-hooks/exhaustive-deps
  const id = useMemo(() => Date.now(), [isModalOpen]);

  useDidUpdate(() => {
    PostCreateUpdateTodo({ id, title, content, owner: username });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [title, content]);

  const handleChangeTitle = (newTitle: string) => {
    setTitle(newTitle);
  };

  const handleChangeContent = (newContent: string) => {
    setContent(newContent);
  };

  return (
    <div className="w-100">
      <Button
        onClick={() => {
          setIsModalOpen(true);
        }}
        className={styles.createNewButton}
      >
        Create New
      </Button>
      <TDLModal
        show={isModalOpen}
        toggleShow={() => {setIsModalOpen(!isModalOpen); refreshList()}}
        header={
          <div>
            <TextareaAutosize
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
              className={`${styles.tdcContentInput} w-100`}
              maxLength={2000}
              placeholder="Take a note..."
              onInput={(e) => handleChangeContent(e.currentTarget.value)}
            />
          </div>
        }
      />
    </div>
  );
};

export default CreateNewTD;
