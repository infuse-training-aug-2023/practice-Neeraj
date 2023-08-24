const search = document.querySelector(".query");
const container = document.querySelector(".container");
const select = document.getElementById("update");
const load = document.getElementById("load");

const url = "https://www.omdbapi.com/?apikey=d5a4ba2c&s=";

select.addEventListener("change", () => sortData(select.value));

let data = [];
let years = []; // all fetched years from response

let loader = false;

document.getElementById("unique").addEventListener("click", fetchData);

async function fetchData() {
  container.innerHTML = "";
  load.textContent = "Loading, please wait...";
  years = [];

  if (search.value === "") return;

  try {
    for (let i = 1; i < 100; i++) {
      const response = await fetch(url + `${search.value}&page=${i}`);

      if (response.ok) {
        const responseData = await response.json();
        if (responseData.Search !== undefined && years.length <= 1000) {
          years.push(...responseData.Search);
        } else {
          renderData();
          load.innerHTML = "";
          return;
        }
      } else {
        console.error(`Request failed with status ${response.status}`);
      }
    }

    renderData();
  } catch (error) {
    console.error("An error occurred:", error);
  }

  load.innerHTML = "";
}

function renderData() {
  container.innerHTML = "";
  select.innerHTML = '<option value="all">All</option>';

  const distinctYears = [...new Set(years.map((item) => item.Year))];
  distinctYears
    .sort((a, b) => a - b)
    .forEach((year) => {
      const option = document.createElement("option");
      option.textContent = year;
      option.value = year;
      select.appendChild(option);
    });

  sortData(select.value);
}

function sortData(selectedYear) {
  container.innerHTML = "";
  const filteredYears = years.filter(
    (item) => selectedYear === "all" || item.Year === selectedYear
  );

  filteredYears
    .sort((a, b) => a.Year - b.Year)
    .forEach((item) => {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `
        <div class="image">
          <img src="${item.Poster}" />
        </div>
        <div class="desc">
          <h1 class="title">${item.Title}</h1>
          <p class="year"><span>${item.Year}</span> <span>${item.Type}</span></p>
        </div>
      `;
      container.appendChild(card);
    });

  document.getElementById("range").textContent =
    selectedYear === "all"
      ? " Results for : all"
      : ` Results for : ${selectedYear}`;
}
