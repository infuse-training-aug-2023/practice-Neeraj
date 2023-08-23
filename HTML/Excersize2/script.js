const clock = document.getElementById("clock");
const daytime = document.getElementById("daytime");

function getTime() {
  const date = new Date();
  const hour = date.getHours();
  const min = date.getMinutes();
  const sec = date.getSeconds();
  clock.innerHTML = hour + " : " + min + " : " + sec + " ";

  if (hour < 12 && hour >= 0) {
    daytime.innerHTML = " AM";
  } else {
    daytime.innerHTML = " PM";
  }
}

setInterval(getTime, 1000);
