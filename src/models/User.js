const mongoose = require('mongoose');


const UserScheme = new mongoose.Schema({
    name : {
        type: String, 
        required: true
    },

    password : {
        type: String, 
        required: true,
    }, 

    email : {
        type : String, 
        required: true
    },

    profilePic : {
        type: String, 
        required: false
    },

    cover : {
        type: String, 
        required: false
    },

    date : {
        type: Date,
        default: Date.now
    },
    country : {
        type: String, 
        required: true
    }
});

const User = mongoose.model('User', UserScheme);

module.exports = User;


