const mongoose = require('mongoose');


const commentSchema = new mongoose.Schema({
    comment : {
        type: String,
        required : true
    },
    time: {
        type: Date,
        default: Date.now
    }
});


const postSchema = new mongoose.Schema({
    
    content : {
        type: String
    },

    time: {
        type: Date,
        default: Date.now
    },

    img: {
        type: String,
    },

    comments: [commentSchema]
});


module.exports = postSchema;


