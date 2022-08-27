module.exports= (sequelize, Sequelize) => {
    const LookupGroup=sequelize.define("LookupGroups", {
        LookupGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        LookupGroupName:{
            type: Sequelize.STRING,
            allowNull: false,
        },       
        IsActive:{
            type: Sequelize.INTEGER
        }
       
    });
    return LookupGroup;
};