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






app.listen(port, () => {
    console.log('App server is running on ' + port + ' port');
})



