// Get the functions in the db.js file to use
const db = require('../services/db');
const bcrypt = require("bcryptjs");


class User {

    // Id of the user
    id;

    // Email of the user
    email;

    constructor(email) {
        console.log("",email)
        this.email = email;
        console.log(this.email)
    }

// async idCreation() { 
//         var minm = 10000000; 
//         var maxm = 99999999; 
//         var id = Math.floor(Math 
//         .random() * (maxm - minm + 1)) + minm; 
//         console.log("ID in idcreation",id);
//         return id;
//     } 
    
    // Checks to see if the submitted email address exists in the Users table
async getIdFromEmail() {
    var sql = "SELECT id FROM Users WHERE users.mail = ?";
    const result = await db.query(sql, [this.email]);
    console.log("RESULTS FROM getIdFromEmail",result);
    // TODO LOTS OF ERROR CHECKS HERE..
    if (JSON.stringify(result) != '[]') {
        this.id = result[0].id;
        return this.id;
    }
    else {
        return false;
    }
}

async setUserPassword(password) {
    const pw = await bcrypt.hash(password, 10);
    console.log("Password in setUserPassword :",pw);
    var sql = "UPDATE Users SET password = ? WHERE Users.id = ?"
    const result = await db.query(sql, [pw, this.id]);
    console.log("Result from setUserPassword",result)
    return true;
}

async addUser(para) {
    const pass = await bcrypt.hash(para.password, 10);
    console.log("Password IN AddUser :",pass);
    var minm = 10000000; 
    var maxm = 99999999; 
    var id = Math.floor(Math.random() * (maxm - minm + 1)) + minm; 
    console.log("ID in idcreation",id);
    var sql = "INSERT INTO users (id ,name, surname, phone_number, address, mail, password) VALUES (? , ? , ?, ? , ? , ?, ?)";
    const result = await db.query(sql, [id, para.firstName, para.lastName, para.phNum, para.address,this.email, pass]);
    console.log("Result from addUser",result)
    console.log("\nFrom add USer",result.insertId);
    this.id = id;
    return true;
}

async authenticate(password) {
    // Get the stored, hashed password for the user
    var sql = "SELECT password FROM users WHERE id = ?";
    const result = await db.query(sql, [this.id]);
    console.log("Result from authenticate",result);
    const match = await bcrypt.compare(password, result[0].password);
    if (match == true) {
        return true;
    }
    else {
        return false;
    }
}


}

module.exports  = {
    User
}