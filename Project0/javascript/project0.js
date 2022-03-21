document.getElementById("btn").addEventListener("click, changeColor");

var counter = 1;

function changeColor(){
    var colorID = document.getElementById(btn);
    if(counter == 0){
        colorID.style.backgroundColor = "#C0C0C0";
        counter = 1;
    } else {
        colorID.style.backgroundColor = "#C55E5E";
        counter = 1;
    }

}