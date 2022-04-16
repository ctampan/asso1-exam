export interface ITodoList{
    id: number;
    title: string;
    content: string;
    owner: string;
    isComplete?: boolean;
}