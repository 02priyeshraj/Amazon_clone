const jwt = require('jsonwebtoken');
const User = require('../models/user');

const admin =  async (req,res,next)=>{
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res.status(401).json({message:"Access Denied"});
            
        }
        const isVerified = jwt.verify(token,'passwordKey');
        if (!isVerified) {
            return res.status(401).json({message:"Authorization Denied"});
      
        }
        const user = await User.findById(isVerified.id);
        if(user.type =='user' || user.type =='seller'){
            return res.status(401).json({message: "You are not an admin"});

        }
        req.user = isVerified.id;
        req.token = token;
        next();
    } catch (e) {
        res.status(500).json({error:e.message});
    }
}

module.exports = admin;