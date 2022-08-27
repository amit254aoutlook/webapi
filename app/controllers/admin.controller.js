var express = require('express');
var router = express.Router();
var sql = require("mssql");
var multer = require('multer'); 
//var multiparty = require('multiparty');
//const { Users } = require('../models');
const db = require("../models");
const dbenum = require("../config/Enum");
var bcrypt = require("bcryptjs");
const  fs = require('fs');
const path = require('path');


const Currency = db.Currency;
const Country = db.Country;
const CountryState = db.CountryState;
const Company=db.Company;
const Merchant = db.Merchants;
const Merchantsiteurl = db.MerchantSiteUrl;
const MerchantUserGroup = db.MerchantUserGroup;
const CategoryGroup = db.CategoryGroup;
const Category = db.Category;
const ProductBundle = db.ProductBundle;
const Product = db.Product;
const MerchantProducts=db.MerchantProducts;
const CategoryType=db.CategoryType;
const ConatinerTemplates=db.ContainerTemplates;
const TemplateTypes=db.TemplateTypes;
const KeyControlType=db.KeyControlType;
const KeyDataType=db.KeyDataType;
const PostType=db.PostType;
const LookupGroup=db.LookupGroups;
const LookupValue=db.LookupValues;
const MetaKeys=db.MetaKeys;
const MetaGroups=db.MetaGroups;
const ProductMetaData=db.ProductMetaData;
const PriceType=db.PriceType;
const LicenseType=db.LicenseType;
const PromoCodeType=db.PromoCodeType;
const MerchantProductPrice=db.MerchantProductPrice;
const CategoryProduct=db.categoryproduct;
const MerchantProductBundles=db.merchantproductbundles;
const MerchantProductBundlePrices=db.merchantproductbundleprices;
const ProductBundleProducts=db.ProductBundleProduct;
const PublishStatus=db.PublishStatus;
const ProgramType=db.ProgramType;
//st UsersMerchantUserGroups=db.UsersMerchantUserGroups;

const Op = db.Sequelize.Op;

const { sequelize, MerchantSiteUrl, User, Merchants, LookupGroups, ProductBundleProduct } = require("../models");

