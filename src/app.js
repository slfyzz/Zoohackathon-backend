const express = require('express');
const mongoose = require('mongoose');
const session = require('express-session');
const passport = require('passport');

const getAllCountries = require('./utilities/countries');
const db = require('./utilities/db/dbManager');
const User = require("./models/User");
const hash = require('./utilities/Hash');
const { use } = require('passport');
require('./config/passport')(passport);


app = express();
app.use(express.json());

app.use(session({
    secret : 'secret',
    resave : true,
    saveUninitialized : true
}));
app.use(passport.initialize());
app.use(passport.session());

const lab = "mongodb+srv://natureFinderAdmin:Yy8yUa68VmMsX8GP@cluster0.im7gg.mongodb.net/NatureFinder?retryWrites=true&w=majority"

const port = process.env.PORT || 3000;
const MONGODB_URL = lab || "mongodb://localhost/test";


// connect to DB
mongoose.connect(MONGODB_URL,{useNewUrlParser: true, useUnifiedTopology : true})
.then(() => console.log('connected,,'))
.catch((err)=> console.log(err));




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


app.post('/register', (req, res) => {
    const {name, email, password, password2, pPic, cPic, country} = req.body;

    if (!name || !email || !password || !password2) {
        return res.send({ error : "you must fill all info"});
    } 

    if (password2 !== password) {
        return res.send({ error : "your passwords dont match"});
    }

    User.findOne({email : email}).exec((err, user) => {

        if (err) {
            return res.send({error : "Cannt access db"});
        }


        console.log(user);

        if (user) {
            return res.send({ error : "email already registered"});
        }
        else {
            const newUser = new User({
                name,
                email, 
                country, 
                password, 
                profilePic : pPic,
                cover : cPic
            });

            hash(password, (error, hashPassword) => {
                if (error) {
                    return res.send({error : "can not sign up, try again"});
                }
                else 
                {
                    newUser.password = hashPassword;
                    newUser.save()
                    .then((val) => {
                        console.log(val);
                        res.send({success : "Welcome " + name + " to Nature Finder", user: newUser});
                    });
                }
            });
        }
    })


});


app.post('/login', (req, res) => {
    //console.log(req);
    passport.authenticate('local', (err, user, info) => {
        if (err) 
            return res.send({error: "can not log in, try again"});
        else if (!user) 
            return res.send({error: "no account is linked to that email"});
        else {
            //console.log(user);
            req.logIn(user, err => {
                if (err) 
                    return res.send({error: "can not log in, try again"});
                return res.send({success : "logged in successfully", user});
            })
        }
    })(req, res);

});

app.post('/logout', (req, res) => {
    req.logout();
    res.send({success: "logged out successfully"});
});

app.get('post/:user', (req, res) => {
    const userName = req.params.user;

    
    
})


app.post('/post', (req, res) => {
    if (!req.isAuthenticated()) {
        res.send({error: "log in first" });
    }
    else {
        const user = req.user;
        const {content, img} = req.body;

        user.posts.push({
            content, 
            img
        });
        user.save()
               .then((val) => {
                    console.log(val);
                    res.send({success : "posted Successfully"});
                }); 

    }
});


app.get('/community', (req, res) => {
    posts = [];

    User.find({}).exec((err, data) => {
        if (err) {
            return res.send({error: "try agian, server is down"});
        }
        
        for (let i = 0; i < data.length; i++) {
            if (data[i].posts) {
                for (let j = 0; j < data[i].posts.length; j++) {
                    posts.push({
                        post: data[i].posts[j].toJSON(),
                        user: data[i].name,
                        profilePic : data[i].profilePic 
                    });
                }
            }
        }
        posts.sort((a, b) => {
            if (a.post.time > b.post.time)
                return -1;
            else 
                return 1;
        })
    
        res.send({posts});
    });
  
});




app.listen(port, () => {
    console.log('App server is running on ' + port + ' port');
})



