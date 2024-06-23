import React, { useEffect, useState } from "react";
import axios from "axios";

const EmpList = () => {
  const [employees, setEmployees] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:8080/myjsp/create.jsp")
      .then((response) => {
        setEmployees(response.data);
      })
      .catch((error) => {
        console.error("There was an error fetching the data!", error);
      });
  }, []);

  return (
    <div>
      <h1>Employee List</h1>
      <table border="1">
        <thead>
          <tr>
            <th>Eno</th>
            <th>Ename</th>
            <th>Esal</th>
            <th>Egrade</th>
          </tr>
        </thead>
        <tbody>
          {employees.map((emp) => (
            <tr key={emp.eno}>
              <td>{emp.eno}</td>
              <td>{emp.ename}</td>
              <td>{emp.esal}</td>
              <td>{emp.egrade}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default EmpList;
