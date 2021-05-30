import Header from "./components/Header";
import { Tasks } from "./components/Tasks";
import React, { useState } from "react";

/**
 * * This is my Min method
 * ! hello
 * ? will show
 * todo: hello
 * @returns
 */
function App() {
  //! using state in functional component by using useState hook
  //? Default state passed as Parameter to useState
  const [tasks, setTask] = useState([
    {
      id: 1,
      text: "Doctors Appointment",
      day: "Feb 5th at 2:30pm",
      reminder: true,
    },
    {
      id: 2,
      text: "Meeting at School",
      day: "Feb 6th at 1:30pm",
      reminder: true,
    },
  ]);

  return (
    <div className="container">
      {/* //! This is Better Comment */}
      <Header title="Task Tracker" />
      <Tasks tasks={tasks} />
    </div>
  );
}

export default App;
