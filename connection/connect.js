var sql = require("mssql");
var dbconfig = {
    user: 'sa',
    password: 'amit123',
    server: 'DESKTOP-C3C643B',
    database: 'Books',
    // options:{
    //     trustedconnection: true,
    //     enableArithAbort: true,
    //     instancename: 'MSSQLSERVER'
    // }
};

var connect = function() {
    var conn=new sql.ConnectionPool({
        user: 'sa',
        password: 'amit123',
        server: 'DESKTOP-C3C643B',
        database: 'Books',
        options:{
            trustedconnection: true,
            enableArithAbort: true,
            instancename: 'MSSQLSERVER'
        }
    });
    
    return conn;
};

module.exports = connect;

// DB.js config for your database  
// const sql = require('mssql') 

// const config = {  
// user: 'sa',  
// password: 'amit123',  
// server: "localhost",  
// database: "Books"  
// }  

// const poolPromise = new sql.ConnectionPool(config)  
// .connect()  
// .then(pool => {  
// console.log('Connected to MSSQL')  
// return pool  
// })  
// .catch(err => console.log('Database Connection Failed! Bad Config: ', err)) 

// module.exports = {  
// sql, poolPromise  
// }
