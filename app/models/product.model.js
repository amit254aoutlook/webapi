
module.exports= (sequelize, Sequelize) => {
    const product=sequelize.define("Products", {
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        ProductType:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },        
        CompanyId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreinKey: true,
        },
        ProductName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        ProductUniqueCode:{
            type: Sequelize.STRING,
        },
        ProductUniqueName:{
            type: Sequelize.STRING,
        },
        ProductSummary:{
            type: Sequelize.STRING,
        },
        DisplayOrder:{
            type: Sequelize.INTEGER
        },
        IsFeatured:{
            type: Sequelize.INTEGER
        },
        IsActive:{
            type: Sequelize.INTEGER
        },
        PublishStatus:{
            type: Sequelize.INTEGER
        }
        
    });
    return product;
};