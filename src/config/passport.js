const localStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');
const { estimatedDocumentCount } = require('../models/User');

const User = require('../models/User');


module.exports = function(passport) {

    passport.use(
        new localStrategy({usernameField: 'email'}, (email, password, callback) => {
            User.findOne({email: email})
            .then((user) => {
                if (!user) {
                    return callback({error : "that email is not registered"});
                }

                bcrypt.compare(password, user.password, (error, isMatch) => {
                    if (error) {
                        return callback({error : "Try again to sign in"});
                    }

                    if (isMatch) {
                        return callback(undefined, user);
                    }
                    else {
                        return callback({error : "Password is incorrect"});
                    }
                })
            
            }).catch(error => console.log(error));
        })
    )

    passport.serializeUser(function(user, callback) {
        callback(undefined, user.id);
    });

    passport.deserializeUser(function(id, callback) {
        User.findById(id, (err, user) => {
            callback(err, user);
        })
    })
}