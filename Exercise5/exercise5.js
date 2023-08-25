const express = require("express");
const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  const data = {
    name: "Neeraj Yadav",
    comapny: "Infuse Consultant",
    Job_sole: "Software Development In Test",
  };
  res.send(data);
});

app.listen(3000, () => {
  console.log(`Server is running on port 3000`);
});
