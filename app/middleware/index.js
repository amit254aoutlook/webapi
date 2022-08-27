const authJwt = require("./authJwt");
const verifySignUp = require("./verifySignUp");
const {upload,uploadscreenshot,uploadscormpackage}= require("./uploadMiddleware");
//const Resize = require('./Resize');

module.exports = {
  authJwt,
  verifySignUp,
  upload,
  uploadscreenshot,
  uploadscormpackage,
  //Resize,
};