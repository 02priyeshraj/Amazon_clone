//IMPORT FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

//IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://Priyesh02:MANIT%402026@cluster0.zx5jtzi.mongodb.net/?retryWrites=true&w=majority";

//MIDDLEWARE
app.use(express.json());
app.use(authRouter);


//CONNECTIONS
mongoose.connect(DB).then(()=>{
    console.log("Connections  Succesful");
}).catch(e =>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0",() => {
    console.log(`Connected at port ${PORT}`);

});
