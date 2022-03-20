
/* Houses the function to activate for mouseovers */

function hoverPicLion(){
    let info = {
        preImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/220px-Lion_waiting_in_Namibia.jpg",
    }
    
    //remove attribute: removeAttribute("nameOfAttribute")

    document.querySelector("div #previewImage").removeAttribute("hidden");
    document.querySelector("div #previewImage").setAttribute("src", info.preImage);
}

function hoverPicElephant(){
    let info = {
        preImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Elephant_Diversity.jpg/220px-Elephant_Diversity.jpg",
    }
    //
    document.querySelector("div #previewImage").removeAttribute("hidden");
    document.querySelector("div #previewImage").setAttribute("src", info.preImage);
}

function hoverPicDolphin(){
    let info = {
        preImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Dolphintursiops.jpg/350px-Dolphintursiops.jpg",
    }
    
    document.querySelector("div #previewImage").removeAttribute("hidden");
    document.querySelector("div #previewImage").setAttribute("src", info.preImage);
}

function hoverPicTuna(){
    let info = {
        preImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Tuna_assortment.png/220px-Tuna_assortment.png",
    }
    document.querySelector("div #previewImage").removeAttribute("hidden");
    document.querySelector("div #previewImage").setAttribute("src", info.preImage);
}

function hidePrePicture(){
    console.log("hiding");
    document.querySelector("div #previewImage").setAttribute("hidden", "hidden");
}

