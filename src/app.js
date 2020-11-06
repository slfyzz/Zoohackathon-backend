const express = require('express');


const getAllCountries = require('./utilities/countries');

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

    res.send([
        {
            name: "Cat",
            species: "Animals",
            extinct: false,
            pet: true,
            img: ""
        },
        {
            name: "Eagle",
            species: "Birds",
            extinct: true,
            pet: false,
            img: ""
        },
        {
            name: "Sharks",
            species: "Fish",
            extinct: true,
            pet: false,
            img: ""
        }, 
        {
            name: "Cheetah",
            species: "Animals",
            extinct: false,
            pet: false,
            img: ""
        }
    ]);
});


app.get('/animals/:animal', (req, res) => {
    const animal = req.params.animal;


    res.send({
        name : animal,
        species: animal,
        pet: true,
        extinct: false,
        img: "",
        description: "",
        stores: [],
        whereToSee: [],
        comments: [],
        whatItEats: [],
        ageRange: "",
        videos: []


    });
});


app.listen(port, () => {
    console.log('App server is running on ' + port + ' port');
})



