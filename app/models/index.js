const config = require("../config/db.config");
//const enumdata=require('./config/Enum.js');
//var sql = require("mssql");
const Sequelize = require("sequelize");

const sequelize = new Sequelize('CMS', 'sa', 'amit123', {  
  host: 'localhost',
  dialect: 'mssql',
  define: {
    timestamps: false
  },
  dialectOptions: {
    options: {
        encrypt: true,
    }
  }
});

// var connect = function() {
//   var conn=new sql.ConnectionPool({
//       user: 'sa',
//       password: 'amit123',
//       server: 'DESKTOP-C3C643B',
//       database: 'Books',
//       options:{
//           trustedconnection: true,
//           enableArithAbort: true,
//           instancename: 'MSSQLSERVER'
//       }
//   });
  
//   return conn;
// };



const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.User = require("./user.model.js")(sequelize, Sequelize);
db.Role = require("./role.model.js")(sequelize, Sequelize);
db.UserSession=require("./usersession.model.js")(sequelize, Sequelize);
db.Currency=require("./currency.model.js")(sequelize, Sequelize);
db.Country=require("./countries.model.js")(sequelize, Sequelize);
db.Countrystate=require("./state.model.js")(sequelize,Sequelize);
db.Company=require("./company.model.js")(sequelize,Sequelize);
db.Merchants=require("./merchant.model.js")(sequelize,Sequelize);
db.MerchantSiteUrl=require("./merchantssiteurl.model.js")(sequelize,Sequelize);
db.MerchantUserGroup=require("./merchantusergroup.model.js")(sequelize,Sequelize);
db.CategoryGroup=require("./categorygroup.model.js")(sequelize,Sequelize);
db.Category=require("./category.model.js")(sequelize,Sequelize);
db.CategoryType=require("./categorytype.model.js")(sequelize,Sequelize);
db.ProductBundle=require("./productbundle.model.js")(sequelize,Sequelize);
db.Product=require("./product.model.js")(sequelize,Sequelize);
db.MerchantProducts=require("./merchantproducts.model.js")(sequelize,Sequelize);
db.ContainerTemplates=require("./containertemplate.model.js")(sequelize,Sequelize);
db.MetaGroups=require("./metagroup.model.js")(sequelize,Sequelize);
db.MetaKeys=require("./metakey.model.js")(sequelize,Sequelize);
db.LookupGroups=require("./lookupgroup.model.js")(sequelize,Sequelize);
db.LookupValues=require("./lookupvalue.model.js")(sequelize,Sequelize);
db.ProductMetaData=require("./productmetadata.model.js")(sequelize,Sequelize);
db.MerchantProductPrice=require("./merchantproductprice.model.js")(sequelize,Sequelize);
db.categoryproduct=require("./categoryproduct.model.js")(sequelize,Sequelize);
db.merchantproductbundles=require("./merchantproductBundle.model.js")(sequelize,Sequelize);
db.merchantproductbundleprices=require("./merchantproductbundlesprice.model.js")(sequelize,Sequelize);
db.ProductBundleProduct=require("./productbundleproducts.model.js")(sequelize,Sequelize);
//db.UsersMerchantUserGroups=require("./usersmerchantusergroups.model.js")(sequelize,Sequelize);
//db.UserMetaData=require("./usermetadata.model.js")(sequelize.Sequelize);


// db.UserMetaData.belongsToMany(db.User,{
//   through:"UserMetaData",
//   foreignKey:"UserId",
//   otherKey:"MetaId"
// })

db.Product.belongsToMany(db.ProductBundle,{
    through:"ProductBundleProducts",
    foreignKey:"BundleId",
    otherKey: "ProductId"
});

db.ProductBundle.belongsToMany(db.Product,{
  through:"ProductBundleProducts",
  foreignKey:"ProductId",
  otherKey: "BundleId"
});

db.Role.belongsToMany(db.User, {
  through: "UserRole",
  foreignKey: "RoleId",
  otherKey: "UserId"
});

db.User.belongsToMany(db.Role, {
  through: "UserRole",
  foreignKey: "UserId",
  otherKey: "RoleId"
});

db.User.belongsToMany(db.MerchantUserGroup, {
  through: "UsersMerchantUserGroups",
  foreignKey: "UserId",    
 // otherKey: "MerchantId",
  otherKey:"UserGroupId"
});

db.MerchantUserGroup.belongsToMany(db.User,{
  through: "UsersMerchantUserGroups",  
  //foreignKey: "MerchantId",
  foreignKey: "UserGroupId",
  otherKey: "UserId"
});

db.CategoryGroup.hasMany(db.Category,{foreignKey: 'CategoryGroupId'});
db.Category.belongsTo(db.CategoryGroup,{foreignKey: 'CategoryGroupId'});

db.Merchants.hasMany(db.MerchantProducts,{foreignKey: 'MerchantId'});
db.MerchantProducts.belongsTo(db.Merchants,{foreignKey: 'MerchantId'});

db.Product.hasMany(db.MerchantProducts,{foreignKey: 'ProductId'});
db.MerchantProducts.belongsTo(db.Product,{foreignKey: 'ProductId'});

