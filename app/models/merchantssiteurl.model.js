module.exports=(sequelize,Sequelize)=>{
    const Merchantsiteurl=sequelize.define("MerchantsSiteUrl",{
        SiteNumber:{
          type:Sequelize.INTEGER,
          allowNull:false,
          primaryKey:true  
        },
        SiteURL:{
            type:Sequelize.STRING,
            allowNull:false
        },
        MerchantId:{
            type:Sequelize.INTEGER,
            allowNull:false,
            forienKey:true
        },
        IsActive:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:1
        }
    });
    return Merchantsiteurl;
};