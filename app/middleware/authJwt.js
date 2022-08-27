const jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");
const db = require("../models");
const User = db.User;

verifyToken = (req, res, next) => {
  let token = req.headers["x-access-token"];

  if (!token) {n
    return res.status(403).send({
      message: "No token provided!"
    });
  }

  jwt.verify(token, config.secret, (err, decoded) => {
    if (err) {
      return res.status(401).send({
        message: "Unauthorized!"
      });
    }
    req.UserId = decoded.id;
    next();
  });
};

isAdmin = (req, res, next) => {
  User.findByPk(req.UserId).then(user => {
    user.getRoles().then(roles => {
      for (let i = 0; i < roles.length; i++) {
        if (roles[i].RoleName === "Admin") {
          next();
          return;
        }
      }

      res.status(403).send({
        message: "Require Admin Role!"
      });
      return;
    });
  });
};

isModerator = (req, res, next) => {
  User.findByPk(req.UserId).then(user => {
    user.getRoles().then(roles => {
      for (let i = 0; i < roles.length; i++) {
        if (roles[i].RoleName === "Moderator") {
          next();
          return;
        }
      }

      res.status(403).send({
        message: "Require Moderator Role!"
      });
    });
  });
};

isModeratorOrAdmin = (req, res, next) => {
  User.findByPk(req.UserId).then(user => {
    user.getRoles().then(roles => {
      for (let i = 0; i < roles.length; i++) {
        if (roles[i].RoleName === "Moderator") {
          next();
          return;
        }

        if (roles[i].RoleName === "Admin") {
          next();
          return;
        }
      }

      res.status(403).send({
        message: "Require Moderator or Admin Role!"
      });
    });
  });
};

verifysession=(req,res,next)=>{
  //console.log("verifysession"+req.cookies.user_sid);
  if (req.cookies.user) {
    req.UserId=req.cookies.user_sid;
  } else {
      next();
  }   
};

const authJwt = {
  verifyToken: verifyToken,
  isAdmin: isAdmin,
  isModerator: isModerator,
  isModeratorOrAdmin: isModeratorOrAdmin,
  verifysession: verifysession
};
module.exports = authJwt;