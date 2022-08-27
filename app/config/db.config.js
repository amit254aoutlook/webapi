module.exports = {
    user: "sa",
    password: "ebix@123'",
    Host: "NOIAMIKU8200\SQL2016",
    DB: "CMS",
    dialect:"mssql",
    options:{
        trustedconnection: true,
        enableArithAbort: true,
        instancename: 'SQL2016'
    }
   
  };

// const Sequelize = require('sequelize');    
    
// // Option 1: Passing parameters separately    
// const sequelize = new Sequelize('CMS', 'sa', 'ebix@123', {    
//   host: 'NOIAMIKU8200',    
//   dialect:'mssql'   
// });    
    
// module.exports=sequelize; 