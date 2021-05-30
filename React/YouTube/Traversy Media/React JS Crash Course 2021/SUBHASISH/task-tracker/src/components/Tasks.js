import React, { useState } from "react";
import Task from "./Task";

export const Tasks = ({ tasks }) => {
  //setTask([...tasks, {}]);
  return (
    <>
      {tasks.map((task) => (
        <Task key={task.id} task={task} />
      ))}
    </>
  );
};
