import sha256 from "sha256";
import { ITodoList } from "../Interfaces/Content.interface";
import { encrypt } from "../Utils/encryptDecrypt";

function PostCreateUpdateTodo({ id, title, content, owner }: ITodoList) {
  let todos: ITodoList[] = JSON.parse(localStorage.getItem("todos:" + owner) ?? `[]`);

  const todoIndex = todos.findIndex((todo) => todo.id === id);

  const newTodo: ITodoList = {
    id: id,
    title: encrypt(title),
    content: encrypt(content),
    owner: sha256(owner),
  };

  if (todoIndex < 0) {
    localStorage.setItem("todos:" + owner, JSON.stringify([...todos, newTodo]));
  } else {
    todos[todoIndex] = newTodo;
    localStorage.setItem("todos:" + owner, JSON.stringify(todos));
  }
}

function GetTodoList(owner: string) {
  const todos: ITodoList[] = JSON.parse(
    localStorage.getItem("todos:" + owner) ?? `[]`
  );

  return todos;
}

function DeleteTodo({ id, owner }: { id: number; owner: string }) {
  let todos: ITodoList[] = JSON.parse(
    localStorage.getItem("todos:" + owner) ?? `[]`
  );

  const todoIndex = todos.findIndex((todo) => todo.id === id);

  todos.splice(todoIndex, 1);

  localStorage.setItem("todos:" + owner, JSON.stringify(todos));
}

export { PostCreateUpdateTodo, GetTodoList, DeleteTodo };
