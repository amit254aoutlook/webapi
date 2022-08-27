module.exports= (sequelize, Sequelize) => {
    const merchantproductbundles=sequelize.define("MerchantProductBundles", {
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
        IsActive:{
            type: Sequelize.INTEGER
        },
        ActiveFrom:{
            type: Sequelize.DATE,
            allowNull: false,
           // defaultValue: Sequelize.fn('now')
        },
        ActiveTo:{
            type: Sequelize.DATE,
            allowNull: true,
        }
    });
    return merchantproductbundles;
};