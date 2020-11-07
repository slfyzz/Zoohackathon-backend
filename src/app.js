const express = require('express');


const getAllCountries = require('./utilities/countries');
const db = require('./utilities/db/dbManager');
app = express();
port = process.env.PORT || 3000;

app.get('/countries/all', (req, res) => {

    getAllCountries((error, list) => {
        if (error) {
            res.send({error});
        }
        else {
            res.send(list);
        }
    })    

});


app.get('/:country/animals', (req, res) => {
    const country = req.params.country;
    
    // some querying and logic
    db.getAnimalByCountry(country, (error, animalList) => {
        if (error) {
            return res.send({
                "error" : "cannot get animals"
            })
        }
        animalList.forEach(animal => {
            if (animal.conservationStatus.toLowerCase().includes('endangered') || animal.conservationStatus.toLowerCase().includes('vulnerable')) {
                animal.extinct = true;
            }
            else 
                animal.extinct = false;
        })

        res.send(animalList);
    });
    
});


app.get('/animals/:animal', (req, res) => {
    const animal = req.params.animal;
    db.getAnimal(animal, (error, animalList) => {
        if (error || animalList.length === 0) {
            return res.send({
                "error" : "can not get an animal with that name"
            })
        }
        animalList.forEach(animal => {
            if (animal.conservationStatus.toLowerCase().includes('endangered') || animal.conservationStatus.toLowerCase().includes('vulnerable')) {
                animal.extinct = true;
            }
            else 
                animal.extinct = false;
        })

        res.send(animalList[0]);
    })

    
});


app.listen(port, () => {
    console.log('App server is running on ' + port + ' port');
})



