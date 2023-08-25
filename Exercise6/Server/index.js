const data = [
  {
    name: "Neeraj Yadav",
    company: "Infuse",
    role: "Software Developer In Test",
  },
  {
    name: "Madhura Patil",
    company: "Infuse",
    role: "Software Developer In Test",
  },
  {
    name: "Riya Kumbhar",
    company: "Infuse",
    role: "Software Developer In Test",
  },
  {
    name: "Vaibhav Gaunkar",
    company: "Infuse",
    role: "Software Developer In Test",
  },
];

const express = require("express");
const app = express();
const PORT = 8000;
const CORS = require("cors");

app.use(express.json());
app.use(CORS());

app.get("/api/get", (req, res) => {
  res.send(data);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
