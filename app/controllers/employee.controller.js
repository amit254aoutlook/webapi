var express = require('express');
var router = express.Router();
var sql = require("mssql");
var conn = require("../../connection/connect")();

var routes= function(){
   router.route('/')
       .get(function (req, res) 
       {
           //alert(conn.connect());
           conn.connect().then(function()
                {
                   // alert(new sql.Request(conn))
                    var getEmployeeQuery="Select * from Employee";
                    var req = new sql.Request(conn).query(getEmployeeQuery).then(function(recordset)
                    {
                        res.json(recordset.recordset);
                        conn.close();
                    })
                        .catch(function(err){
                            conn.close();
                            res.status(400).send("Error : while fetching data.");                         
                        });

                })
                    .catch(function(err){
                        console.log(err);
                        conn.close();
                        res.status(400).send("Error : database connection issue.");                         
                    });
           
       });
    return router;
};
module.exports = routes;

// const express = require('express')  
// const router = express.Router()  
// const { poolPromise } = require('../connection/connect')  
// const sql = require('mssql')  
// router.get('/ApiProfileGet', async (req, res) => {  
// try {  
// const pool = await poolPromise  
// const result = await pool.request()  
// .query('select * from Employee',function(err, profileset){  
// if (err)  
// {  
// console.log(err)  
// }  
// else {  
// var send_data = profileset.recordset;  
// res.json(send_data);  
// }  
// })  
// } catch (err) {  
// res.status(500)  
// res.send(err.message)  
// }  
// }) 