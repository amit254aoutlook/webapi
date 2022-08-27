module.exports= (sequelize, Sequelize) => {
    const merchantproductbundleprices=sequelize.define("MerchantProductBundlePrices", {
        MerchantId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        BundleId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },  
        LicenseType:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            //foreinKey: true,
        },
        PriceType:{
            type: Sequelize.INTEGER,
            allowNull: false,            
            primaryKey: true,
        },
        CurrencyCode:{
            type: Sequelize.STRING,
            allowNull: false,
            primaryKey: true,
        },
        PriceA:{
            type: Sequelize.DECIMAL(10,2),
            allowNull: false,
        },
        PriceB:{
            type: Sequelize.DECIMAL(10,2),
        },              
        IsActive:{
            type: Sequelize.INTEGER
        },
        ActiveFrom:{
            type: Sequelize.DATEONLY,
            allowNull: false,
           // defaultValue: Sequelize.fn('now')
        },
        ActiveTo:{
            type: Sequelize.DATEONLY,
            allowNull: true,
        }
    });
    return merchantproductbundleprices;
};