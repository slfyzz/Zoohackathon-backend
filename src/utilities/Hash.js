const bcrypt = require('bcrypt');

const hash = (Password, callback) => {

    bcrypt.genSalt(10, (err, salt) => {
        if (err) {
            return callback(err);
        }
        bcrypt.hash(Password, salt, (err, hash) => {
            if (err) 
                return callback(err);

            callback(undefined, hash);
            
        }) 
    })

}

module.exports = hash;