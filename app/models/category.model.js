module.exports= (sequelize, Sequelize) => {
    const category=sequelize.define("Categories", {
        CategoryId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        CategoryType:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        CategoryGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreignKey:true
        },
        IsActive:{
            type: Sequelize.INTEGER
        }
    });
    return category;
};