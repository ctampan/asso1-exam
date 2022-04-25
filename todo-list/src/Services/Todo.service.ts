import sha256 from "sha256";
import { ITodoList } from "../Interfaces/Content.interface";
import { decrypt, encrypt } from "../Utils/encryptDecrypt";

function PostCreateUpdateTodo({
  id,
  title,
  content,
  owner,
  isComplete,
}: ITodoList) {
  let todos: ITodoList[] = JSON.parse(
    localStorage.getItem("todos:" + owner) ?? `[]`
  );

  const todoIndex = todos.findIndex((todo) => todo.id === id);

  let newTodo: ITodoList = {
    id: id,
    title: encrypt(title),
    content: encrypt(content),
    owner: sha256(owner),
    isComplete: !!isComplete,
  };

  if (todoIndex < 0) {
    localStorage.setItem("todos:" + owner, JSON.stringify([...todos, newTodo]));
  } else {
    todos[todoIndex] = newTodo;
    localStorage.setItem("todos:" + owner, JSON.stringify(todos));
  }
}

function GetTodoList({ owner }: { owner: string }) {
  const todos: ITodoList[] = JSON.parse(
    localStorage.getItem("todos:" + owner) ?? `[]`
  );

  return todos;
}

function GetTodo({ id, owner }: { id: number; owner: string }) {
  let todos: ITodoList[] = GetTodoList({ owner });

  return todos.find((todo) => todo.id === id && todo.owner === sha256(owner));
}

function DeleteTodo({ id, owner }: { id: number; owner: string }) {
  let todos: ITodoList[] = GetTodoList({ owner });

  const todoIndex = todos.findIndex(
    (todo) => todo.id === id && todo.owner === sha256(owner)
  );

  todos.splice(todoIndex, 1);

  localStorage.setItem("todos:" + owner, JSON.stringify(todos));
}

function TodoCheckCleanUp({ id, owner }: { id: number; owner: string }) {
  let todos: ITodoList[] = JSON.parse(
    localStorage.getItem("todos:" + owner) ?? `[]`
  );

  const todoIndex = todos.findIndex(
    (todo) =>
      todo.id === id &&
      todo.owner === sha256(owner) &&
      !decrypt(todo.title).trim()
  );

  if (todoIndex > -1) {
    todos.splice(todoIndex, 1);

    localStorage.setItem("todos:" + owner, JSON.stringify(todos));
  }
}

export {
  PostCreateUpdateTodo,
  GetTodoList,
  GetTodo,
  DeleteTodo,
  TodoCheckCleanUp,
};
