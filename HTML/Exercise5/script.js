const search = document.querySelector(".query");
const container = document.querySelector(".container");
const select = document.getElementById("update");
const rangep = document.getElementById("range");
const update = document.getElementById("update");
const load = document.getElementById("load");

update.addEventListener("change", (e) => sortData(e.target.value));

let data = [];

let pageCount = 1;

let years = []; // all fetched years from response

let btn = document.getElementById("unique");
let loader = false;

btn.addEventListener("click", fetchData());

async function fetchData() {
  container.innerHTML = "";
  load.innerText = "Loading please wait...";
  let fragment = document.createDocumentFragment();
  let fragment2 = document.createDocumentFragment();
  years = [];

  if (search.value === "") return;
  for (let i = 1; i < 100; i++) {
    data = await (
      await fetch(
        `https://www.omdbapi.com/?apikey=d5a4ba2c&s=${search.value}&page=${i}`
      )
    ).json();
    if (data.Search != undefined && years.length <= 1000) {
      years.push(...data.Search);
      console.log(years);
    } else {
      container.innerHTML = "";

      years
        .sort((elem1, elem2) => {
          return elem1.Year - elem2.Year;
        })
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

          fragment.appendChild(card);
        });

      const distinctArray = years.reduce((uniqueValues, value) => {
        if (!uniqueValues.includes(value)) {
          uniqueValues.push(value);
        }
        return uniqueValues;
      }, []);

      distinctArray.forEach((item) => {
        select.innerHTML = '<option value="all">All</option>';
        const option = document.createElement("option");
        option.innerText = item.Year;
        option.setAttribute("value", item.Year);

        fragment2.appendChild(option);
      });

      container.appendChild(fragment);
      select.appendChild(fragment2);

      console.log("exit");
      load.innerHTML = "";

      return;
    }
  }

  console.log(years);
  load.innerHTML = "";
}

function sortData(e) {
  let fragment = document.createDocumentFragment();
  const fragment2 = document.createDocumentFragment();

  container.innerHTML = "";

  console.log(e);

  years
    .sort((elem1, elem2) => {
      return elem1.Year - elem2.Year;
    })
    .forEach((item) => {
      if (item.Year === e || e === "all") {
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

        fragment.appendChild(card);
      }
    });

  container.appendChild(fragment);
  rangep.innerText = " Results for : " + e;
}

function onSearch(e) {
  const distinctArray = years.reduce((uniqueValues, value) => {
    if (!uniqueValues.includes(value)) {
      uniqueValues.push(value);
    }
    return uniqueValues;
  }, []);

  console.log(distinctArray);
}
