module.exports= (sequelize, Sequelize) => {
    const MetaKey=sequelize.define("MetaKeys", {
        MetaId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        MetaGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreinKey: true,
        },
        KeyName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        KeyDisplay:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        TemplateId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreinKey: true,
        },
        KeyControlType:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        KeyDataType:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        DefaultValue:{
            type: Sequelize.STRING
        },
        Mandatory:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        DisplayOrder:{
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        MaxLength:{
            type: Sequelize.INTEGER,
        },
        IsActive:{
            type: Sequelize.INTEGER
        },
        LookupGroupId:{
            type: Sequelize.INTEGER,
            foreinKey: true,
            allowNull: true
        },
        ConditionalMetaId:{
            type: Sequelize.INTEGER
        },
        ConditionalMetaValue:{
            type: Sequelize.STRING
        }
    });
    return MetaKey;
};