db.ContainerTemplates.hasMany(db.MetaKeys,{foreignKey:'TemplateId'});
db.MetaKeys.belongsTo(db.ContainerTemplates,{foreignKey:'TemplateId'});

db.MetaGroups.hasMany(db.MetaKeys,{foreignKey:'MetaGroupId'});
db.MetaKeys.belongsTo(db.MetaGroups,{foreignKey:'MetaGroupId'});

db.LookupGroups.hasMany(db.MetaKeys,{foreignKey:'LookupGroupId'});
db.MetaKeys.belongsTo(db.LookupGroups,{foreignKey:'LookupGroupId'})

db.LookupGroups.hasMany(db.LookupValues,{foreignKey:'LookupGroupId'});
db.LookupValues.belongsTo(db.LookupGroups,{foreignKey:'LookupGroupId'})

db.MetaKeys.hasMany(db.ProductMetaData,{foreignKey:'MetaId'});
db.ProductMetaData.belongsTo(db.MetaKeys,{foreignKey:'MetaId'});

db.Product.hasMany(db.MerchantProductPrice,{foreignKey:'ProductId'});
db.MerchantProductPrice.belongsTo(db.Product,{foreignKey:'ProductId'});

db.Category.hasMany(db.categoryproduct,{foreignKey:'CategoryId'});
db.categoryproduct.belongsTo(db.Category,{foreignKey:'CategoryId'});

db.Merchants.hasMany(db.merchantproductbundles,{foreignKey:'MerchantId'});
db.merchantproductbundles.belongsTo(db.Merchants,{foreignKey:'MerchantId'});

db.ProductBundle.hasMany(db.merchantproductbundleprices,{foreignKey:'BundleId'});
db.merchantproductbundleprices.belongsTo(db.ProductBundle,{foreignKey:'BundleId'});

db.Product.hasMany(db.ProductBundleProduct,{foreignKey:'ProductId'});
db.ProductBundleProduct.belongsTo(db.Product,{foreignKey:'ProductId'});

db.ProductBundle.hasMany(db.ProductBundleProduct,{foreignKey:'BundleId'});
db.ProductBundleProduct.belongsTo(db.ProductBundle,{foreignKey:'BundleId'});
// db.ProductMetaData.hasMany(db.MetaKeys,{foreignKey:'MetaId'});
// db.MetaKeys.belongsTo(db.ProductMetaData,{foreignKey:'MetaId'});
// db.Merchants.belongsToMany(db.Product, {
//   through: 'MerchantProducts',
//   foreignKey: 'MerchantId',
//   //otherKey: 'ProductId'
// });

// db.Product.belongsToMany(db.Merchants, {
//   through: 'MerchantProducts',
//   foreignKey: 'ProductId',
//   //otherKey: 'MerchantId'
// });

// db.User.belongsToMany(db.MerchantUserGroup, {
//   through: "UsersMerchantUserGroups",
//   foreignKey: "UserId",    
//   //otherKey: "MerchantId",
//   otherKey: "UserGroupId"
// });




db.Roles = ["User", "Admin", "Moderator" ];

db.TemplateTypes= [
  {name:"Product", id: 1},
  {name:"Post", id: 2},
  {name:"User", id: 3},
  {name:"Course", id:4}
]


db.KeyControlType=[
  {name:"Textbox", id: 1},
  {name:"TextArea", id: 2},
  {name:"DropdownList", id: 3},
  {name:"ListBox", id:4},
  {name:"RadioButtonList", id:5},
  {name:"CheckboxList", id:6},
  {name:"Checkbox", id:7},
  {name:"HTML", id:8}
]

db.KeyDataType=[
{name:"Text",id:1},
{name:"Number",id:2},
{name:"Date",id:3},
{name:"Boolean",id:4}
]

db.PostType=[
{name:"Post", id: 1},
{name:"Page", id: 2},
{name:"EmailTemplate" , id:3},
{name:"PostVersion" , id:4},
{name:"PageVersion" , id:5},
{name:"EmailTemplateVersion" , id:6},
{name:"Sidebar", id: 7},
{name:"DeckTopic" , id:8},
{name:"DeckCard" , id:9},
{name:"DeckCardVersion" , id:10}
]

db.LicenseType=[
  {name:"1 Year", id: 1},
  {name:"1 Weak", id: 2},
  {name:"1 Month", id: 3},
  {name:"1 Quater", id: 4},
  {name:"6 Months", id: 5}
]

db.PriceType=[
  {name:"Regular", id: 1},
  {name:"Special", id: 2}
]

db.PromoCodeType=[
  {name:"Percent", id: 1},
  {name:"Value", id: 2},
  {name:"SpecialPrice", id: 3}
]

db.PublishStatus=[
  {name:"Published", id:1},
  //{name:"PendingReview", id:2},
  {name:"Draft", id:3},
  //{name:"NeedsUpdate", id:4},
  //{name:"ReadyToPublish", id:5} 
]

db.ProgramType=[
  {name:"SCORMPackage", id:1},
  {name:"PDF", id:2},
]

module.exports = db;