const { authJwt,upload,uploadscreenshot,uploadscormpackage } = require("../middleware");
const controller = require("../controllers/admin.controller");
const authcontroller=require("../controllers/auth.controller");
const mastercontroller=require("../controllers/master.controller");
//var unzip = require('unzip');
const unzip = require('unzipper');
const fs = require('fs');
module.exports = function(app) {
    app.use(function(req, res, next) {
      res.header(
        "Access-Control-Allow-Headers",
        "x-access-token, Origin, Content-Type, Accept"
      );
      next();
    });
    
  // Currency section to create and Update   
    app.post(
        "/api/currency/create",
        [
            authJwt.verifyToken,
            authJwt.isAdmin
        ],
        controller.createcurrency
    );

    app.post(
        "/api/currency/update",
        [
            authJwt.verifyToken,
            authJwt.isAdmin
        ],
        controller.updatecurrency
    );

    app.get(
      "/api/currency/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getcurrency
    )

    // Country section to create and Update   
    app.post(
      "/api/country/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createcountry
    );

    app.post(
      "/api/country/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatecountry  
    );

    // Country state section to create and Update 
    app.post(
      "/api/state/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createstate
    );

    app.post(
      "/api/state/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatestate  
    );

    app.post(
      "/api/company/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createcompany  
    );

    app.post(
      "/api/company/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatecompany  
    );

    app.get(
      "/api/company/get",
      [authJwt.verifyToken,],
      controller.getCompany
    )

    // Merchant section to create and Update    
    app.post(
      "/api/merchant/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createmerchant  
    );

    app.post(
      "/api/merchant/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatemerchant  
    );

    // Merchant site url section to create and Update    
    app.post(
      "/api/merchantsiteurl/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createmerchantsiteurl  
    );

    app.post(
      "/api/merchantsiteurl/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatemerchantsiteurl 
    );

    // Merchant user group section to create and Update
    app.post(
      "/api/merchantusergroup/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createmerchantusergroup  
    );

    app.post(
      "/api/merchantusergroup/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatemerchantusergroup  
    );

    app.post(
      "/api/categorygroup/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createcategorygroup  
    );

    app.post(
      "/api/categorygroup/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatecategorygroup  
    );

    app.post(
      "/api/category/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createcategory  
    );

    app.post(
      "/api/category/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatecategory  
    );

    app.post(
      "/api/bundle/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createproductbundle  
    );

    app.post(
      "/api/bundle/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updateproductbundle  
    );

    app.get(
      "/api/bundle/get",
      [ 
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getproductbundle
    )

    app.get(
      "/api/bundle/getbyid/:BundleId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getbundlebyid
    )

    app.post(
      "/api/product/create", //controller.uploadScreenshot,
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createproduct  
    );
  
  
  
    app.post(
      "/api/uploadCatalog/:productcode",   
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      upload.single('image'), (req, res) => {
        try {         
            // res.send(req.file);
            res.status(200).send({message: " Catelog image is uploaded successfully!"})
        
        }catch(err) {
          res.send(500).send({message: err.message});
        }
    });

    // app.post(
    //   "/api/uploadScreenshot/:productcode",   
    //   [
    //     authJwt.verifyToken,
    //     authJwt.isAdmin
    //   ],
    //   uploadscreenshot.single('screenshot'), (req, res) => {
    //     try {
         
    //        //  res.send(req.file);
    //         res.status(200).send({message: "Screenshot image is uploaded successfully!"})
        
    //     }catch(err) {
    //       res.send(500).send({message: err.message});
    //     }
    // });

    app.post(
      "/api/uploadScreenshot/:productcode",   
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
     // uploadscreenshot.single('screenshot'),
      uploadscreenshot.array("uploads", 30),
      (req, res) => {
        try {
         
           //  res.send(req.file);
            res.status(200).send({message: "Screenshot image is uploaded successfully."})
        
        }catch(err) {
          res.send(500).send({message: err.message});
        }
    });

    app.post(
      "/api/uploadscormpackage/:productcode",   
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      uploadscormpackage.single('package'), (req, res) => {
        try {        
            //console.log(res.headers.get('content-disposition'));
            var dirPath ="./public/lmspayload/"+req.file.filename;

            var destPath = "./public/lmspayload/"+req.params.productcode+"/";

            fs.createReadStream(dirPath).pipe(unzip.Extract({ path: destPath }));
            res.setHeader('Access-Control-Expose-Headers', 'Content-Disposition');
            res.sendStatus(200).send({message: "package is uploaded successfully!"})
            //res.send(destPath +", "+dirPath);
        }catch(err) {
          res.send(500).send({message: err.message});
        }
    });

    app.post(
      "/api/product/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updateproduct  
    );

    app.post(
      "/api/productstatus/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updateproductstatus  
    );

    

    app.get(
      "/api/product/Get",
      [ 
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getProduct
    )

    app.get(
      "/api/product/get/:productid",
      [ 
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getProductById
    )

    app.post(
      "/api/merchantproduct/create",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.createmerchantproducts  
    );

    app.post(
      "/api/merchantproduct/update",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.updatemerchantproducts  
    );

    app.get(
      "/api/merchant/Get",
      [
          authJwt.verifyToken,
          authJwt.isAdmin
      ],
      controller.getallmerchants  
    );

    app.get(
      "/api/merchant/:merchantid",
      [authJwt.verifyToken],
      controller.getmerchant
    );

    app.get(
      "/api/categorygroup/Get",
      [authJwt.verifyToken],
      controller.getCategoryGroup
    );

    app.get(
      "/api/categorytype/getall",
      [authJwt.verifyToken],
      controller.getcategorytype
    );

    app.get(
      "/api/category/getall",
      [authJwt.verifyToken],
      controller.getcategory
    );

    app.get(
      "/api/category/:categoryid",
      [authJwt.verifyToken],
      controller.getcategorybyid
    );

    // app.get(
    //   "/api/merchantproduct/get",
    //   [authJwt.verifyToken],
    //   controller.GetMerchantProducts
      
    // )
    
    app.get(
      "/api/merchantproduct/:pid",
      [authJwt.verifyToken],
      controller.GetMerchantProducts
      
    )

    app.get(
      "/api/product/getscreenshot/:productcode",
      [ 
        authJwt.verifyToken
      ],
      controller.GetProductScreenshotFiles
    )

    app.post(
      "/api/template/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createTemplate
    )

    app.post(
      "/api/template/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateTemplate
    )

    app.get(
      "/api/template/get/:TemplateId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getTemplate
    )

    app.get(
      "/api/template/getall",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getallTemplate
    )

    app.post(
      "/api/metagroup/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createMetaGroup
    )

    app.post(
      "/api/metagroup/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateMetaGroup
    )

    app.get(
      "/api/metagroup/get/:MetaGroupId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getMetaGroups
    )

    app.get(
      "/api/metagroup/getall",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getallMetaGroups
    )

    app.post(
      "/api/metakey/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createMetaKey
    )

    app.post(
      "/api/metakey/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateMetaKey
    )

    app.get(
      "/api/metakey/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getMetaKey
    )

    app.get(
      "/api/metakey/get/:MetaId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getMetaKeyById
    )

    app.get(
      "/api/templatetype/get",
      controller.getTemplateType
    )

    app.get(
      "/api/templatetype/get/:id",
      controller.getTemplateTypeById
    )
    app.get(
      "/api/keycontrol/get",
      controller.getKeyControlType
    )

    app.get(
      "/api/keycontrol/get/:id",
      controller.getKeyControlTypeById
    )
    app.get(
      "/api/keydata/get",
      controller.getKeyDataType
    )

    app.get(
      "/api/keydata/get/:id",
      controller.getKeyDataTypeById
    )
    app.get(
      "/api/posttype/get",
      controller.getPostType
    )

    app.get(
      "/api/posttype/get/:id",
      controller.getPostTypeById
    )

    app.post(
      "/api/lookupgroup/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createLookupGroup
    )

    app.post(
      "/api/lookupgroup/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateLookupGroup
    )

    app.get(
      "/api/lookupgroup/get/:LookupGroupId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getLookUpGroup
    )

    app.get(
      "/api/lookupgroup/getall",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getallLookUpGroup
    )

    app.post(
      "/api/lookupvalue/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createLookupValue
    )

    app.post(
      "/api/lookupvalue/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateLookupValue
    )

    app.get(
      "/api/lookupvalue/get/:LookupDataValue",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getLookupValue
    )

    app.get(
      "/api/lookupvalue/getall",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getallLookupValue
    )

    app.get(
      "/api/lookupvalue/getallbyid/:LookupGroupId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getallLookupValuebygrpId
    )

    app.get(
      "/api/lookupvalue/getbyDataValue/:id",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getLookupValuebyDataValue
    )

    app.get(
      "/api/metagroupkey/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.GetMetaGroupWithMetaKey
    )

    app.post(
      "/api/productmetadata/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createProductMetaData
    )

    app.get(
      "/api/productmetadata/get/:productid",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getProductMetaData
    )

    app.get(
      "/api/licensetype/get",
      controller.getLicenseType
    )

    app.get(
      "/api/licensetype/get/:id",
      controller.getLicenseTypeById
    )

    app.get(
      "/api/pricetype/get",
      controller.getPriceType
    )

    app.get(
      "/api/pricetype/get/:id",
      controller.getPriceTypeById
    )

    app.get(
      "/api/promocodetype/get",
      controller.getPromoCodeType
    )

    app.get(
      "/api/promocodetype/get/:id",
      controller.getPromoCodeTypeById
    )

    app.post(
      "/api/productprice/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createproductprice
    )

    app.post(
      "/api/productprice/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updateproductprice
    )

    app.get(
      "/api/productprice/get/:ProductId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getproductprice
    )

    app.get(
      "/api/productprice/getbyid",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getproductpricebyid
    )

    app.post(
      "/api/product/mapcategory",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.mapcategoryproduct
    )

    app.get(
      "/api/product/getcategory/:ProductId",
      [ 
        authJwt.verifyToken
      ],
      controller.GetProductCategory
    )

    app.post(
      "/api/mapmerchatproductbundle/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.mapmerchantproductbundle
    )

    app.get(
      "/api/mapmerchatproductbundle/get/:BundleId",
      [ 
        authJwt.verifyToken
      ],
      controller.getmerchantproductbundle
    )

    app.post(
      "/api/bundleprice/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.createbundleprice
    )

    app.post(
      "/api/bundleprice/update",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.updatebundleprice
    )

    app.get(
      "/api/bundleprice/get/:BundleId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getbundleprice
    )

    app.get(
      "/api/bundleprice/getbyid",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.getbundlepricebyid
    )

    app.get(
      "/api/bundleproduct/get/:BundleId",
      [
        authJwt.verifyToken
      ],
      controller.GetBundleProduct
    )

    app.post(
      "/api/mapproductbundle/create",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.MapProductBundleProducts
    )

    app.get(
      "/api/productsbundle/get/:ProductId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      controller.GetProductsBundle
    )

    app.get(
      "/api/publishstatus/get",
      controller.getPublishStatus
    )

    app.get(
      "/api/publishstatus/get/:id",
      controller.getPublishStatusById
    )

    app.get(
      "/api/programtype/get",
      controller.getProgramType
    )

    app.get(
      "/api/programtype/get/:id",
      controller.getProgramTypeById
    )

    app.get(
      "/api/adminuser/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      authcontroller.GetUser
    )

    app.get(
      "/api/merchantusergroup/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      authcontroller.GetMerchantUserGroup
    )

    app.get(
      "/api/role/get",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      authcontroller.GetRole
    )

    app.get(
      "/api/user/getloginid/:LoginId",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      authcontroller.GetUserLoginId
    )

    app.get(
      "/api/user/getuserid/:userid",
      [
        authJwt.verifyToken,
        authJwt.isAdmin
      ],
      authcontroller.userbyuserId
    )

    app.get(
      "/api/country/get",
      [
        authJwt.verifyToken
      ],
      mastercontroller.getCountry
    )

    app.get(
      "/api/countrystate/get",
      [
        authJwt.verifyToken
      ],
      mastercontroller.getCountryState
    )
};