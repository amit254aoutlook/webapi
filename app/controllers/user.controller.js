var express = require('express');
var router = express.Router();
var sql = require("mssql");
//const { Users } = require('../models');
const db = require("../models");
var conn = require("../../connection/connect")();
var bcrypt = require("bcryptjs");
const User = db.User;
const UserMetaData= db.UserMetaData;
exports.allAccess = (req, res) => {
  console.log(req.session.user_sid);
  var users = [];
  User.findAll({
    //limit:2, 
    order: [
            ['ActiveFrom', 'DESC']
           ]
}).then(users=>{    
    var responseBody = {
      lstUser:[]
    }
    users.forEach(user => {
      var userInfo = {
				Id: user.UserId,
				loginId: user.LoginId,
				firstName: user.FirstName,
        lastName: user.LastName,
        email:user.EmailAddress,
        password:user.Password,//bcrypt.genSaltSync(user.Password),
        //cpassword:hashPassword(user.Password),
			}
      responseBody.lstUser.push(userInfo);
    });

    res.status(200).send(responseBody);
  })
  
};
// import { genSaltSync, hashSync, compareSync } from 'bcryptjs';
// export function hashPassword(password: string): string {
//   const salt = genSaltSync(12);
//   const hashedPassword = hashSync(password, salt);
//   return hashedPassword;
// };

exports.userbyId = async (req, res) => {
  await User.findOne({
    // include:[{
    //   model:Role
    // },{
    //   model:MerchantUserGroup
    // }     
    // ],
    where: {
      UserId: req.params.userid
    }
  }).then(user => {
    if (!user) {
      return res.status(404).send({ message: "User Not found." });
    }
    res.status(200).send({
      Id: user.UserId,
      loginId: user.LoginId,
      firstName: user.FirstName,
      lastName: user.LastName,
      email:user.EmailAddress,
      password:user.Password,//bcrypt.genSaltSync(user.Password),
      //cpassword:hashPassword(user.Password),
    });
  })
  .catch(err => {
    res.status(500).send({ message: err.message });
  });
}

exports.adminBoard = (req, res) => {
  res.status(200).send("Admin Content.");
};

exports.moderatorBoard = (req, res) => {
  res.status(200).send("Moderator Content.");
};

exports.usermetadata = async (req,res)=>{
  await UserMetaData.create({
    UserId:req.body.UserId,
    MetaId:req.body.MetaId,
    IsActive:req.body.IsActive
  }).then(user => {
    if (!user) {
      return res.status(404).send({ message: "User Not found." });
    }
    res.status(200).send({
      UserId: user.UserId,
      loginId: user.LoginId,
      firstName: user.FirstName,
      lastName: user.LastName,
      email:user.EmailAddress,
      password:user.Password,//bcrypt.genSaltSync(user.Password),
      //cpassword:hashPassword(user.Password),
    });
  })
  .catch(err => {
    res.status(500).send({ message: err.message });
  });
};