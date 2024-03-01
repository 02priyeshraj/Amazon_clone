const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');


const authRouter = express.Router();

//post data  from client
authRouter.post('/api/signup' , async (req,res)=>{
    try {
        const {name: name , email: email , password: password} =  req.body;


        const existingUser = await User.findOne({
            email: email,
        });
    
        if (existingUser) {
            return res.status(400).json({message:'User with same email already exists'});
            
        }

        const hashedPassword = await bcryptjs.hash(password,8);
    
        let user = new User({
            email,
            password: hashedPassword,
            name,
    
        })
    
        user = await user.save();
        res.json({user: user});
        
    } catch (e) {
        res.status(500).json({error: e.message});
        
    }


});

module.exports = authRouter;