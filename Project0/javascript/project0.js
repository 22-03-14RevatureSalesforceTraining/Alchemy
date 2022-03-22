function myfunc(){
    const test = document.getElementById("test");
    test.style.backgroundColor = "black";

    setTimeout(myfunc, 1000);

}

