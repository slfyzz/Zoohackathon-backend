const fs = require('fs');


const getAnimalByCountry = (country, callback) => {

    fs.readFile('src/utilities/db/db.json', (error, data) => {
        if (error) {
            callback(error);
        }
        else {
            const animals = JSON.parse(data.toString());
            const animalAtCountry = [];

            animals.forEach((animal => {
                if (animal.Countries.includes(country))
                    animalAtCountry.push(animal);
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
            const animals = JSON.parse(data.toString());
            const desiredAnimal = [];

            animals.forEach((currentAnimal => {
                if (animal === currentAnimal.name)
                    desiredAnimal.push(currentAnimal);
            }))
            //console.log(desiredAnimal);

            callback(undefined, desiredAnimal);
        }
    })
}


module.exports = {getAnimal, getAnimalByCountry};