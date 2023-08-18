let clock = document.getElementById("clock");
let daytime = document.getElementById("daytime");


function getTime(){
    let date = new Date();
    let hour = date.getHours();
    let min = date.getMinutes();
    let sec = date.getSeconds();
    clock.innerHTML = hour + " : " + min + " : " + sec + " ";

    if(hour < 12 && hour >= 0){
        daytime.innerHTML = " AM";
    }else{
        daytime.innerHTML = " PM";
    }


}
 

setInterval(getTime, 1000);