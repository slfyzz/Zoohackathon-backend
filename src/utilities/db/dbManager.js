const fs = require('fs');
const { delete } = require('request');


const getAnimalByCountry = (country, callback) => {

    fs.readFile('src/utilities/db/db.json', (error, data) => {
        if (error) {
            callback(error);
        }
        else {
            const animals = JSON.parse(data.toString()).Sheet1;
            const animalAtCountry = [];

            animals.forEach((animal => {
                if (animal.Countries.includes(country)) {
                    animal.Enviornment = animal.Habitat;
                    delete animal.Habitat;  
                    animalAtCountry.push(animal);
                }
            }))
            callback(undefined, animalAtCountry);
        }
    })
}

const getAnimal = (animal, callback) => {
    
    fs.readFile('src/utilities/db/db.json', (error, data) => {
        if (error) {
            callback(error);
        }
        else {
            const animals = JSON.parse(data.toString()).Sheet1;
            const desiredAnimal = [];

            animals.forEach((currentAnimal => {
                if (animal === currentAnimal.name){
                    currentAnimal.Enviornment = currentAnimal.Habitat;
                    delete currentAnimal.Habitat;  
                    desiredAnimal.push(currentAnimal);
                }
            }))
            //console.log(desiredAnimal);

            callback(undefined, desiredAnimal);
        }
    })
}


module.exports = {getAnimal, getAnimalByCountry};