exports.createcurrency = (req, res) => {
    console.log(req.body.CurrencyId)
    Currency.create({
        CurrencyId: req.body.CurrencyId,
        CurrencyName: req.body.CurrencyName,
        CurrencySymbol: req.body.CurrencySymbol,
        CurrencyFont: req.body.CurrencyFont,
    }).then(() => {
        res.send({ message: "Currency is saved successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.updatecurrency = (req, res) => {
    console.log(req.body.CurrencyId)
    Currency.update({       
        CurrencyName: req.body.CurrencyName,
        CurrencySymbol: req.body.CurrencySymbol,
        CurrencyFont: req.body.CurrencyFont,
    },
    {  
        where:{CurrencyId: req.body.CurrencyId}
    }).then(() => {
        res.send({ message: "Currency is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.getcurrency=(req,res)=>{
  Currency.findAll()
  .then(currency=>{
      res.status(200).send(currency);
  })
  .catch(err=>{
    res.status(500).send({ message: err.message });
});
};

exports.createcountry = (req, res) => {    
    Country.create({
        CountryId: req.body.CountryId,
        CountryName: req.body.CountryName,
        CountryAbbrName: req.body.CountryAbbrName,
        CurrencyId: req.body.CurrencyId,
    }).then(() => {
        res.status(200).send({ message: "Country is saved successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.updatecountry = (req, res) => {    
    Country.update({       
        CountryName: req.body.CountryName,
        CountryAbbrName: req.body.CountryAbbrName,
        CurrencyId: req.body.CurrencyId,
    },
    {  
        where:{CountryId: req.body.CountryId}
    }).then(() => {
        res.status(200).send({ message: "Country is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.createstate = (req, res) => {    
    CountryState.create({
        StateId: req.body.StateId,
        StateName: req.body.StateName,
        StateAbbrName: req.body.StateAbbrName,
        CountryId: req.body.CountryId,
    }).then(() => {
        res.status(200).send({ message: "Country state is saved successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.updatestate = (req, res) => {    
    CountryState.update({       
        StateName: req.body.StateName,
        StateAbbrName: req.body.StateAbbrName,
        CountryId: req.body.CountryId,
    },
    {  
        where:{StateId: req.body.StateId}
    }).then(() => {
        res.status(200).send({ message: "Country state is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.createcompany=(req,res)=>{
    Company.create({
        CompanyName:req.body.CompanyName,
        IsActive:req.body.IsActive
    })
    .then(()=>{
        res.status(200).send({ message: "Company is created successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.updatecompany=(req,res)=>{
    Company.update({
        CompanyName:req.body.CompanyName,
        IsActive:req.body.IsActive
    },
    {
        where:{CompanyId:req.body.CompanyId}
    })
    .then(()=>{
        res.status(200).send({ message: "Company is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.getCompany=(req,res)=>{
    Company.findAll({
        where:{
            IsActive:true
        }
    })
    .then(company=>{
        res.status(200).send(company);
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
}

exports.createmerchant = (req,res) => {
   Merchant.create({
     // MerchantId: 0,
      MerchantCompany: req.body.MerchantCompany,
      MerchantAbbrName: req.body.MerchantAbbrName,
      AddressLine1: req.body.AddressLine1,
      AddressLine2: req.body.AddressLine2,
      AddressLine3: req.body.AddressLine3,
      City: req.body.City,
      StateId: req.body.StateId,
      CountryId: req.body.CountryId,
      ZipCode: req.body.ZipCode,
      MerchantHomePage: req.body.MerchantHomePage,
      MerchantRegistrationPage: req.body.MerchantRegistrationPage,
      InvoicePrefix: req.body.InvoicePrefix,
      LogoPath: req.body.LogoPath,
      MobileLogoPath: req.body.MobileLogoPath,
      InternalLogoPath: req.body.InternalLogoPath,
      SiteTitle: req.body.SiteTitle,
      SiteDescription: req.body.SiteDescription,
      AllowUserRegistration: req.body.AllowUserRegistration,
      DateFormat: req.body.DateFormat,
      TimeZoneOffset: req.body.TimeZoneOffset,
      IsActive: req.body.IsActive,
      //ActiveFrom: req.body.ActiveFrom,
      PaymentGatewayURL: req.body.PaymentGatewayURL,
      ShoppingCartURL: req.body.ShoppingCartURL,
      PaymentGatewayAPIURL: req.body.PaymentGatewayAPIURL,
      PaymentGatewayAPIUsername: req.body.PaymentGatewayAPIUsername,
      PaymentGatewayAPIPassword: req.body.PaymentGatewayAPIPassword,
      PaymentGatewaySecretPassword: req.body.PaymentGatewaySecretPassword,
      PaymentGatewayResponseURL: req.body.PaymentGatewayResponseURL,
      DefaultCurrencyId: req.body.DefaultCurrencyId,
      eLearningPassingScore: req.body.eLearningPassingScore,
      EmailTemplatesPostId: req.body.EmailTemplatesPostId,
      SupportECommerce: req.body.SupportECommerce,
      SupportMultiplePrices: req.body.SupportMultiplePrices,
      BrandLogoPath: req.body.BrandLogoPath,
      PublicKey: req.body.PublicKey,
      SSOReturnURL: req.body.SSOReturnURL,
      SSOLogoutURL: req.body.SSOLogoutURL,
      FreeTrialProductUniqueCode: req.body.FreeTrialProductUniqueCode,
      NotificationsEmailAddress: req.body.NotificationsEmailAddress
   })
   .then(merchant => {
       //console.log(merchant.MerchantId+","+req.body.UserGroupName)
        MerchantUserGroup.create({
            MerchantId: merchant.MerchantId,
            //UserGroupId : 1,
            UserGroupName:req.body.UserGroupName,
            IsActive:1
        })
        .then(usermerchantgroup => {
            //console.log(usermerchantgroup)
            if (!usermerchantgroup) {
              //return res.status(404).send({ message: "User Merchant group Not found." });
            }
        });
            // MerchantUserGroup.findAll({
            //     where:{
            //         UserGroupName: {
            //             [Op.or]: req.body.UserGroupName
            //         }
            //     }
            // }) 
            // .then(merchantusergroup => {
            //     if(!merchantusergroup)
            //     {
            //         MerchantUserGroup.create({
            //             MerchantId: merchant.MerchantId,
            //             UserGroupId : 1,
            //             UserGroupName:req.body.UserGroupName,
            //             IsActive:1
            //         })
            //     }
                
            // });
           // console.log(req.body.LoginId)
            User.findOne({
                where: {
                  LoginId: req.body.LoginId
                }
            })
            .then(user => {
                //console.log("If :" + user)
                if (!user) {
                   User.create({
                    LoginId: req.body.LoginId,
                    Password: bcrypt.hashSync(req.body.Password, 8),
                    EmailAddress: req.body.EmailAddress,
                    FirstName:req.body.FirstName,
                    MiddleName:req.body.MiddleName,
                    LastName: req.body.LastName,
                    DisplayName:req.body.FirstName +" "+req.body.LastName,
                    Address1:req.body.Address1,
                    // Address2:req.body.Address2,
                    City:req.body.City,
                    PostalCode:req.body.PostalCode,
                    StateId:req.body.StateId,
                    CountryId:req.body.CountryId,
                    IsActive:req.body.IsActive
                   })
                   .then(nuser => {
                    //console.log("nuser:"+nuser)
                        if (req.body.roles) {  
                            //console.log(JSON.stringify(req.body.roles))      
                            Role.findAll({
                                where: {
                                RoleName: {
                                    [Op.or]: req.body.roles
                                    }
                                }
                            }).then(roles => {
                                nuser.setRoles(roles).then(() => {
                                //res.send({ message: "User was registered successfully!" });
                            });
                            });
                        } else {
                            // user role = 2
                            nuser.setRoles([2]).then(() => {
                            //res.send({ message: "User was registered successfully!" });
                            });
                        };
                        console.log("req.body.UserGroupName : "+req.body.UserGroupName)
                        if(req.body.UserGroupName)
                        {
                            //console.log("nuser:"+nuser.UserId+","+req.body.UserGroupName)
                            MerchantUserGroup.findOne({
                                where:{
                                    UserGroupName: req.body.UserGroupName
                                }
                            }).then(merchantusergroup=>{
                                 console.log("merchantusergroup : "+merchantusergroup)
                                // UsersMerchantUserGroups.create({
                                //     UserId:nuser.UserId,
                                //     MerchantId:merchantusergroup.MerchantId,
                                //     UserGroupId:merchantusergroup.UserGroupId,
                                //     IsActive:1
                                // })
                                // .then(usermerchantusergroup => {
                                            
                                // });
                                nuser.setMerchantUserGroups(merchantusergroup).then(() => {
                                    res.status(200).send({ message: "Merchant is created successfully!" });
                                });
                            });   
                        }
                   });
                }
                else
                {
                    User.findOne({
                        where: {
                          LoginId: req.body.LoginId
                        }
                    })
                    .then(user => {
                        console.log("Else : " +user)                       
                        if (req.body.roles) {  
                            //console.log(JSON.stringify(req.body.roles))      
                            Role.findAll({
                              where: {
                               RoleName: {
                                  [Op.or]: req.body.roles
                                }
                              }
                            }).then(roles => {
                              user.setRoles(roles).then(() => {
                                //res.send({ message: "User was registered successfully!" });
                              });
                            });
                        } else {
                            // user role = 2
                            user.setRoles([2]).then(() => {
                              //res.send({ message: "User was registered successfully!" });
                            });
                        };

                        MerchantUserGroup.findAll({
                            where:{
                             UserGroupName: {
                               [Op.or]: req.body.UserGroupName
                             }
                            }
                        })
                        .then(merchantusergroup=>{
                            console.log("Else : " +merchantusergroup)
                            //  UsersMerchantUserGroups.create({
                            //      UserId:user.UserId,
                            //      MerchantId:merchantusergroup.MerchantId,
                            //      UserGroupId:merchantusergroup.UserGroupId,
                            //      IsActive:1
                            //  })
                            //  .then(usermerchantusergroup => {
                                        
                            //  });
                            user.setMerchantUserGroups(merchantusergroup).then(() => {
                                res.status(200).send({ message: "Merchant is created successfully!" });
                            });
                        }); 
                    }); 
                    
                }
            });
    
       
   })
   .catch(err=>{
       res.status(500).send({ message: err.message });
   });
};

exports.updatemerchant = (req,res) => {
    Merchant.update({       
       MerchantCompany: req.body.MerchantCompany,
       MerchantAbbrName: req.body.MerchantAbbrName,
       AddressLine1: req.body.AddressLine1,
       AddressLine2: req.body.AddressLine2,
       AddressLine3: req.body.AddressLine3,
       City: req.body.City,
       StateId: req.body.StateId,
       CountryId: req.body.CountryId,
       ZipCode: req.body.ZipCode,
       MerchantHomePage: req.body.MerchantHomePage,
       MerchantRegistrationPage: req.body.MerchantRegistrationPage,
       InvoicePrefix: req.body.InvoicePrefix,
       LogoPath: req.body.LogoPath,
       MobileLogoPath: req.body.MobileLogoPath,
       InternalLogoPath: req.body.InternalLogoPath,
       SiteTitle: req.body.SiteTitle,
       SiteDescription: req.body.SiteDescription,
       AllowUserRegistration: req.body.AllowUserRegistration,
       DateFormat: req.body.DateFormat,
       TimeZoneOffset: req.body.TimeZoneOffset,
       IsActive: req.body.IsActive,
       //ActiveFrom: req.body.ActiveFrom,
       PaymentGatewayURL: req.body.PaymentGatewayURL,
       ShoppingCartURL: req.body.ShoppingCartURL,
       PaymentGatewayAPIURL: req.body.PaymentGatewayAPIURL,
       PaymentGatewayAPIUsername: req.body.PaymentGatewayAPIUsername,
       PaymentGatewayAPIPassword: req.body.PaymentGatewayAPIPassword,
       PaymentGatewaySecretPassword: req.body.PaymentGatewaySecretPassword,
       PaymentGatewayResponseURL: req.body.PaymentGatewayResponseURL,
       DefaultCurrencyId: req.body.DefaultCurrencyId,
       eLearningPassingScore: req.body.eLearningPassingScore,
       EmailTemplatesPostId: req.body.EmailTemplatesPostId,
       SupportMultiplePrices: req.body.SupportMultiplePrices,
       BrandLogoPath: req.body.BrandLogoPath,
       PublicKey: req.body.PublicKey,
       SSOReturnURL: req.body.SSOReturnURL,
       SSOLogoutURL: req.body.SSOLogoutURL,
       FreeTrialProductUniqueCode: req.body.FreeTrialProductUniqueCode,
       NotificationsEmailAddress: req.body.NotificationsEmailAddress
    },
    {
        where:{MerchantId: req.body.MerchantId}
    }
    ).then(() => {
     res.status(200).send({ message: "Merchant is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.getallmerchants=(req,res)=>{
   var merchants = [];
   Merchant.findAll({
    order: [
        ['ActiveFrom', 'DESC']
       ]
   }).then(merchants => {
    // var responseBody = {
    //     lstMerchant:[]
    //   }
    // merchants.forEach(merchant => {
    //     var merchantInfo = {
    //         MerchantId:merchant.MerchantId,
    //         MerchantCompany: merchant.MerchantCompany,
    //         MerchantAbbrName: merchant.MerchantAbbrName,
    //         AddressLine1: merchant.AddressLine1,
    //         AddressLine2: merchant.AddressLine2,
    //         AddressLine3: merchant.AddressLine3,
    //         City: merchant.City,
    //         StateId: merchant.StateId,
    //         CountryId: merchant.CountryId,
    //         ZipCode: merchant.ZipCode,
    //         MerchantHomePage: merchant.MerchantHomePage,
    //         MerchantRegistrationPage: merchant.MerchantRegistrationPage,
    //         InvoicePrefix: merchant.InvoicePrefix,
    //         LogoPath: merchant.LogoPath,
    //         MobileLogoPath: merchant.MobileLogoPath,
    //         InternalLogoPath: merchant.InternalLogoPath,
    //         SiteTitle: merchant.SiteTitle,
    //         SiteDescription: merchant.SiteDescription,
    //         AllowUserRegistration: merchant.AllowUserRegistration,
    //         DateFormat: merchant.DateFormat,
    //         TimeZoneOffset: merchant.TimeZoneOffset,
    //         IsActive: merchant.IsActive,
    //         ActiveFrom: merchant.ActiveFrom,
    //         BrandLogoPath: merchant.BrandLogoPath,
    //     }
    //     responseBody.lstMerchant.push(merchantInfo);
    // });
    res.status(200).send(merchants);
  });
};

exports.getmerchant=async (req,res)=>{
    await Merchant.findOne({
        where: {
            MerchantId: req.params.merchantid
        }
    }).then(merchant => {
       if (!merchant) {
          return res.status(404).send({ message: "Merchant Not found." });
       }
       res.status(200).send({
          MerchantId:merchant.MerchantId,
          MerchantCompany: merchant.MerchantCompany,
          MerchantAbbrName: merchant.MerchantAbbrName,
          AddressLine1: merchant.AddressLine1,
          AddressLine2: merchant.AddressLine2,
          AddressLine3: merchant.AddressLine3,
             City: merchant.City,
             StateId: merchant.StateId,
             CountryId: merchant.CountryId,
             ZipCode: merchant.ZipCode,
             MerchantHomePage: merchant.MerchantHomePage,
             MerchantRegistrationPage: merchant.MerchantRegistrationPage,
             InvoicePrefix: merchant.InvoicePrefix,
             LogoPath: merchant.LogoPath,
             MobileLogoPath: merchant.MobileLogoPath,
             InternalLogoPath: merchant.InternalLogoPath,
             SiteTitle: merchant.SiteTitle,
             SiteDescription: merchant.SiteDescription,
             AllowUserRegistration: merchant.AllowUserRegistration,
             DateFormat: merchant.DateFormat,
             TimeZoneOffset: merchant.TimeZoneOffset,
             IsActive: merchant.IsActive,
             ActiveFrom: merchant.ActiveFrom,
             BrandLogoPath: merchant.BrandLogoPath,
        });         
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};


exports.createmerchantsiteurl = (req,res) => {
    Merchantsiteurl.create({
      SiteNumber: req.body.SiteNumber,
      SiteURL: req.body.SiteURL,
      MerchantId: req.body.MerchantId,
      IsActive: req.body.IsActive
   })
   .then(()=>{
      res.status(200).send({ message: "Merchant site url is created successfully!" });
   })
   .catch(err=>{
       res.status(500).send({ message: err.message });
   });
};

exports.updatemerchantsiteurl = (req,res) => {
    Merchantsiteurl.update({
       SiteURL: req.body.SiteURL,
       MerchantId: req.body.MerchantId,
       IsActive: req.body.IsActive
    },
    {
       where: {SiteNumber: req.body.SiteNumber}
    })
    .then(()=>{
       res.status(200).send({ message: "Merchant site url is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.createmerchantusergroup = (req,res) => {
    MerchantUserGroup.create({
        MerchantId: req.body.MerchantId,
        UserGroupId: req.body.UserGroupId,
        UserGroupName: req.body.UserGroupName,
        IsActive: req.body.IsActive
   })
   .then(()=>{
      res.status(200).send({ message: "Merchant user group is created successfully!" });
   })
   .catch(err=>{
       res.status(500).send({ message: err.message });
   });
};

exports.updatemerchantusergroup = (req,res) => {
    MerchantUserGroup.update({       
        UserGroupName: req.body.UserGroupName,
        IsActive: req.body.IsActive
    },
    {
       where: {UserGroupId: req.body.UserGroupId, MerchantId: req.body.MerchantId}
    })
    .then(()=>{
       res.status(200).send({ message: "Merchant user group is updated successfully!" });
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};


//Category Section
exports.createcategorygroup=(req,res)=>{
    CategoryGroup.create({
        CategoryGroupName:req.body.CategoryGroupName,
        IsActive:req.body.IsActive
    })
    .then(()=>{
        res.status(200).send({ message: "Category group is created successfully!" }); 
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.updatecategorygroup=(req,res)=>{
    CategoryGroup.update({
        CategoryGroupName:req.body.CategoryGroupName,
        IsActive:req.body.IsActive
    },
    {
       where: {CategoryGroupId: req.body.CategoryGroupId}
    })
    .then(()=>{
        res.status(200).send({ message: "Category group is updated successfully!" }); 
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.getCategoryGroupById=(req,res)=>{
    CategoryGroup.findOne({
        where:{CategoryGroupId:req.body.CategoryGroupId}
    })
    .then(catgrp=>{       
        res.status(200).send(catgrp);        
    })
}

exports.getCategoryGroup=(req,res)=>{
    var categorygroups=[];
    CategoryGroup.findAll({
        where:{
             IsActive:true
        }
        //, order:[
        //    ['CategoryGroupId', 'DESC']
        // ]
    }).then(catgrps=>{
        // var responseBody={
        //     lstCategoryGroups:[]
        // }
        // catgrps.forEach(catgrp=>{
        //     var catgrpInfo={
        //         CategoryGroupId:catgrp.CategoryGroupId,
        //         CategoryGroupName:catgrp.CategoryGroupName
        //     }
            
        //     //responseBody.lstCategoryGroups.push(catgrpInfo);
        // });
        res.status(200).send(catgrps);        
    })
};

exports.createcategory=(req,res)=>{
    Category.create({
        CategoryName:req.body.CategoryName,
        CategoryType:req.body.CategoryType,
        CategoryGroupId:req.body.CategoryGroupId,
        IsActive:req.body.IsActive
    })
    .then(()=>{
        res.status(200).send({ message: "Category is created successfully!" }); 
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};


exports.updatecategory=(req,res)=>{
    Category.update({
        CategoryName:req.body.CategoryName,
        CategoryType:req.body.CategoryType,
        CategoryGroupId:req.body.CategoryGroupId,
        IsActive:req.body.IsActive
    },
    {
        where: {CategoryId: req.body.CategoryId}
    })
    .then(()=>{
        res.status(200).send({ message: "Category is created successfully!" }); 
    })
    .catch(err=>{
        res.status(500).send({ message: err.message });
    });
};

exports.getcategorybyid=async (req,res)=>{    
    await Category.findOne({
        include:CategoryGroup,
        where: {
            CategoryId: req.params.categoryid
        }
    }).then(category=>{               
        res.status(200).send(category);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
}

exports.getcategorytype=(req,res)=>{
    CategoryType.findAll({
        where:{
            IsActive:true,
            CategoryTypeId:3
        }
    }).then(categorytype=>{        
        res.status(200).send(categorytype);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
}

//Product and ProductBundle section

exports.createproductbundle=(req,res)=>{
    ProductBundle.create({
        //BundleId:req.body.BundleId,
        BundleName:req.body.BundleName,
        IsCompanyBundle:req.body.IsCompanyBundle,
        CompanyId:req.body.CompanyId,
        CreatorMerchantId:req.body.CreatorMerchantId,
        IsActive:req.body.IsActive,
        DisplayOrder:req.body.DisplayOrder
    })
    .then(()=>{
        res.status(200).send({message: "Product Bundle is created successfully!"})
    })
    .catch(err=>{
         res.status(500).send({message: err.message});
    });
};

exports.updateproductbundle=(req,res)=>{
    ProductBundle.update({
        BundleName:req.body.BundleName,
        IsCompanyBundle:req.body.IsCompanyBundle,
        CompanyId:req.body.CompanyId,
        CreatorMerchantId:req.body.CreatorMerchantId,
        IsActive:req.body.IsActive,
        DisplayOrder:req.body.DisplayOrder
    },
    {
       where:{BundleId:req.body.BundleId} 
    })
    .then(()=>{
        res.status(200).send({message: "Product Bundle is updated successfully!"})
    })
    .catch(err=>{
         res.status(500).send({message: err.message});
    });
};

exports.getproductbundle=(req,res)=>{
    const title=req.query.title ? req.query.title : '';
    //const companyid=req.query.company ? req.query.company : '';
    const page = parseInt(req.query.page) || 0;

    // get pager object for specified page
    const size = parseInt(req.query.size) || ProductBundle.count;
    const { limit, offset } = getPagination(page, size);
    ProductBundle.findAndCountAll({
        //include:MerchantProducts,
        limit,
        offset,    
        where:{           
            BundleName: { [Op.like]: `%${title}%` } ,            
            IsActive:true
       }
    })
    .then(prdbundle=>{ 
        const response = getPagingData(prdbundle, page, limit);              
        res.status(200).send(response);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};

exports.getbundlebyid=(req,res)=>{
    ProductBundle.findOne({
        where:{
            BundleId:req.params.BundleId
        }
    })
    .then(prdbundle=>{                      
        res.status(200).send(prdbundle);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};


exports.createproduct= (req,res)=>{    
    Product.create({
        ProductType:req.body.ProductType,
        CompanyId:req.body.CompanyId,
        ProductName:req.body.ProductName,
        ProductUniqueCode:req.body.ProductUniqueCode,
        ProductUniqueName:req.body.ProductUniqueName,
        ProductSummary:req.body.ProductSummary,
        DisplayOrder:req.body.DisplayOrder,
        IsFeatured: req.body.IsFeatured,
        IsActive:req.body.IsActive,
        PublishStatus:req.body.PublishStatus
    })
    .then(product=>{
        if(req.body.merchantproduct!=null){
            for(let i=0;i<req.body.merchantproduct.length;i++){
                MerchantProducts.create({
                    MerchantId:req.body.merchantproduct[i].MerchantId,
                    ProductId:product.ProductId,
                    CPDHours:req.body.merchantproduct[i].CPDHours,
                    IsActive:req.body.merchantproduct[i].IsActive,
                    //ActiveFrom:req.body.ActiveFrom,
                    //ActiveTo:req.body.ActiveTo
                })
                .then(merproduct => {
                    //console.log(usermerchantgroup)
                    if (!merproduct) {
                    //return res.status(404).send({ message: "User Merchant group Not found." });
                    }
                }) 
                .catch(err=>{
                    res.status(500).send({message: "MerchantProducts create issue " + err.message});
                });
            }
        }
        res.status(200).send({message: "Product is created successfully."})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });


};

exports.updateproduct=(req,res)=>{
    Product.update({
    ProductType:req.body.ProductType,
    CompanyId:req.body.CompanyId,
    ProductName:req.body.ProductName,
    ProductUniqueCode:req.body.ProductUniqueCode,
    ProductUniqueName:req.body.ProductUniqueName,
    ProductSummary:req.body.ProductSummary,
    DisplayOrder:req.body.DisplayOrder,
    IsFeatured: req.body.IsFeatured,
    IsActive:req.body.IsActive,
    PublishStatus:req.body.PublishStatus  
    },
    {
        where:{ProductId:req.body.ProductId}
    })
    .then(product=>{
        if(req.body.merchantproduct!=null){
            for(let i=0;i<req.body.merchantproduct.length;i++){
            MerchantProducts.update({
                MerchantId:req.body.merchantproduct[i].MerchantId,
                ProductId:product.ProductId,
                CPDHours:req.body.merchantproduct[i].CPDHours,
                IsActive:req.body.merchantproduct[i].IsActive,
                //ActiveFrom:req.body.ActiveFrom,
                //ActiveTo:req.body.ActiveTo
            },
            {
                where:{
                    MerchantId:req.body.merchantproduct[i].MerchantId,
                    ProductId:req.body.ProductId
                }
            })
            .then(merproduct => {
                //console.log(usermerchantgroup)
                if (!merproduct) {
                    //return res.status(404).send({ message: "User Merchant group Not found." });
                }
            }) 
            .catch(err=>{
                res.status(500).send({message: "MerchantProducts update issue " + err.message});
            });
            }
            
        }
    res.status(200).send({message: "Product is updated successfully."})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
};

exports.updateproductstatus=(req,res)=>{
    Product.update({      
      IsActive:req.body.IsActive,
      PublishStatus:req.body.PublishStatus  
    },
    {
        where:{ProductId:req.body.ProductId}
    })
    .then(()=>{
      res.status(200).send({message: "Product status is published successfully!"})
    })
    .catch(err=>{
          res.status(500).send({message: err.message});
     });
};

exports.createmerchantproducts=(req,res)=>{
    MerchantProducts.create({
        MerchantId:req.body.MerchantId,
        ProductId:req.body.ProductId,
        CPDHours:req.body.CPDHours,
        IsActive:req.body.IsActive,
        ActiveFrom:req.body.ActiveFrom,
        ActiveTo:req.body.ActiveTo
    })
    .then(()=>{
        res.status(200).send({message: "Merchant Products is created successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
};

exports.updatemerchantproducts=(req,res)=>{
    MerchantProducts.update({
        // MerchantId:req.body.MerchantId,
        // ProductId:req.body.ProductId,
        CPDHours:req.body.CPDHours,
        IsActive:req.body.IsActive,
        ActiveFrom:req.body.ActiveFrom,
        ActiveTo:req.body.ActiveTo
    },
    {
        where:{
            MerchantId:req.body.MerchantId,
            ProductId:req.body.ProductId
        }
    })
    .then(()=>{
        res.status(200).send({message: "Merchant Products is updated successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
};

exports.GetMerchantProducts=(req,res)=>
{
    Merchant.findAll({
        include:  [{
            model: MerchantProducts,
            //right:true
            // ,required: false,
            // attributes: ['MerchantId', 'ProductId','CPDHours'],
            // where: {
            //     MerchantId: {                 
            //       [Op.eq]: null
            //     }
            // }
        }],
        where:{
            IsActive:true
        }
    }).then(merproduct=>{   
        // var MerchantProducts = [
            
        // ];
        // merproduct.getProducts().then(mer=>{
        //     for (let i = 0; i < mer.length; i++) {
        //        var merchantproduct={
        //            MerchantId:mer[i].MerchantId,
        //            CPDHours:mer[i].CPDHours,
        //            IsActive:mer[i].IsActive,
        //            ActiveFrom:mer[i].ActiveFrom,
        //            ActiveTo:mer[i].ActiveTo,
        //            MerchantName:merproduct.MerchantCompany
        //        }
        //        MerchantProduct.push(merchantproduct);
        //     } 
            
        // })  
        // if(merproduct.MerchantProducts==null)
        // {
        //     var merchantproduct={
        //                    MerchantId:merproduct.MerchantId,
        //                    CPDHours:0,
        //                    IsActive:false,
        //                    ActiveFrom:null,
        //                    ActiveTo:null,
        //                    MerchantCompany:merproduct.MerchantCompany
        //                }                       
                   
        //             res.status(200).send(
        //                 {
        //                     MerchantId: merproduct.MerchantId,
        //                     MerchantCompany:merproduct.MerchantCompany,
        //                     MerchantProducts:MerchantProducts.push(merchantproduct)
        //                 } );
        // }
        // else{
        //     res.status(200).send(
        //         {
        //             MerchantId: merproduct.MerchantId,
        //             MerchantCompany:merproduct.MerchantCompany,
        //             MerchantProducts:merproduct.MerchantProducts
        //         }
        //     );
            
        // }
        // var merchantproduct={
        //                        MerchantId:merproduct.MerchantId,
        //                        CPDHours:(merproduct.MerchantProducts==null?0:merproduct.MerchantProducts[0].CPDHours),
        //                        IsActive:(merproduct.MerchantProducts==null?false:merproduct.MerchantProducts[0].IsActive),
        //                        ActiveFrom:null,
        //                        ActiveTo:null,
        //                        MerchantCompany:merproduct.MerchantCompany
        //                    } 
        // res.status(200).send(
        //                     {
        //                         MerchantId: merproduct.MerchantId,
        //                         MerchantCompany:merproduct.MerchantCompany,
        //                         MerchantProducts:merproduct.MerchantProducts
        //                     } );  
                           res.status(200).send(merproduct);   
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
}

exports.getProduct=(req,res)=>{
    const title=req.query.title ? req.query.title : '';
    const companyid=req.query.company ? req.query.company : '';
    const page = parseInt(req.query.page) || 0;

    // get pager object for specified page
    const size = parseInt(req.query.size) || 5;
    const { limit, offset } = getPagination(page, size);
    Product.findAndCountAll({
        include:MerchantProducts,
        limit,
        offset,    
        where:{
            CompanyId:{ [Op.like]: `${companyid}` },
            ProductName: { [Op.like]: `%${title}%` } ,            
            //IsActive:true
       }
    })
    .then(product=>{ 
        const response = getPagingData(product, page, limit);              
        res.status(200).send(response);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};

exports.getProductById= async (req,res)=>{
  await Product.findOne({
        include: [{
            model: MerchantProducts,
            right:true,
            include:[{
                model:Merchant,
                attributes:['MerchantId', 'MerchantCompany','MerchantAbbrName']
            }],
        }],
        where: {
            ProductId: req.params.productid
        }
    })
    .then(product=>{ 
        var lmspackagepath="";
        const directoryPath = path.join(__dirname, '../../public/lmspayload/'+product.ProductUniqueCode+'/');
        //console.log(directoryPath+","+fs.existsSync(directoryPath))
        if(fs.existsSync(directoryPath))
        {
            lmspackagepath= product.ProductUniqueCode+'.zip';
        }
        res.status(200).send({
            ProductId: product.ProductId,
            ProductType: product.ProductType,
            CompanyId: product.CompanyId,
            ProductName: product.ProductName,
            ProductUniqueCode: product.ProductUniqueCode,
            ProductUniqueName: product.ProductUniqueName,
            ProductSummary:product.ProductSummary ,
            DisplayOrder: product.DisplayOrder,
            IsFeatured: product.IsFeatured,
            IsActive: product.IsActive,
            PublishStatus: product.PublishStatus, 
            catelogimage : "/productImage/catalog/" + product.ProductUniqueCode +".jpeg",
            screenshotimage : "/productImage/screenshot/" + product.ProductUniqueCode +".jpeg",
            packagefile: lmspackagepath,     
            MerchantProducts: product.MerchantProducts
        });        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};

exports.getcategory=(req,res)=>{ 
    //const { page, size, title } = req.query;
    const title=req.query.title ? req.query.title : '';
    //alert(parseInt(req.query.page))
    const page = parseInt(req.query.page) || 0;

    // get pager object for specified page
    const size = parseInt(req.query.size) || Category.count();
    const { limit, offset } = getPagination(page, size);   
    Category.findAndCountAll({
        include: CategoryGroup,
        limit,
        offset,       
        where:{
             CategoryName: { [Op.like]: `%${title}%` } ,            
             //IsActive:true
        }
    }).then(category=>{ 
        const response = getPagingData(category, page, limit);              
        res.status(200).send(response);        
    })
    .catch(err => {
        res.status(500).send({ message: err.message });
    });
};

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: categories } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems / limit);
  
    return { totalItems, categories, totalPages, currentPage };
};

const getPagination = (page, size) => {
    const limit = size ? +size : 5;
    const offset = page ? page * limit : 0;
  
    return { limit, offset };
};

exports.GetProductScreenshotFiles=(req,res)=>{
    const filenamelist=[];
    const filesmallname=[];
    const filename=[];
    const directoryPath = path.join(__dirname, '../../public/productImage/screenshot/'+req.params.productcode+'/');
    files = fs.readdirSync(directoryPath)
  
    for (const file of files) {
        if(file.indexOf('_s')==-1){
          filename.push(file);
        }
        else{
         filesmallname.push(file);
        }
    
     //console.log(file)
    }
    res.status(200).send({
         imagepath:"/productImage/screenshot/"+req.params.productcode+"/",    
         filesmallname: filesmallname,
         filename: filename
    });
  
   //  return files
  
 };
 
 //Meta key and Meta Group and Template section
 exports.createTemplate=(req,res)=>{
     ConatinerTemplates.create({
         //TemplateId: req.body.TemplateId,
         TemplateName: req.body.TemplateName,
         IsActive: req.body.IsActive,
         TemplateType: req.body.TemplateType
     })
     .then(()=>{
         res.status(200).send({message: "Container template is created successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.updateTemplate=(req,res)=>{
     ConatinerTemplates.update({       
         TemplateName: req.body.TemplateName,
         IsActive: req.body.IsActive,
         TemplateType: req.body.TemplateType
     },
     {
         where:{
            TemplateId: req.body.TemplateId,
         }
     }  
     )
     .then(()=>{
         res.status(200).send({message: "Container template is updated successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getTemplate=(req,res)=>{
    ConatinerTemplates.findAll(
        {
            where:{
              TemplateId: req.params.TemplateId,
            }
        }
    )
    .then(template=>{
        //console.log(template.TemplateType+","+ TemplateTypes.filter(tt=>tt.id==template.TemplateType)[0].name);
        var ttemplate=[];
        for(let i=0;i<template.length;i++){
         var ctemplate={
             TemplateId:template[i].TemplateId,
             TemplateName: template[i].TemplateName,
             IsActive: template[i].IsActive,
             TemplateType: template[i].TemplateType,
             TemplateTypeName : TemplateTypes.filter(tt=>tt.id==template[i].TemplateType)[0].name
         }
         ttemplate.push(ctemplate);
        }
         res.status(200).send(ttemplate)
        //console.log(ctemplate);
        //res.status(200).send(ctemplate)
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getallTemplate=(req,res)=>{
     ConatinerTemplates.findAll({
         where:{
           IsActive: true,
         }
     })
     .then(template=>{
         var ttemplate=[];
        for(let i=0;i<template.length;i++){
         var ctemplate={
             TemplateId:template[i].TemplateId,
             TemplateName: template[i].TemplateName,
             IsActive: template[i].IsActive,
             TemplateType: template[i].TemplateType,
             TemplateTypeName : TemplateTypes.filter(tt=>tt.id==template[i].TemplateType)[0].name
         }
         ttemplate.push(ctemplate);
        }
         res.status(200).send(ttemplate)
      })
      .catch(err=>{
          res.status(500).send({message: err.message});
      });
 };
 
 exports.createMetaGroup=(req,res)=>{
     MetaGroups.create({
         //TemplateId: req.body.TemplateId,
         MetaGroupName: req.body.MetaGroupName,
         IsActive: req.body.IsActive,
         DisplayOrder: req.body.DisplayOrder
     })
     .then(()=>{
         res.status(200).send({message: "Metagroup is created successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.updateMetaGroup=(req,res)=>{
     MetaGroups.update({
         MetaGroupName: req.body.MetaGroupName,
         IsActive: req.body.IsActive,
         DisplayOrder: req.body.DisplayOrder
     },
     {
         where:{
             MetaGroupId: req.body.MetaGroupId,
         }
     }  
     )
     .then(()=>{
         res.status(200).send({message: "MetaGroup is updated successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getMetaGroups=(req,res)=>{
     MetaGroups.findAll(
         {
             where:{
                 MetaGroupId: req.params.MetaGroupId,
             }
         }
     )
     .then(metagrp=>{
         var mgroup=[];
         for(let i=0;i<metagrp.length;i++){
          var cmgroup={
              MetaGroupId:metagrp[i].MetaGroupId,
              MetaGroupName: metagrp[i].MetaGroupName,
              IsActive: metagrp[i].IsActive,
              DisplayOrder: metagrp[i].DisplayOrder,
              
          }
          mgroup.push(cmgroup);
         }
         res.status(200).send(mgroup)
      })
      .catch(err=>{
          res.status(500).send({message: err.message});
      });
 };
  
 exports.getallMetaGroups=(req,res)=>{
     MetaGroups.findAll(
          {
              where:{
                IsActive: true,
              }
          }
      )
      .then(metagrp=>{
         var mgroup=[];
         for(let i=0;i<metagrp.length;i++){
          var cmgroup={
              MetaGroupId:metagrp[i].MetaGroupId,
              MetaGroupName: metagrp[i].MetaGroupName,
              IsActive: metagrp[i].IsActive,
              DisplayOrder: metagrp[i].DisplayOrder,
              
          }
          mgroup.push(cmgroup);
         }
          res.status(200).send(mgroup);
       })
       .catch(err=>{
           res.status(500).send({message: err.message});
       });
 };
 
 exports.createMetaKey=(req,res)=>{
     MetaKeys.create({
         //MetaId: req.body.MetaId,
         MetaGroupId: req.body.MetaGroupId,
         KeyName: req.body.KeyName,
         KeyDisplay: req.body.KeyDisplay,
         TemplateId: req.body.TemplateId,
         KeyControlType: req.body.KeyControlType,
         KeyDataType: req.body.KeyDataType,
         DefaultValue: req.body.DefaultValue,
         Mandatory: req.body.Mandatory,
         DisplayOrder: req.body.DisplayOrder,
         MaxLength: req.body.MaxLength,
         IsActive: req.body.IsActive,
         LookupGroupId: req.body.LookupGroupId,
         ConditionalMetaId: req.body.ConditionalMetaId,
         ConditionalMetaValue: req.body.ConditionalMetaValue
         
     })
     .then(()=>{
         res.status(200).send({message: "Metagroup is created successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.updateMetaKey=(req,res)=>{
     MetaKeys.update({
         MetaGroupId: req.body.MetaGroupId,
         KeyName: req.body.KeyName,
         KeyDisplay: req.body.KeyDisplay,
         TemplateId: req.body.TemplateId,
         KeyControlType: req.body.KeyControlType,
         KeyDataType: req.body.KeyDataType,
         DefaultValue: req.body.DefaultValue,
         Mandatory: req.body.Mandatory,
         DisplayOrder: req.body.DisplayOrder,
         MaxLength: req.body.MaxLength,
         IsActive: req.body.IsActive,
         LookupGroupId: req.body.LookupGroupId,
         ConditionalMetaId: req.body.ConditionalMetaId,
         ConditionalMetaValue: req.body.ConditionalMetaValue
     },
     {
         where:{
             MetaId: req.body.MetaId
         }
     }  
     )
     .then(()=>{
         res.status(200).send({message: "MetaKey is updated successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getMetaKey=(req,res)=>{
     //const { page, size, title } = req.query;
    const title=req.query.title ? req.query.title : '';
    const template= req.query.template?req.query.template:'';
    const metagroup=req.query.metagroup?req.query.metagroup:'';
    //alert(parseInt(req.query.page))
    const page = parseInt(req.query.page) || 0;

    // get pager object for specified page
    const size = parseInt(req.query.size) || 5;
    const { limit, offset } = getPagination(page, size);  
     MetaKeys.findAndCountAll(
         {   
             include:[
                 {
                    attributes:['TemplateId','TemplateName'],
                    model:ConatinerTemplates,
                    required: true
                 },
                 {
                    attributes:['MetaGroupId','MetaGroupName'],
                    model:MetaGroups, 
                    required: true
                 },
                 {
                     model:LookupGroup
                 }
                 
            ],
            limit,
            offset,        
            where:getMetaKeyConditions(req)
         }
     )
     .then(metakey=>{
        const response = getPagingData(metakey, page, limit);              
        res.status(200).send(response);   
        // res.status(200).send(metakey)
      })
      .catch(err=>{
          res.status(500).send({message: err.message});
      });
 };

 function getMetaKeyConditions(req) {
    MetaKeyConditions = {};
    // // Query param date
    // if (req.query.date) {
    //   fooCondtions.start = {
    //     [Op.gte]: moment(parseInt(req.query.date)).utc().startOf('day'),
    //     [Op.lte]: moment(parseInt(req.query.date)).utc().endOf('day')
    //   }
    // }
    // Query param name
    if (req.query.title) {
        MetaKeyConditions.KeyName = {
        [Op.like]: '%' + (req.query.title) + '%'
      }
    }
    // Query param templateid
    if (req.query.template!=0) {
        MetaKeyConditions.TemplateId = {
        [Op.eq]: req.query.template
      }
    }

    // Query param metagroupid
    if (req.query.metagroup!=0) {
        MetaKeyConditions.MetaGroupId = {
          [Op.eq]: req.query.metagroup
        }
    }

    // Query param KeyDataType
    if (req.query.datatype!=0) {
        MetaKeyConditions.KeyDataType = {
        [Op.eq]: req.query.datatype
        }
    }

    // Query param KeyControlType
    if (req.query.keycontroltype!=0) {
        MetaKeyConditions.KeyControlType = {
        [Op.eq]: req.query.keycontroltype
        }
    }

    // MetaKeyConditions.IsActive ={
    //     [Op.eq]:true
    // }
    return MetaKeyConditions;
 };

 exports.getMetaKeyById=(req,res)=>{
   MetaKeys.findOne({
       where:{
           MetaId:req.params.MetaId
       }
   })
   .then(metakey=>{
       res.status(200).send(metakey);
   })
   .catch(err=>{
    res.status(500).send({message: err.message});
   });
 };
 
 exports.createLookupGroup=(req,res)=>{
     LookupGroup.create({
         //TemplateId: req.body.TemplateId,
         LookupGroupName: req.body.LookupGroupName,
         IsActive: req.body.IsActive
     })
     .then(()=>{
         res.status(200).send({message: "Lookup group is created successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.updateLookupGroup=(req,res)=>{
     LookupGroup.update({
         LookupGroupName: req.body.LookupGroupName,
         IsActive: req.body.IsActive
     },
     {
         where:{
           LookupGroupId: req.body.LookupGroupId,
         }
     }  
     )
     .then(()=>{
         res.status(200).send({message: "Lookup group is updated successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getLookUpGroup=(req,res)=>{
     LookupGroup.findAll(
         {
             where:{
                 LookupGroupId: req.params.LookupGroupId,
             }
         }
     )
     .then(lookupgrp=>{
         var lookupgrps=[];
         for(let i=0;i<lookupgrp.length;i++){
          var cmgroup={
             LookupGroupId:lookupgrp[i].LookupGroupId,
             LookupGroupName: lookupgrp[i].LookupGroupName,
             IsActive: lookupgrp[i].IsActive,
              
          }
          lookupgrps.push(cmgroup);
         }
         res.status(200).send(lookupgrps)
      })
      .catch(err=>{
          res.status(500).send({message: err.message});
      });
 };
  
 exports.getallLookUpGroup=(req,res)=>{
     LookupGroup.findAll(
          {
              where:{
                IsActive: true,
              }
          }
      )
      .then(lookupgrp=>{
         var lookupgrps=[];
         for(let i=0;i<lookupgrp.length;i++){
          var cmgroup={
             LookupGroupId:lookupgrp[i].LookupGroupId,
             LookupGroupName: lookupgrp[i].LookupGroupName,
             IsActive: lookupgrp[i].IsActive,
              
          }
          lookupgrps.push(cmgroup);
         }
         res.status(200).send(lookupgrps)
       })
       .catch(err=>{
           res.status(500).send({message: err.message});
       });
 };
 
 exports.createLookupValue=(req,res)=>{
     LookupValue.create({
         LookupGroupId: req.body.LookupGroupId,
         LookupDisplay: req.body.LookupDisplay,
         LookupDataValue: req.body.LookupDataValue,
         IsActive: req.body.IsActive
     })
     .then(()=>{
         res.status(200).send({message: "Lookup value is created successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.updateLookupValue=(req,res)=>{
     LookupValue.update({       
         LookupDisplay: req.body.LookupDisplay,
         IsActive: req.body.IsActive
     },
     {
         where:{
             LookupGroupId: req.body.LookupGroupId,
             LookupDataValue: req.body.LookupDataValue,
         }
     }  
     )
     .then(()=>{
         res.status(200).send({message: "Lookup value is updated successfully!"})
     })
     .catch(err=>{
         res.status(500).send({message: err.message});
     });
 };
 
 exports.getLookupValue=(req,res)=>{
     LookupValue.findAll(
         {
             where:{
                 LookupDataValue: req.params.LookupDataValue,
             }
         }
     )
     .then(lookupvalue=>{
         var lookupvalues=[];
         for(let i=0;i<lookupvalue.length;i++){
          var cmgroup={
             LookupGroupId: lookupvalue[i].LookupGroupId,
             LookupDataValue: lookupvalue[i].LookupDataValue,
             LookupDisplay: lookupvalue[i].LookupDisplay,
             IsActive: lookupvalue[i].IsActive,
              
          }
          lookupvalues.push(cmgroup);
         }
         res.status(200).send(lookupvalues)
      })
      .catch(err=>{
          res.status(500).send({message: err.message});
      });
 };
 
 exports.getLookupValuebyDataValue=(req,res)=>{
     LookupValue.findOne(
         {
             where:{
                 LookupDataValue: req.params.id,
             }
         }
     )
     .then(lookupvalue=>{ 
         console.log(lookupvalue)
         if(lookupvalue==null){
             res.status(200).send("False")
         }
         else{
             res.status(200).send("True")
         }
         
      })
      .catch(err=>{
          res.status(500).send(false);
      });
 };
  
 exports.getallLookupValue=(req,res)=>{
     LookupValue.findAll(
          {
              where:{
                IsActive: true,
              }
          }
      )
      .then(lookupvalue=>{
         var lookupvalues=[];
         for(let i=0;i<lookupvalue.length;i++){
          var cmgroup={
             LookupGroupId: lookupvalue[i].LookupGroupId,
             LookupDataValue: lookupvalue[i].LookupDataValue,
             LookupDisplay: lookupvalue[i].LookupDisplay,
             IsActive: lookupvalue[i].IsActive,
              
          }
          lookupvalues.push(cmgroup);
         }
         res.status(200).send(lookupvalues)
       })
       .catch(err=>{
           res.status(500).send({message: err.message});
       });
 };
 
 exports.getallLookupValuebygrpId=(req,res)=>{
     LookupValue.findAll(
          {
             where:{
                LookupGroupId: req.params.LookupGroupId,
                IsActive: true,
             }
          }
      )
      .then(lookupvalue=>{
         var lookupvalues=[];
         for(let i=0;i<lookupvalue.length;i++){
          var cmgroup={
             LookupGroupId: lookupvalue[i].LookupGroupId,
             LookupDataValue: lookupvalue[i].LookupDataValue,
             LookupDisplay: lookupvalue[i].LookupDisplay,
             IsActive: lookupvalue[i].IsActive,
              
          }
          lookupvalues.push(cmgroup);
         }
         res.status(200).send(lookupvalues)
       })
       .catch(err=>{
           res.status(500).send({message: err.message});
       });
 };
 
 exports.getTemplateType=(req,res)=>{    
     res.status(200).send(TemplateTypes);
 };
 exports.getTemplateTypeById=(req,res)=>{    
     res.status(200).send(TemplateTypes.filter(tt=>tt.id==req.params.id));
 };
 exports.getKeyControlType=(req,res)=>{    
     res.status(200).send(KeyControlType);
 };
 exports.getKeyControlTypeById=(req,res)=>{    
     res.status(200).send(KeyControlType.filter(tt=>tt.id==req.params.id));
 };
 exports.getKeyDataType=(req,res)=>{    
     res.status(200).send(KeyDataType);
 };
 exports.getKeyDataTypeById=(req,res)=>{    
     res.status(200).send(KeyDataType.filter(tt=>tt.id==req.params.id));
 };
 exports.getPostType=(req,res)=>{    
     res.status(200).send(PostType);
 };
 exports.getPostTypeById=(req,res)=>{    
     res.status(200).send(PostType.filter(tt=>tt.id==req.params.id));
 };

 exports.getPublishStatus=(req,res)=>{
    res.status(200).send(PublishStatus);
 }

 exports.getPublishStatusById=(req,res)=>{
    res.status(200).send(PublishStatus.filter(tt=>tt.id==req.params.id));
 }

 exports.GetMetaGroupWithMetaKey=(req,res)=>{
    const templateid=req.query.templateid ;
    const productid= req.query.productid
    MetaGroups.findAll({
        include:[
           {
               attributes:['MetaId','KeyName','KeyDisplay','MaxLength','KeyDataType','KeyControlType','Mandatory','LookupGroupId'],
               model:MetaKeys,
               //required:true,
               include:[                                    
                    {
                        attributes:['TemplateId','TemplateName'],
                        model:ConatinerTemplates,
                        required:true,
                        where:{
                            TemplateId:templateid
                        }
                    },
                    {
                        attributes:['LookupGroupId','LookupGroupName'],
                        model:LookupGroup,
                        //required:true,
                        include:[
                            {
                                model:LookupValue,
                                required:true,
                            }
                        ]
                    },
                    {
                        attributes:['ProductId','MetaValue'],
                        model:ProductMetaData,
                        required:false,
                        where:{
                            ProductId:productid
                        }
                    } 
               ],
               where:{
                  IsActive:true
               }
           }
           
        ],
        where:{
           IsActive:true
        }
    })
    .then(m=>{
        res.status(200).send(m);
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
 };

 exports.createProductMetaData=(req,res)=>{
    ProductMetaData.destroy({
        where:{
            ProductId:req.body.ProductId
        }
    }).then(()=>{
       
    });
    ProductMetaData.bulkCreate(req.body.metaData)
    .then(()=>{
        res.status(200).send({message: "Product meta data is created successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
    
 };

 exports.updateProductMetaData=(req,res)=>{
    ProductMetaData.update({       
        MetaValue: req.body.MetaValue
    },
    {
        where:{
            ProductId: req.body.ProductId,
            MetaId: req.body.MetaId,
        }
    }
    )
    .then(()=>{
        res.status(200).send({message: "Product meta data is updated successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
  };

  exports.getProductMetaData=(req,res)=>{
    ProductMetaData.findAll({
        where:{
            ProductId:req.params.productid
        }
    })
    .then(productmetadata=>{
        res.status(200).send(productmetadata);
    })
    .catch(err=>{
        res.status(500).send({message: err.message})
    })
  }

  exports.getLicenseType=(req,res)=>{    
    res.status(200).send(LicenseType);
  };
  exports.getLicenseTypeById=(req,res)=>{    
    res.status(200).send(LicenseType.filter(tt=>tt.id==req.params.id));
  };

  exports.getPriceType=(req,res)=>{    
    res.status(200).send(PriceType);
  };
  exports.getPriceTypeById=(req,res)=>{    
    res.status(200).send(PriceType.filter(tt=>tt.id==req.params.id));
  };

  exports.getPromoCodeType=(req,res)=>{    
    res.status(200).send(PromoCodeType);
  };

  exports.getPromoCodeTypeById=(req,res)=>{    
    res.status(200).send(PromoCodeType.filter(tt=>tt.id==req.params.id));
  };

//   // Override timezone formatting for MSSQL
//   Sequelize.DATE.prototype._stringify = function _stringify(date, options) {
//     return this._applyTimezone(date, options).format('YYYY-MM-DD HH:mm:ss.SSS');
//   };

  exports.createproductprice=(req,res)=>{
    MerchantProductPrice.create({
        MerchantId: req.body.MerchantId,
        ProductId: req.body.ProductId,
        LicenseType: req.body.LicenseType,
        PriceType: req.body.PriceType,
        CurrencyCode: req.body.CurrencyCode,
        PriceA: req.body.PriceA,
        PriceB: req.body.PriceB,
        IsActive: req.body.IsActive,
        ActiveFrom: req.body.ActiveFrom,
        ActiveTo: req.body.ActiveTo==null?null: req.body.ActiveTo,
        IsActive: req.body.IsActive
    })
    .then(()=>{
        res.status(200).send("Product price is created successfully.")
    })
    .catch(err=>{
        res.status(500).send({message: err.message})
    })
  };

  exports.updateproductprice=(req,res)=>{
    MerchantProductPrice.update({        
        PriceA: req.body.PriceA,
        PriceB: req.body.PriceB,
        IsActive: req.body.IsActive,
        ActiveFrom: Date.parse(req.body.ActiveFrom),
        ActiveTo: req.body.ActiveTo==null?null: Date.parse(req.body.ActiveTo)
    },
    {
        where:{
            MerchantId: req.body.MerchantId,
            ProductId: req.body.ProductId,
            LicenseType: req.body.LicenseType,
            PriceType: req.body.PriceType,
            CurrencyCode: req.body.CurrencyCode,
        }
    })
    .then(()=>{
        res.status(200).send("Product price is updated successfully.")
    })
    .catch(err=>{
        res.status(500).send({message: err.message})
    })
  };

  exports.getproductprice=(req,res)=>{
    MerchantProductPrice.findAll({
          include:[{
            attributes:['ProductId','ProductName'],
            model:Product,            
            required: true
          }],         
          where:{
              ProductId:req.params.ProductId,
              IsActive:true
          }
      })
      .then(productprice=>{
        var pprices=[];
        for(let i=0;i<productprice.length;i++){
         var cmprice={
            MerchantId:productprice[i].MerchantId,
            ProductId:productprice[i].ProductId,
            ProductName:productprice[i].Product.ProductName,
            LicenseType:productprice[i].LicenseType,
            LicenseTypeName:LicenseType.filter(tt=>tt.id==productprice[i].LicenseType)[0].name,
            PriceType:productprice[i].PriceType,
            PriceTypeName:PriceType.filter(tt=>tt.id==productprice[i].PriceType)[0].name,
            CurrencyCode:productprice[i].CurrencyCode,
            ActiveFrom:productprice[i].ActiveFrom,
            ActiveTo:productprice[i].ActiveTo,
            PriceA:productprice[i].PriceA,
            PriceB:productprice[i].PriceB,
            IsActive: productprice[i].IsActive,
             
         }
         pprices.push(cmprice);
        }
        
        res.status(200).send(pprices);
      })
      .catch(err=>{
        res.status(500).send({message: err.message})
      })
  };

  exports.getproductpricebyid=(req,res)=>{
    MerchantProductPrice.findOne({
        where:{
            MerchantId: req.query.MerchantId,
            ProductId: req.query.ProductId,
            LicenseType: req.query.LicenseType,
            PriceType: req.query.PriceType,
            CurrencyCode: req.query.CurrencyCode
        }
    })
    .then(productprice=>{
      res.status(200).send(productprice);
    })
    .catch(err=>{
      res.status(500).send({message: err.message})
    })
  };

  exports.mapcategoryproduct=(req,res)=>{
    CategoryProduct.destroy({
        where:{
            ProductId:req.body.ProductId
        }
    }).then(()=>{
       
    });
    CategoryProduct.bulkCreate(req.body.catprdData)
    .then(()=>{
        res.status(200).send({message: "Category Product mapping is created successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
  };

  exports.GetProductCategory=(req,res)=>{
      Category.findAll(
          {
            attributes:['CategoryId','CategoryName'],
            include:[
                {
                    model:CategoryProduct,                   
                    required:false,
                    where:{
                        ProductId:req.params.ProductId,
                        IsActive:true
                    }
                }
            ],
            //required:false,
            where:{                         
                IsActive:true
            }
          }
      )
      .then(category=>{                           
            res.status(200).send(category);        
       })
       .catch(err => {
            res.status(500).send({ message: err.message });
       });
  };

  exports.mapmerchantproductbundle=(req,res)=>{
    MerchantProductBundles.destroy({
        where:{
            //MerchantId:req.body.MerchantId,
            BundleId:req.body.BundleId
        }
    }).then(()=>{
       
    });
    
    MerchantProductBundles.bulkCreate(req.body.merchantbundle)
    .then(()=>{
        res.status(200).send({message: "Merchant and ProductBundle is mapped successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
  };

  exports.getmerchantproductbundle=(req,res)=>{
    Merchants.findAll(
        {
          attributes:['MerchantId','MerchantCompany','MerchantAbbrName'],
          include:[
              {
                  model:MerchantProductBundles,                   
                  required:false,
                  where:{
                      BundleId:req.params.BundleId,
                      IsActive:true
                  }
              }
          ],
          //required:false,
          where:{                         
              IsActive:true
          }
        }
    )
   
    .then(prdbundle=>{
        res.status(200).send(prdbundle)
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
  }

  exports.createbundleprice=(req,res)=>{
    MerchantProductBundlePrices.create({
        MerchantId: req.body.MerchantId,
        BundleId: req.body.BundleId,
        LicenseType: req.body.LicenseType,
        PriceType: req.body.PriceType,
        CurrencyCode: req.body.CurrencyCode,
        PriceA: req.body.PriceA,
        PriceB: req.body.PriceB,
        IsActive: req.body.IsActive,
        ActiveFrom: req.body.ActiveFrom,
        ActiveTo: req.body.ActiveTo==null?null: req.body.ActiveTo,
        IsActive: req.body.IsActive
    })
    .then(()=>{
        res.status(200).send("Bundle price is created successfully.")
    })
    .catch(err=>{
        res.status(500).send({message: err.message})
    })
  };

  exports.updatebundleprice=(req,res)=>{
    MerchantProductBundlePrices.update({        
        PriceA: req.body.PriceA,
        PriceB: req.body.PriceB,
        IsActive: req.body.IsActive,
        ActiveFrom: Date.parse(req.body.ActiveFrom),
        ActiveTo: req.body.ActiveTo==null?null: Date.parse(req.body.ActiveTo)
    },
    {
        where:{
            MerchantId: req.body.MerchantId,
            BundleId: req.body.BundleId,
            LicenseType: req.body.LicenseType,
            PriceType: req.body.PriceType,
            CurrencyCode: req.body.CurrencyCode,
        }
    })
    .then(()=>{
        res.status(200).send("Bundle price is updated successfully.")
    })
    .catch(err=>{
        res.status(500).send({message: err.message})
    })
  };

  exports.getbundleprice=(req,res)=>{
    MerchantProductBundlePrices.findAll({
          include:[{
            attributes:['BundleId','BundleName'],
            model:ProductBundle,            
            required: true
          }],         
          where:{
              BundleId:req.params.BundleId,
              IsActive:true
          }
      })
      .then(bundleprice=>{
        var bprices=[];
        for(let i=0;i<bundleprice.length;i++){
         var cmprice={
            MerchantId:bundleprice[i].MerchantId,
            BundleId:bundleprice[i].BundleId,
            BundleName:bundleprice[i].ProductBundle.BundleName,
            LicenseType:bundleprice[i].LicenseType,
            LicenseTypeName:LicenseType.filter(tt=>tt.id==bundleprice[i].LicenseType)[0].name,
            PriceType:bundleprice[i].PriceType,
            PriceTypeName:PriceType.filter(tt=>tt.id==bundleprice[i].PriceType)[0].name,
            CurrencyCode:bundleprice[i].CurrencyCode,
            ActiveFrom:bundleprice[i].ActiveFrom,
            ActiveTo:bundleprice[i].ActiveTo,
            PriceA:bundleprice[i].PriceA,
            PriceB:bundleprice[i].PriceB,
            IsActive: bundleprice[i].IsActive,
             
         }
         bprices.push(cmprice);
        }
        
        res.status(200).send(bprices);
      })
      .catch(err=>{
        res.status(500).send({message: err.message})
      })
  };

  exports.getbundlepricebyid=(req,res)=>{
    MerchantProductBundlePrices.findOne({
        where:{
            MerchantId: req.query.MerchantId,
            BundleId: req.query.BundleId,
            LicenseType: req.query.LicenseType,
            PriceType: req.query.PriceType,
            CurrencyCode: req.query.CurrencyCode
        }
    })
    .then(bundleprice=>{
      res.status(200).send(bundleprice);
    })
    .catch(err=>{
      res.status(500).send({message: err.message})
    })
  };

  exports.GetBundleProduct=(req,res)=>{
      Product.findAll({
        attributes:['ProductId','ProductName'],
        include:[{                        
            model:ProductBundleProducts,            
            required: false,
            where:{
                BundleId:req.params.BundleId,
                IsActive:true
            }
          }],         
          
      })
      .then(bundleproduct=>{
        res.status(200).send(bundleproduct);
      })
      .catch(err=>{
        res.status(500).send({message: err.message})
      })
  };

  exports.MapProductBundleProducts=(req,res)=>{
    ProductBundleProducts.destroy({
        where:{
            BundleId:req.body.BundleId
        }
    }).then(()=>{
       
    });
    ProductBundleProducts.bulkCreate(req.body.bundleProducts)
    .then(()=>{
        res.status(200).send({message: "Products and ProductBundle is mapped successfully!"})
    })
    .catch(err=>{
        res.status(500).send({message: err.message});
    });
  };

  exports.GetProductsBundle=(req,res)=>{
    ProductBundle.findAll({
        attributes:['BundleId','BundleName'],
        include:[
            {
                model:ProductBundleProduct,
               // attributes:['BundleId','Prod'],
                where:{  
                    ProductId:req.params.ProductId,                  
                    IsActive:true
                }
            }
        ],
        where:{
            
            IsActive:true
        }
     })
     .then(bundleproduct=>{
        res.status(200).send(bundleproduct);
      })
      .catch(err=>{
        res.status(500).send({message: err.message})
      })
  };

  exports.getPublishStatus=(req,res)=>{    
    res.status(200).send(PublishStatus);
  };
  exports.getPublishStatusById=(req,res)=>{    
    res.status(200).send(PublishStatus.filter(tt=>tt.id==req.params.id));
  };

  exports.getProgramType=(req,res)=>{
    res.status(200).send(ProgramType);
  };

  exports.getProgramTypeById=(req,res)=>{
    res.status(200).send(ProgramType.filter(tt=>tt.id==req.params.id));
  };
  
 //End Meta key and Meta Group and Template section