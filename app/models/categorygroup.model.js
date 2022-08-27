module.exports= (sequelize, Sequelize) => {
    const categorygroup=sequelize.define("CategoryGroups", {
        CategoryGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryGroupName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        IsActive:{
            type: Sequelize.INTEGER
        }
    });
    return categorygroup;
};