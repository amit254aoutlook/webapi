module.exports=(sequelize,Sequelize)=>{
    const Merchant=sequelize.define("Merchants",{
        MerchantId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        MerchantCompany:{
            type: Sequelize.STRING,
            allowNull: false
        },
        MerchantAbbrName:{
            type: Sequelize.STRING,
            allowNull: false
        },
        AddressLine1:{
            type: Sequelize.STRING
        },
        AddressLine2:{
            type: Sequelize.STRING
        },
        AddressLine3:{
            type: Sequelize.STRING
        },
        City:{
            type: Sequelize.STRING
        },
        StateId:{
            type: Sequelize.INTEGER
        },
        CountryId:{
            type: Sequelize.INTEGER
        },
        ZipCode:{
            type: Sequelize.STRING 
        },
        MerchantHomePage:{
            type: Sequelize.STRING 
        },
        MerchantRegistrationPage:{
            type: Sequelize.STRING 
        },
        InvoicePrefix:{
            type: Sequelize.STRING 
        },
        LogoPath:{
            type: Sequelize.STRING 
        },
        MobileLogoPath:{
            type: Sequelize.STRING 
        },
        InternalLogoPath:{
            type: Sequelize.STRING 
        },
        SiteTitle:{
            type: Sequelize.STRING 
        },
        SiteDescription:{
            type: Sequelize.STRING 
        },
        AllowUserRegistration:{
            type:Sequelize.INTEGER
        },
        DateFormat:{
            type:Sequelize.STRING
        },
        TimeZoneOffset:{
            type:Sequelize.STRING
        },
        IsActive:{
            type:Sequelize.INTEGER
        },
        ActiveFrom:{
            type: Sequelize.DATEONLY,
            allowNull: false,
            defaultValue:  sequelize.fn('GETDATE')
        },
        PaymentGatewayURL:{
            type:Sequelize.STRING
        },
        ShoppingCartURL:{
            type:Sequelize.STRING
        },
        PaymentGatewayAPIURL:{
            type:Sequelize.STRING
        },
        PaymentGatewayAPIUsername:{
            type:Sequelize.STRING
        },
        PaymentGatewayAPIPassword:{
            type:Sequelize.STRING
        },
        PaymentGatewaySecretPassword:{
            type:Sequelize.STRING
        },
        PaymentGatewayResponseURL:{
            type:Sequelize.STRING
        },
        DefaultCurrencyId:{
            type:Sequelize.STRING
        },
        eLearningPassingScore:{
            type:Sequelize.INTEGER
        },
        EmailTemplatesPostId:{
            type:Sequelize.INTEGER
        },
        SupportECommerce:{
            type:Sequelize.INTEGER
        },
        SupportMultiplePrices:{
            type:Sequelize.INTEGER
        },
        BrandLogoPath:{
            type:Sequelize.STRING
        },
        PublicKey:{
            type:Sequelize.STRING
        },
        SSOReturnURL:{
            type:Sequelize.STRING
        },
        SSOLogoutURL:{
            type:Sequelize.STRING
        },
        FreeTrialProductUniqueCode:{
            type:Sequelize.STRING
        },
        NotificationsEmailAddress:{
            type:Sequelize.STRING
        }
    });
    return Merchant;
};