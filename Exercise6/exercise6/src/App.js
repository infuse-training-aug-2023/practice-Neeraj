import React, { useState, useEffect } from "react";
import axios from "axios";
import "./App.css";

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const response = await axios.get("http://localhost:8000/api/get");
        setData(response.data);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    }

    fetchData();
  }, []);

  return (
    <div className="App" style={{ padding: "2em" }}>
      <h1>Employee List</h1>
      <div
        className="container"
        style={{
          display: "flex",
          gap: "1em",
          justifyContent: "space-between",
        }}
      >
        {data.map((employee, index) => (
          <div
            key={index}
            className="card"
            style={{ padding: "1em", border: "2px solid #000" }}
          >
            <strong>Name:</strong> {employee.name}
            <br />
            <strong>Company:</strong> {employee.company}
            <br />
            <strong>Role:</strong> {employee.role}
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;
