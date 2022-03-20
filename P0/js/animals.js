/**
 * Author: Nam Phan
 * Purpose: This api/module handles the information storage
 * and rerendering for each of the buttons on the main html page.
 */

/*  
    input: none
    function for the lions button, 
    stores information about lions and renders on the page
    using the update()
*/
function lions(){
    //console.log("Lions!");
    /* storing information in a json object for readability and adaptability*/
    let info = {
        name: "Lion",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/220px-Lion_waiting_in_Namibia.jpg",
        link: "https://en.wikipedia.org/wiki/Lion",
        eats: ["blue wildebeest"," plains zebra", "African buffalo", "gemsbok", "giraffe"],
        habitats: ["Africa"],
    }

    update(info);

}

/*  
    input: none
    function for the elephants button, 
    stores information about elephants and renders on the page
    using the update()
*/
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

/*  
    input: none
    function for the dolphins button, 
    stores information about dolphins and renders on the page
    using the update()
*/
function dolphins(){
    //console.log("Dolphins!");

    let info = {
        name: "Dolphin",
        imageAddr: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Dolphintursiops.jpg/350px-Dolphintursiops.jpg",
        link: "https://en.wikipedia.org/wiki/Dolphin",
        eats: ["fish"],
        habitats: ["Ocean"],
    }

    update(info);
}

/*  
    input: none
    function for the tuna button, 
    stores information about tuna and renders on the page
    using the update()
*/
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

/* helper function that takes in a json and updates webpage */
function update(info){

    document.querySelector("displayImg img").setAttribute("src", info.imageAddr);

    /* changes the animal name */  
    document.querySelector("#displayName").innerHTML = info.name;

    /* sets the table link to the wikipedia site */ 
    document.querySelector("table tr #tableLink").setAttribute("href", info.link);
    document.querySelector("table tr #tableLink").innerHTML = info.link;

    /* sets the table animal's habitat */
    document.querySelector("table tr #tableHabitat").innerHTML = info.habitats;
    /* sets the table animal's diet */
    document.querySelector("table tr #tableEats").innerHTML = info.eats;
}

//export { lions, elephants, dophins, tuna };