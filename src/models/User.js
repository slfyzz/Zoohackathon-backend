const mongoose = require('mongoose');
const postSchema = require('./PostSchema');

const UserSchema = new mongoose.Schema({
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
    },
    posts : [postSchema]
});

const User = mongoose.model('User', UserSchema);
module.exports = User;


