
module.exports= (sequelize, Sequelize) => {
    const productbundles=sequelize.define("ProductBundles", {
        BundleId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        BundleName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        IsCompanyBundle:{
            type: Sequelize.INTEGER
        },
        CompanyId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreinKey: true,
        },
        CreatorMerchantId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreinKey: true,
        },
        IsActive:{
            type: Sequelize.INTEGER
        },
        DisplayOrder:{
            type: Sequelize.INTEGER
        }
    });
    return productbundles;
};