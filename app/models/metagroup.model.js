module.exports= (sequelize, Sequelize) => {
    const MetaGroup=sequelize.define("MetaGroups", {
        MetaGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        MetaGroupName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        DisplayOrder:{
            type:   Sequelize.INTEGER
        },
        IsActive:{
            type: Sequelize.INTEGER
        }
       
    });
    return MetaGroup;
};