// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");


//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://emirhan:eKahya22@cluster0.gtbp8.mongodb.net/?retryWrites=true&w=majority";

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//Connections
mongoose.connect(DB).then(() => {
        console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });


// CREATING AN API
// http://localhost/hello-world

// Create a GET request giving a json response with key of name and value of name
// {
//    'name': 'Emirhan'
// }

// GET, PUT, POST, DELETE, UPDATE - CRUD

// With 0.0.0.0 can use localhost
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port ${PORT}`);
});