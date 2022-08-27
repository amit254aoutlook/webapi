var express = require('express');
var router = express.Router();
var sql = require("mssql");
const db = require("../models");

const Country = db.Country;
const CountryState=db.Countrystate;

const Op = db.Sequelize.Op;

exports.getCountry=(req,res)=>{
  Country.findAll()
  .then(country=>{
    res.status(200).send(country);
  })
  .catch(err=>{
    res.status(500).send({ message: err.message });
  });
};

exports.getCountryState=(req,res)=>{
    CountryState.findAll({
        where:getCountryConditions(req)
    })
    .then(state=>{
      res.status(200).send(state);
    })
    .catch(err=>{
      res.status(500).send({ message: err.message });
    });
};

function getCountryConditions(req) {
    
  countryConditions = {};
    console.log(req.query.country)
    if (req.query.country) {
      countryConditions.CountryId = {
        [Op.eq]: req.query.country
      }
    }

    
    return countryConditions;
}