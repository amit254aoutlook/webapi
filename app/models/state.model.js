module.exports=(sequelize,Sequelize)=>{
    const countrystate=sequelize.define("CountryStates", {
        StateId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        StateName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        StateAbbrName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        CountryId:{
            type: Sequelize.STRING,
            allowNull: false,
            foreignKey: true
        }
    });
    return countrystate;
}