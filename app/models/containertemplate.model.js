module.exports= (sequelize, Sequelize) => {
    const containertemplate=sequelize.define("ContainerTemplates", {
        TemplateId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        TemplateName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        IsActive:{
            type: Sequelize.INTEGER
        },
        TemplateType:{
            type:   Sequelize.INTEGER,
            //values: ['1', '2', '3', '4'],
            values: ['Product', 'Post', 'User', 'Course'],
            //defaultValue: '1'
        }
    });
    return containertemplate;
};