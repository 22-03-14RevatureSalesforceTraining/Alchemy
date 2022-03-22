let img = document.querySelector('img');
let btnFingerstyle = document.querySelector('#btnFingerstyle');
let btnBlues = document.querySelector('#btnBlues');
let btnClassical = document.querySelector('#btnClassical');
let btnFlamenco = document.querySelector('#btnFlamenco');

btnFingerstyle.addEventListener('click', () => {
    img.src = 'images/yamahaf325d.jpg';
})

btnBlues.addEventListener('click', () => {
    img.src = 'images/martind28.jpg';
})

btnClassical.addEventListener('click', () => {
    img.src = 'images/tayloracademy.jpg';
})

btnFlamenco.addEventListener('click', () => {
    img.src = 'images/cordoba.jpg';
})