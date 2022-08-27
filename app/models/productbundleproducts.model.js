module.exports= (sequelize, Sequelize) => {
    const ProductBundleProduct=sequelize.define("ProductBundleProducts", {       
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
        },        
        BundleId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            //foreinKey: true,
        },       
        IsActive:{
            type: Sequelize.INTEGER
        }
        
    });
    return ProductBundleProduct;
};