
function lions(){
    //console.log("Lions!");

    let info = {
        name: "Lions",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/220px-Lion_waiting_in_Namibia.jpg",
        link: "https://en.wikipedia.org/wiki/Lion",
        eats: ["blue wildebeest"," plains zebra", "African buffalo", "gemsbok", "giraffe"],
        habitats: ["Africa"],
    }

    update(info);

}

function elephants(){
    //console.log("Elephants!");
    let info = {
        name: "Elephant",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Elephant_Diversity.jpg/220px-Elephant_Diversity.jpg",
        link: "https://en.wikipedia.org/wiki/Elephant",
        eats: ["trees", "shrubs"],
        habitats: ["Africa", "Asia"],
    }

    update(info);
    
}

function dolphins(){
    //console.log("Dolphins!");

    let info = {
        name: "Dolphins",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Dolphintursiops.jpg/350px-Dolphintursiops.jpg",
        link: "https://en.wikipedia.org/wiki/Dolphin",
        eats: ["fish"],
        habitats: ["Ocean"],
    }

    update(info);
}

function tuna(){
    //console.log("Tuna!");

    let info = {
        name: "Tuna",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Tuna_assortment.png/220px-Tuna_assortment.png",
        link: "https://en.wikipedia.org/wiki/Tuna",
        eats: ["herring", "bluefish", "mackerel"],
        habitats: ["Atlantic", "Pacific"],
    }

    update(info);
}

/* helper function that takes in a json and updates the webpage */
function update(info){

    document.querySelector("displayImg img").setAttribute("src", info.imageAddr);

    /* changes the name */  
    document.querySelector("displayName").innerHTML = info.name;

    /* sets the link to the wikipedia site */ 
    document.querySelector("table tr #tableLink").setAttribute("href", info.link);
    document.querySelector("table tr #tableLink").innerHTML = info.link;

    /* habitat */
    document.querySelector("table tr #tableHabitat").innerHTML = info.habitats;
    /* diet */
    document.querySelector("table tr #tableEats").innerHTML = info.eats;
}

//export { lions, elephants, dophins, tuna };