module.exports= (sequelize, Sequelize) => {
    const MerchantProductPrice=sequelize.define("MerchantProductPrices", {
        MerchantId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            // autoIncrement: true
        },
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
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
            // get: function() {
            //     return moment(this.getDataValue('ActiveFrom')).format('DD.MM.YYYY')
            //  }
        },
        ActiveTo:{
            type: Sequelize.DATEONLY,
            // get: function() {
            //     return moment(this.getDataValue('ActiveTo')).format('DD.MM.YYYY')
            //  }
        }
        
    });
    return MerchantProductPrice;
};