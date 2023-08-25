const axios = require("axios");

async function fetchData(apiUrl) {
  try {
    const response = await axios.get(apiUrl);
    const data = response.data;
    console.log("Fetched Data:");
    console.log(data);
  } catch (error) {
    console.error("Error fetching data:", error.message);
  }
}

function main() {
  const apiUrl = process.env.API_URL;

  if (!apiUrl) {
    console.log("Usage: node script.js");
    console.log("Please provide the API_URL environment variable.");
    process.exit(1);
  }

  fetchData(apiUrl);
}

main();
