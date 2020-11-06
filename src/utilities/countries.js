request = require('request');

const getAllCountries = (callback) => {
    const url = "https://restcountries.eu/rest/v2/all";
    request({url, json:true}, (error, {body}) => {

        if (error) {
            callback("Unable to get Countries, Try Again and check your connection");
        }
        else {
            shortList = [];
            body.forEach((country) => {
                shortList.push({
                    countryName : country.name,
                    flagSrc : "https://www.countryflags.io/" + country.alpha2Code + "/shiny/64.png" 
                });
            });

            callback(undefined, shortList);
        }
    })

}


module.exports = getAllCountries;

