var multer = require('multer'); 
const fs = require('fs')

var storage = multer.diskStorage({
  destination: function(req, file, cb) {
      cb(null, './public/productImage/catalog/');
   },  
  filename: function (req, file, cb) {
    //file.fieldname + path.extname(file.originalname)
    let extArray = file.mimetype.split("/");
    let extension = extArray[extArray.length - 1];
    cb(null ,req.params.productcode + '.'+extension);
  }
});
var upload = multer({ 
  storage: storage, 
  fileFilter: (req, file, cb) => {
    if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
      cb(null, true);
    } else {
      cb(null, false);
      return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
    }
  }
});

var screenshotstorage = multer.diskStorage({
  destination: function(req, file, cb) {
    // check if directory exists
    if (!fs.existsSync('./public/productImage/screenshot/'+req.params.productcode)) {
    // if not create directory
      fs.mkdirSync('./public/productImage/screenshot/'+req.params.productcode);  
    }
    cb(null, './public/productImage/screenshot/'+req.params.productcode+'/');
   },  
  filename: function (req, file, cb) {
    //file.fieldname + path.extname(file.originalname)
    let extArray = file.mimetype.split("/");
    let extension = extArray[extArray.length - 1];
    //req.params.productcode + '.'+extension
    cb(null ,file.originalname);
  }
});

var uploadscreenshot = multer({ 
  storage: screenshotstorage, 
  fileFilter: (req, file, cb) => {
    if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
      cb(null, true);
    } else {
      cb(null, false);
      return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
    }
  }
})



var scormpackagestorage = multer.diskStorage({
  destination: function(req, file, cb) {
      cb(null, './public/lmspayload/');
   },  
  filename: function (req, file, cb) {
    //file.fieldname + path.extname(file.originalname)
    let extArray = file.mimetype.split("/");
    let extension = extArray[extArray.length - 1];
    cb(null ,req.params.productcode + '.zip');
  }
});

var uploadscormpackage = multer({ 
  storage: scormpackagestorage, 
  fileFilter: (req, file, cb) => {
    if (file.mimetype == "application/x-zip-compressed" || file.mimetype == "application/octet-stream" || file.mimetype == "multipart/x-zip") {
      cb(null, true);
    } else {
      cb(null, false);
      return cb(new Error('Only .zip format allowed!'));
    }
  }
})


module.exports=
{
  upload,
  uploadscreenshot,
  uploadscormpackage
}