USE [CMS]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/12/2021 5:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[CategoryType] [int] NOT NULL,
	[CategoryGroupId] [bigint] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryGroups]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryGroups](
	[CategoryGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryGroupName] [varchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_CategoryGroups_IsActive]  DEFAULT ((1)),
	[LastUpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_CategoryGroups_LastUpdatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_CategoryGroups] PRIMARY KEY CLUSTERED 
(
	[CategoryGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryProducts]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProducts](
	[CategoryId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_CategoryProducts_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_CategoryProducts_1] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryTypes]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTypes](
	[CategoryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [varchar](200) NOT NULL,
	[IsActive] [smallint] NOT NULL CONSTRAINT [DF_CategoryTypes_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_CategoryTypes] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](200) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContainerTemplates]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContainerTemplates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_ContainerTemplates_IsActive]  DEFAULT ((1)),
	[TemplateType] [smallint] NULL,
 CONSTRAINT [PK_ContainerTemplates] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [varchar](2) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CountryAbbrName] [varchar](50) NULL,
	[CurrencyId] [varchar](3) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryStates]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryStates](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[StateAbbrName] [varchar](50) NOT NULL,
	[CountryId] [varchar](2) NOT NULL,
 CONSTRAINT [PK_CountryStates] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currencies](
	[CurrencyId] [varchar](3) NOT NULL,
	[CurrencyName] [varchar](50) NOT NULL,
	[CurrencySymbol] [nvarchar](1) NULL,
	[CurrencyFont] [varchar](45) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Country] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ImagePath] [varchar](200) NOT NULL,
	[ImageName] [varchar](200) NOT NULL,
	[ImageAltText] [varchar](200) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookupGroups]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookupGroups](
	[LookupGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[LookupGroupName] [varchar](100) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_LookupGroups_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LookupGroups] PRIMARY KEY CLUSTERED 
(
	[LookupGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LookupValues]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookupValues](
	[LookupGroupId] [bigint] NOT NULL,
	[LookupDisplay] [varchar](100) NOT NULL,
	[LookupDataValue] [varchar](100) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_LookupValues_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LookupValues] PRIMARY KEY CLUSTERED 
(
	[LookupGroupId] ASC,
	[LookupDataValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantProductBundlePrices]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantProductBundlePrices](
	[MerchantId] [int] NOT NULL,
	[BundleId] [bigint] NOT NULL,
	[LicenseType] [smallint] NOT NULL,
	[PriceType] [smallint] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[PriceA] [decimal](10, 4) NOT NULL,
	[PriceB] [decimal](10, 4) NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_MerchantProductBundlePrices] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[BundleId] ASC,
	[LicenseType] ASC,
	[PriceType] ASC,
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantProductBundles]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantProductBundles](
	[MerchantId] [int] NOT NULL,
	[BundleId] [bigint] NOT NULL,
	[IsActive] [smallint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_MerchantProductBundles_ActiveFrom]  DEFAULT (getdate()),
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_MerchantProductBundles] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[BundleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantProductPrices]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantProductPrices](
	[MerchantId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[LicenseType] [smallint] NOT NULL,
	[PriceType] [smallint] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[PriceA] [decimal](10, 4) NOT NULL,
	[PriceB] [decimal](10, 4) NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_MerchantProductPrices_IsActive]  DEFAULT ((1)),
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_MerchantProductPrices_ActiveFrom]  DEFAULT (getdate()),
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_MerchantProductPrices] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[ProductId] ASC,
	[LicenseType] ASC,
	[PriceType] ASC,
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantProducts]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantProducts](
	[MerchantId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[CPDHours] [float] NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_MerchantProducts_IsActive]  DEFAULT ((1)),
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_MerchantProducts_ActiveFrom]  DEFAULT (getdate()),
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_MerchantProducts] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantProductSubscriptions]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantProductSubscriptions](
	[MerchantId] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[SubscriptionNumber] [int] NOT NULL,
	[SubscriptionDate] [datetime] NULL,
	[OrderNumber] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[ActiveTo] [datetime] NOT NULL,
 CONSTRAINT [PK_MerchantProductSubscriptions] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[ProductId] ASC,
	[UserId] ASC,
	[SubscriptionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Merchants](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantCompany] [varchar](500) NOT NULL,
	[MerchantAbbrName] [varchar](200) NOT NULL,
	[AddressLine1] [varchar](500) NULL,
	[AddressLine2] [varchar](500) NULL,
	[AddressLine3] [varchar](500) NULL,
	[City] [varchar](50) NULL,
	[StateId] [int] NULL,
	[CountryId] [varchar](2) NULL,
	[ZipCode] [varchar](10) NULL,
	[MerchantHomePage] [varchar](200) NULL,
	[MerchantRegistrationPage] [varchar](200) NULL,
	[InvoicePrefix] [varchar](3) NULL,
	[LogoPath] [varchar](150) NULL,
	[MobileLogoPath] [varchar](150) NULL,
	[InternalLogoPath] [varchar](150) NULL,
	[SiteTitle] [varchar](100) NULL,
	[SiteDescription] [varchar](500) NULL,
	[AllowUserRegistration] [tinyint] NULL,
	[DateFormat] [varchar](50) NULL,
	[TimeZoneOffset] [varchar](50) NULL,
	[TemplateTheme] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_Merchants_IsActive]  DEFAULT ((1)),
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_Merchants_ActiveFrom]  DEFAULT (getdate()),
	[PaymentGatewayURL] [varchar](1000) NULL,
	[ShoppingCartURL] [varchar](1000) NULL,
	[PaymentGatewayAPIURL] [varchar](1000) NULL,
	[PaymentGatewayAPIUsername] [varchar](50) NULL,
	[PaymentGatewayAPIPassword] [varchar](50) NULL,
	[PaymentGatewaySecretPassword] [varchar](50) NULL,
	[PaymentGatewayResponseURL] [varchar](1000) NULL,
	[DefaultCurrencyId] [varchar](3) NULL,
	[eLearningPassingScore] [smallint] NULL,
	[EmailTemplatesPostId] [bigint] NULL,
	[SupportECommerce] [tinyint] NOT NULL CONSTRAINT [DF_Merchants_SupportECommerce]  DEFAULT ((0)),
	[SupportMultiplePrices] [tinyint] NOT NULL CONSTRAINT [DF_Merchants_SupportMultiplePrices]  DEFAULT ((0)),
	[BrandLogoPath] [varchar](150) NULL,
	[EnableSingleSignOn] [tinyint] NULL,
	[PublicKey] [varchar](3000) NULL,
	[SSOReturnURL] [varchar](1000) NULL,
	[SSOLogoutURL] [varchar](1000) NULL,
	[FreeTrialProductUniqueCode] [varchar](50) NULL,
	[NotificationsEmailAddress] [varchar](100) NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantsSiteUrl]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantsSiteUrl](
	[SiteNumber] [int] IDENTITY(1,1) NOT NULL,
	[SiteURL] [varchar](200) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
 CONSTRAINT [PK_MerchantsSiteUrl] PRIMARY KEY CLUSTERED 
(
	[SiteNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantsSiteUrls]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantsSiteUrls](
	[SiteNumber] [int] NOT NULL,
	[SiteURL] [nvarchar](255) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantUserGroups]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantUserGroups](
	[MerchantId] [int] NOT NULL,
	[UserGroupId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupName] [varchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_UsersMerchantUserGroups1_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_UsersMerchantUserGroups1] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MetaGroups]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MetaGroups](
	[MetaGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaGroupName] [varchar](150) NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_MetaGroups_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_MetaGroups] PRIMARY KEY CLUSTERED 
(
	[MetaGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MetaKeys]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MetaKeys](
	[MetaId] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaGroupId] [bigint] NOT NULL,
	[KeyName] [varchar](50) NOT NULL,
	[KeyDisplay] [varchar](500) NOT NULL,
	[TemplateId] [int] NOT NULL,
	[KeyControlType] [smallint] NOT NULL,
	[KeyDataType] [smallint] NOT NULL,
	[DefaultValue] [varchar](max) NULL,
	[Mandatory] [tinyint] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[MaxLength] [smallint] NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_MetaKeys_IsActive]  DEFAULT ((1)),
	[LookupGroupId] [bigint] NULL CONSTRAINT [DF_MetaKeys_LookupGroupId]  DEFAULT (NULL),
	[ConditionalMetaId] [bigint] NULL,
	[ConditionalMetaValue] [varchar](max) NULL,
 CONSTRAINT [PK_MetaKeys] PRIMARY KEY CLUSTERED 
(
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrganizationMerchants]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationMerchants](
	[OrgId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganizationMerchants_1] PRIMARY KEY CLUSTERED 
(
	[OrgId] ASC,
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizations](
	[OrgId] [int] IDENTITY(1,1) NOT NULL,
	[OrgName] [varchar](200) NOT NULL,
	[OrgAbbrName] [varchar](200) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[IsMarketPlace] [tinyint] NOT NULL,
	[DefaultMerchantId] [int] NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[OrgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostMetaData]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostMetaData](
	[PostId] [bigint] NOT NULL,
	[MetaId] [bigint] NOT NULL,
	[MetaValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PostMetaData_1] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostResources]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostResources](
	[PostId] [bigint] NOT NULL,
	[ResourceId] [bigint] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PostResources] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthorUserId] [int] NOT NULL,
	[ApproverUserId] [int] NULL,
	[PostDate] [datetime] NOT NULL,
	[PostTitle] [varchar](1000) NOT NULL,
	[PostContent] [varchar](max) NOT NULL,
	[PostExcerptSEO] [varchar](500) NULL,
	[PostSummary] [varchar](max) NULL,
	[PostLayout] [varchar](100) NULL,
	[PublishStatus] [smallint] NOT NULL,
	[PostUniqueName] [varchar](1000) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[Version] [varchar](45) NOT NULL,
	[PostParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[PostType] [smallint] NOT NULL,
	[ThumbnailImageId] [bigint] NULL,
	[Sidebar] [varchar](100) NULL,
	[SidebarPosition] [varchar](50) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostsContainerTemplates]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsContainerTemplates](
	[PostId] [bigint] NOT NULL,
	[TemplateId] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
 CONSTRAINT [PK_PostsContainerTemplates] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductBundleProducts]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBundleProducts](
	[BundleId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_ProductBundleProducts_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_ProductBundleProducts] PRIMARY KEY CLUSTERED 
(
	[BundleId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductBundles]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductBundles](
	[BundleId] [bigint] IDENTITY(1,1) NOT NULL,
	[BundleName] [varchar](200) NOT NULL,
	[IsCompanyBundle] [tinyint] NOT NULL CONSTRAINT [DF_ProductBundles_IsCompanyBundle]  DEFAULT ((1)),
	[CompanyId] [int] NULL,
	[CreatorMerchantId] [int] NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_ProductBundles_IsActive]  DEFAULT ((1)),
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_ProductBundles_DisplayOrder]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductBundles] PRIMARY KEY CLUSTERED 
(
	[BundleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductMetaData]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMetaData](
	[ProductId] [bigint] NOT NULL,
	[MetaId] [bigint] NOT NULL,
	[MetaValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductMetaData_1] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductType] [smallint] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[ProductUniqueCode] [varchar](50) NULL,
	[ProductUniqueName] [varchar](100) NULL,
	[ProductSummary] [varchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[IsFeatured] [tinyint] NULL CONSTRAINT [DF_Products_IsFeatured]  DEFAULT ((0)),
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_Products_IsActive]  DEFAULT ((1)),
	[PublishStatus] [smallint] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Products_LastUpdatedOn]  DEFAULT (getdate()),
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_Products_ActiveFrom]  DEFAULT (getdate()),
	[ActiveTo] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceType] [smallint] NOT NULL,
	[ResourceName] [varchar](100) NOT NULL,
	[ResourceDisplayText] [varchar](200) NOT NULL,
	[ResourcePath] [varchar](1000) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Resources_1] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedDate] [datetime] NULL,
	[IsActive] [smallint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentScore]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentScore](
	[Student_ID] [int] NOT NULL,
	[Student_Name] [nvarchar](50) NULL,
	[Student_Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Templates]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Templates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](50) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[TemplateType] [smallint] NULL,
 CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMetaData]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMetaData](
	[UserId] [int] NOT NULL,
	[MetaId] [bigint] NOT NULL,
	[MetaValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_UserMetaData] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[MetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedDate] [datetime] NULL,
	[IsActive] [smallint] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Address1] [nvarchar](500) NOT NULL,
	[Address2] [nvarchar](500) NULL,
	[City] [varchar](50) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [varchar](2) NOT NULL,
	[IsActive] [smallint] NOT NULL CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)),
	[ActiveFrom] [datetime] NOT NULL CONSTRAINT [DF_Users_ActiveFrom]  DEFAULT (getdate()),
	[PasswordChangeDate] [datetime] NOT NULL CONSTRAINT [DF_Users_PasswordChangeDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Users1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSessions]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSessions](
	[UserId] [int] NOT NULL,
	[SessionId] [varchar](50) NOT NULL,
	[LoginDateTime] [datetime] NOT NULL,
	[LastActiveDateTime] [datetime] NOT NULL,
	[LogoutDateTime] [datetime] NULL,
	[SessionStatus] [smallint] NULL,
	[IPAddress] [varchar](50) NOT NULL,
	[Browser] [varchar](50) NOT NULL,
	[OS] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserSessions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersMerchantUserGroups]    Script Date: 3/12/2021 5:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersMerchantUserGroups](
	[UserId] [int] NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL CONSTRAINT [DF_UsersMerchantUserGroups_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_UsersMerchantUserGroups] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (2, N'Anatomy & Physiology', 3, 2, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (3, N'Disease Management', 3, 2, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (4, N'Business Acumen', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (5, N'Cardiology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (6, N'Cardiovascular System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (7, N'Consumer Health', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (8, N'Dermatology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (9, N'Education', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (10, N'Digestive System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (11, N'Disease Management', 3, 2, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (12, N'Endocrine System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (13, N'Endocrinology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (14, N'Fundamentals', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (15, N'Gastroenterology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (16, N'Hematology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (17, N'Immune System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (18, N'Immunology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (19, N'Immunology – Infectious Diseases', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (20, N'Integumentary System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (21, N'Medical Procedures', 3, 2, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (22, N'Musculoskeletal System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (23, N'Nervous System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (24, N'Neurology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (25, N'Neurology – Psychiatry', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (26, N'Nutrition', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (27, N'Oncology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (28, N'Ophthalmology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (29, N'Professional Services', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (30, N'Reproductive Health', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (31, N'Reproductive System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (32, N'Respiratory', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (33, N'Respiratory System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (34, N'Rheumatology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (35, N'Rheumatology – Orthopedics', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (36, N'The Biomedical and Pharmaceutical Industry', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (37, N'The Blood', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (38, N'Urinary System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (39, N'Urology', 3, 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (40, N'Visual System', 3, 3, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryType], [CategoryGroupId], [IsActive]) VALUES (10004, N'', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[CategoryGroups] ON 

INSERT [dbo].[CategoryGroups] ([CategoryGroupId], [CategoryGroupName], [IsActive], [LastUpdatedOn]) VALUES (1, N'Browse by Therapeutic Area', 1, CAST(N'2020-10-23 17:25:44.520' AS DateTime))
INSERT [dbo].[CategoryGroups] ([CategoryGroupId], [CategoryGroupName], [IsActive], [LastUpdatedOn]) VALUES (2, N'Browse by Specialty', 1, CAST(N'2020-12-08 21:51:58.510' AS DateTime))
INSERT [dbo].[CategoryGroups] ([CategoryGroupId], [CategoryGroupName], [IsActive], [LastUpdatedOn]) VALUES (3, N'Browse By Body System', 1, CAST(N'2020-12-08 21:57:36.580' AS DateTime))
INSERT [dbo].[CategoryGroups] ([CategoryGroupId], [CategoryGroupName], [IsActive], [LastUpdatedOn]) VALUES (4, N'Production', 0, CAST(N'2020-12-08 21:58:06.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoryGroups] OFF
INSERT [dbo].[CategoryProducts] ([CategoryId], [ProductId], [IsActive]) VALUES (2, 2, 1)
INSERT [dbo].[CategoryProducts] ([CategoryId], [ProductId], [IsActive]) VALUES (3, 2, 1)
INSERT [dbo].[CategoryProducts] ([CategoryId], [ProductId], [IsActive]) VALUES (31, 2, 1)
SET IDENTITY_INSERT [dbo].[CategoryTypes] ON 

INSERT [dbo].[CategoryTypes] ([CategoryTypeId], [CategoryType], [IsActive]) VALUES (1, N'Post', 1)
INSERT [dbo].[CategoryTypes] ([CategoryTypeId], [CategoryType], [IsActive]) VALUES (2, N'Page', 1)
INSERT [dbo].[CategoryTypes] ([CategoryTypeId], [CategoryType], [IsActive]) VALUES (3, N'Product', 1)
INSERT [dbo].[CategoryTypes] ([CategoryTypeId], [CategoryType], [IsActive]) VALUES (4, N'Deck', 1)
SET IDENTITY_INSERT [dbo].[CategoryTypes] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [IsActive]) VALUES (1, N'Ebix Inc', 1)
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName], [IsActive]) VALUES (1, N'Ebix Inc', 1)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[ContainerTemplates] ON 

INSERT [dbo].[ContainerTemplates] ([TemplateId], [TemplateName], [IsActive], [TemplateType]) VALUES (1, N'Program Templates', 1, 1)
INSERT [dbo].[ContainerTemplates] ([TemplateId], [TemplateName], [IsActive], [TemplateType]) VALUES (2, N'Email Templates', 1, 2)
INSERT [dbo].[ContainerTemplates] ([TemplateId], [TemplateName], [IsActive], [TemplateType]) VALUES (3, N'AOD Template', 1, 3)
SET IDENTITY_INSERT [dbo].[ContainerTemplates] OFF
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AD', N'Andorra', N'AND', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AE', N'United Arab Emirates', N'ARE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AF', N'Afghanistan', N'AFG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AG', N'Antigua and Barbuda', N'ATG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AI', N'Anguilla', N'AIA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AL', N'Albania', N'ALB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AM', N'Armenia', N'ARM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AO', N'Angola', N'AGO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AQ', N'Antarctica', N'ATA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AR', N'Argentina', N'ARG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AS', N'American Samoa', N'ASM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AT', N'Austria', N'AUT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AU', N'Australia', N'AUS', N'AUD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AW', N'Aruba', N'ABW', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AX', N'Aland Islands', N'ALA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'AZ', N'Azerbaijan', N'AZE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BA', N'Bosnia and Herzegovina', N'BIH', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BB', N'Barbados', N'BRB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BD', N'Bangladesh', N'BGD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BE', N'Belgium', N'BEL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BF', N'Burkina Faso', N'BFA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BG', N'Bulgaria', N'BGR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BH', N'Bahrain', N'BHR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BI', N'Burundi', N'BDI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BJ', N'Benin', N'BEN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BL', N'Saint Barthalemy', N'BLM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BM', N'Bermuda', N'BMU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BN', N'Brunei Darussalam', N'BRN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BO', N'Bolivia', N'BOL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BQ', N'Bonaire', N'BES', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BR', N'Brazil', N'BRA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BS', N'Bahamas', N'BHS', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BT', N'Bhutan', N'BTN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BV', N'Bouvet Island', N'BVT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BW', N'Botswana', N'BWA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BY', N'Belarus', N'BLR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'BZ', N'Belize', N'BLZ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CA', N'Canada', N'CAN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CC', N'Cocosselect Keeling) Islands', N'CCK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CD', N'Democratic Republic of the Congo', N'COD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CF', N'Central African Republic', N'CAF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CG', N'Congo', N'COG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CH', N'Switzerland', N'CHE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CI', N'Côte dIvoire', N'CIV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CK', N'Cook Islands', N'COK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CL', N'Chile', N'CHL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CM', N'Cameroon', N'CMR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CN', N'China', N'CHN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CO', N'Colombia', N'COL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CR', N'Costa Rica', N'CRI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CU', N'Cuba', N'CUB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CV', N'Cape Verde', N'CPV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CW', N'Curaçao', N'CUW', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CX', N'Christmas Island', N'CXR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CY', N'Cyprus', N'CYP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'CZ', N'Czech Republic', N'CZE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DE', N'Germany', N'DEU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DJ', N'Djibouti', N'DJI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DK', N'Denmark', N'DNK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DM', N'Dominica', N'DMA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DO', N'Dominican Republic', N'DOM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'DZ', N'Algeria', N'DZA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'EC', N'Ecuador', N'ECU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'EE', N'Estonia', N'EST', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'EG', N'Egypt', N'EGY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ER', N'Eritrea', N'ERI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ES', N'Spain', N'ESP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ET', N'Ethiopia', N'ETH', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'FI', N'Finland', N'FIN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'FJ', N'Fiji', N'FJI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'FM', N'Micronesia Federated States of', N'FSM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'FO', N'Faroe Islands', N'FRO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'FR', N'France', N'FRA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GA', N'Gabon', N'GAB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GB', N'United Kingdom', N'GBR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GD', N'Grenada', N'GRD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GE', N'Georgia', N'GEO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GF', N'French Guiana', N'GUF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GH', N'Ghana', N'GHA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GI', N'Gibraltar', N'GIB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GL', N'Greenland', N'GRL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GM', N'Gambia', N'GMB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GN', N'Guinea', N'GIN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GP', N'Guadeloupe', N'GLP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GQ', N'Equatorial Guinea', N'GNQ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GR', N'Greece', N'GRC', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GT', N'Guatemala', N'GTM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GU', N'Guam', N'GUM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GW', N'Guinea-Bissau', N'GNB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'GY', N'Guyana', N'GUY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'HK', N'Hong Kong', N'HKG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'HN', N'Honduras', N'HND', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'HR', N'Croatia', N'HRV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'HT', N'Haiti', N'HTI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'HU', N'Hungary', N'HUN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ID', N'Indonesia', N'IDN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IE', N'Ireland', N'IRL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IL', N'Israel', N'ISR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IM', N'Isle of Man', N'IMN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IN', N'India', N'IND', N'INR')
GO
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IO', N'British Indian Ocean Territory', N'IOT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IQ', N'Iraq', N'IRQ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IR', N'Iran Islamic Republic of', N'IRN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IS', N'Iceland', N'ISL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'IT', N'Italy', N'ITA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'JE', N'Jersey', N'JEY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'JM', N'Jamaica', N'JAM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'JO', N'Jordan', N'JOR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'JP', N'Japan', N'JPN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KE', N'Kenya', N'KEN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KG', N'Kyrgyzstan', N'KGZ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KH', N'Cambodia', N'KHM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KI', N'Kiribati', N'KIR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KM', N'Comoros', N'COM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KN', N'Saint Kitts and Nevis', N'KNA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KP', N'Korea Democratic Peoples Republic of', N'PRK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KR', N'Korea Republic of', N'KOR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KW', N'Kuwait', N'KWT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'KZ', N'Kazakhstan', N'KAZ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LA', N'Lao Peoples Democratic Republic', N'LAO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LB', N'Lebanon', N'LBN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LC', N'Saint Lucia', N'LCA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LI', N'Liechtenstein', N'LIE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LK', N'Sri Lanka', N'LKA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LR', N'Liberia', N'LBR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LS', N'Lesotho', N'LSO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LT', N'Lithuania', N'LTU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LU', N'Luxembourg', N'LUX', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LV', N'Latvia', N'LVA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'LY', N'Libya', N'LBY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MA', N'Morocco', N'MAR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MC', N'Monaco', N'MCO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MD', N'Moldova Republic of', N'MDA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ME', N'Montenegro', N'MNE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MG', N'Madagascar', N'MDG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MH', N'Marshall Islands', N'MHL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MK', N'Macedonia the Former Yugoslav Republic of', N'MKD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ML', N'Mali', N'MLI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MM', N'Myanmar', N'MMR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MN', N'Mongolia', N'MNG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MO', N'Macao', N'MAC', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MP', N'Northern Mariana Islands', N'MNP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MQ', N'Martinique', N'MTQ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MR', N'Mauritania', N'MRT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MS', N'Montserrat', N'MSR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MT', N'Malta', N'MLT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MU', N'Mauritius', N'MUS', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MV', N'Maldives', N'MDV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MW', N'Malawi', N'MWI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MX', N'Mexico', N'MEX', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MY', N'Malaysia', N'MYS', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'MZ', N'Mozambique', N'MOZ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NA', N'Namibia', N'NAM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NC', N'New Caledonia', N'NCL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NE', N'Niger', N'NER', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NF', N'Norfolk Island', N'NFK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NG', N'Nigeria', N'NGA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NI', N'Nicaragua', N'NIC', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NL', N'Netherlands', N'NLD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NO', N'Norway', N'NOR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NP', N'Nepal', N'NPL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NR', N'Nauru', N'NRU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NU', N'Niue', N'NIU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'NZ', N'New Zealand', N'NZL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'OM', N'Oman', N'OMN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PA', N'Panama', N'PAN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PE', N'Peru', N'PER', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PF', N'French Polynesia', N'PYF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PG', N'Papua New Guinea', N'PNG', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PH', N'Philippines', N'PHL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PK', N'Pakistan', N'PAK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PL', N'Poland', N'POL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PN', N'Pitcairn', N'PCN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PR', N'Puerto Rico', N'PRI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PS', N'Palestine State of', N'PSE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PT', N'Portugal', N'PRT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PW', N'Palau', N'PLW', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'PY', N'Paraguay', N'PRY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'QA', N'Qatar', N'QAT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'RE', N'Re union', N'REU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'RO', N'Romania', N'ROU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'RS', N'Serbia', N'SRB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'RU', N'Russian Federation', N'RUS', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'RW', N'Rwanda', N'RWA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SA', N'Saudi Arabia', N'SAU', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SB', N'Solomon Islands', N'SLB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SC', N'Seychelles', N'SYC', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SD', N'Sudan', N'SDN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SE', N'Sweden', N'SWE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SG', N'Singapore', N'SGP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SH', N'Saint Helena', N'SHN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SI', N'Slovenia', N'SVN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SJ', N'Svalbard and Jan Mayen', N'SJM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SK', N'Slovakia', N'SVK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SL', N'Sierra Leone', N'SLE', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SM', N'San Marino', N'SMR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SN', N'Senegal', N'SEN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SO', N'Somalia', N'SOM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SR', N'Suriname', N'SUR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SS', N'South Sudan', N'SSD', N'USD')
GO
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ST', N'Sao Tome and Principe', N'STP', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SV', N'El Salvador', N'SLV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SX', N'Sint Maarten', N'SXM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SY', N'Syrian Arab Republic', N'SYR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'SZ', N'Swaziland', N'SWZ', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TC', N'Turks and Caicos Islands', N'TCA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TD', N'Chad', N'TCD', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TF', N'French Southern Territories', N'ATF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TG', N'Togo', N'TGO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TH', N'Thailand', N'THA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TJ', N'Tajikistan', N'TJK', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TK', N'Tokelau', N'TKL', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TL', N'Timor-Leste', N'TLS', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TM', N'Turkmenistan', N'TKM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TN', N'Tunisia', N'TUN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TO', N'Tonga', N'TON', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TR', N'Turkey', N'TUR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TT', N'Trinidad and Tobago', N'TTO', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TV', N'Tuvalu', N'TUV', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TW', N'Taiwan Province of China', N'TWN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'TZ', N'United Republic of Tanzania', N'TZA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'UA', N'Ukraine', N'UKR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'UG', N'Uganda', N'UGA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'UM', N'United States Minor Outlying Islands', N'UMI', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'US', N'United States Of America', N'USA', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'UY', N'Uruguay', N'URY', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'UZ', N'Uzbekistan', N'UZB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VA', N'Holy See', N'VAT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VC', N'Saint Vincent and the Grenadines', N'VCT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VE', N'Venezuela', N'VEN', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VG', N'British Virgin Islands', N'VGB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VI', N'US Virgin Islands', N'VIR', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VN', N'VietNam', N'VNM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'VU', N'Vanuatu', N'VUT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'WF', N'Wallis and Futuna', N'WLF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'WS', N'Samoa', N'WSM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'YE', N'Yemen', N'YEM', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'YT', N'Mayotte', N'MYT', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ZA', N'South Africa', N'ZAF', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ZM', N'Zambia', N'ZMB', N'USD')
INSERT [dbo].[Countries] ([CountryId], [CountryName], [CountryAbbrName], [CurrencyId]) VALUES (N'ZW', N'Zimbabwe', N'ZWE', N'USD')
SET IDENTITY_INSERT [dbo].[CountryStates] ON 

INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (10, N'Alabama', N'AL', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (11, N'Alaska', N'AK', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (12, N'Arizona', N'AZ', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (13, N'Arkansas', N'AR', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (14, N'California', N'CA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (15, N'Colorado', N'CO', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (16, N'Connecticut', N'CT', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (17, N'Delaware', N'DE', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (18, N'Florida', N'FL', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (19, N'Georgia', N'GA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (20, N'Hawaii', N'HI', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (21, N'Idaho', N'ID', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (22, N'Illinois', N'IL', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (23, N'Indiana', N'IN', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (24, N'Iowa', N'IA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (25, N'Kansas', N'KS', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (26, N'Kentucky', N'KY', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (27, N'Louisiana', N'LA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (28, N'Maine', N'ME', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (29, N'Maryland', N'MD', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (30, N'Massachusetts', N'MA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (31, N'Michigan', N'MI', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (32, N'Minnesota', N'MN', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (33, N'Mississippi', N'MS', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (34, N'Missouri', N'MO', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (35, N'Montana', N'MT', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (36, N'Nebraska', N'NE', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (37, N'Nevada', N'NV', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (38, N'New Hampshire', N'NH', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (39, N'New Jersey', N'NJ', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (40, N'New Mexico', N'NM', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (41, N'New York', N'NY', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (42, N'North Carolina', N'NC', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (43, N'North Dakota', N'ND', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (44, N'Ohio', N'OH', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (45, N'Oklahoma', N'OK', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (46, N'Oregon', N'OR', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (47, N'Pennsylvania', N'PA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (48, N'Rhode Island', N'RI', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (49, N'South Carolina', N'SC', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (50, N'South Dakota', N'SD', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (51, N'Tennessee', N'TN', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (52, N'Texas', N'TX', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (53, N'Utah', N'UT', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (54, N'Vermont', N'VT', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (55, N'Virginia', N'VA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (56, N'Washington', N'WA', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (57, N'West Virginia', N'WV', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (58, N'Wisconsin', N'WI', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (59, N'Wyoming', N'WY', N'US')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (60, N'Canillo', N'C', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (61, N'Encamp', N'E', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (62, N'La Massana', N'LM', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (63, N'Ordino', N'OR', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (64, N'Sant Juli de Lria', N'SJ', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (65, N'Andorra la Vella', N'AV', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (66, N'Escaldes-Engordany', N'EE', N'AD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (67, N'Ajman', N'AJ', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (68, N'Abu Zaby [Abu Dhabi]', N'AZ', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (69, N'Dubayy [Dubai]', N'DU', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (70, N'Al Fujayrah', N'FU', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (71, N'Ras al Khaymah', N'RK', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (72, N'Ash Shariqah [Sharjah]', N'SH', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (73, N'Umm al Qaywayn', N'UQ', N'AE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (74, N'Balkh', N'BAL', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (75, N'Bamyan', N'BAM', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (76, N'Badghis', N'BDG', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (77, N'Badakhshan', N'BDS', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (78, N'Baghlan', N'BGL', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (79, N'Daykundi', N'DAY', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (80, N'Farah', N'FRA', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (81, N'Faryab', N'FYB', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (82, N'Ghazni', N'GHA', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (83, N'Ghor', N'GHO', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (84, N'Helmand', N'HEL', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (85, N'Herat', N'HER', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (86, N'Jowzjan', N'JOW', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (87, N'Kabul', N'KAB', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (88, N'Kandahar', N'KAN', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (89, N'Kapisa', N'KAP', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (90, N'Kunduz', N'KDZ', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (91, N'Khost', N'KHO', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (92, N'Kunar', N'KNR', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (93, N'Laghman', N'LAG', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (94, N'Logar', N'LOG', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (95, N'Nangarhar', N'NAN', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (96, N'Nimroz', N'NIM', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (97, N'Nuristan', N'NUR', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (98, N'Panjshayr', N'PAN', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (99, N'Parwan', N'PAR', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (100, N'Paktiya', N'PIA', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (101, N'Paktika', N'PKA', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (102, N'Samangan', N'SAM', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (103, N'Sar-e Pul', N'SAR', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (104, N'Takhar', N'TAK', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (105, N'Uruzgan', N'URU', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (106, N'Wardak', N'WAR', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (107, N'Zabul', N'ZAB', N'AF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (108, N'Saint George', N'SG', N'AG')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (109, N'Saint John', N'SJ', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (110, N'Saint Mary', N'SM', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (111, N'Saint Paul', N'SP', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (112, N'Saint Peter', N'SPT', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (113, N'Saint Philip', N'SPH', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (114, N'Barbuda', N'BRD', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (115, N'Redonda', N'RD', N'AG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (116, N'Berat', N'BR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (117, N'Bulqize', N'BU', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (118, N'Diber', N'DI', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (119, N'Delvine', N'DL', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (120, N'Durres', N'DR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (121, N'Devoll', N'DV', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (122, N'Elbasan', N'EL', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (123, N'Kolonje', N'ER', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (124, N'Fier', N'FR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (125, N'Gjirokaster', N'GJ', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (126, N'Gramsh', N'GR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (127, N'Has', N'HA', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (128, N'Kavaje', N'KA', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (129, N'Kurbin', N'KB', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (130, N'Kucove', N'KC', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (131, N'Korce', N'KO', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (132, N'Kruje', N'KR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (133, N'Kukes', N'KU', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (134, N'Librazhd', N'LB', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (135, N'Lezhe', N'LE', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (136, N'Lushnje', N'LU', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (137, N'Mallakaster', N'MK', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (138, N'Malesi e Madhe', N'MM', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (139, N'Mirdite', N'MR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (140, N'Mat', N'MT', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (141, N'Pogradec', N'PG', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (142, N'Peqin', N'PQ', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (143, N'Permet', N'PR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (144, N'Puke', N'PU', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (145, N'Shkoder', N'SH', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (146, N'Skrapar', N'SK', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (147, N'Sarande', N'SR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (148, N'Tepelene', N'TE', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (149, N'Tropoje', N'TP', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (150, N'Tirane', N'TR', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (151, N'Vlore', N'VL', N'AL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (152, N'Ararat', N'AR', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (153, N'Armavir', N'AV', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (154, N'Erevan', N'ER', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (155, N'Gegarkunik', N'GR', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (156, N'Kotayk', N'KT', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (157, N'Sirak', N'SH', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (158, N'Syunik', N'SU', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (159, N'Tavus', N'TV', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (160, N'Vayoc Jor', N'VD', N'AM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (161, N'Bengo', N'BGO', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (162, N'Benguela', N'BGU', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (163, N'Bie', N'BIE', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (164, N'Cabinda', N'CAB', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (165, N'Kuando Kubango', N'CCU', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (166, N'Cunene', N'CNN', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (167, N'Kwanza Norte', N'CNO', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (168, N'Kwanza Sul', N'CUS', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (169, N'Huambo', N'HUA', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (170, N'Huila', N'HUI', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (171, N'Lunda Norte', N'LNO', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (172, N'Lunda Sul', N'LSU', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (173, N'Luanda', N'LUA', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (174, N'Malange', N'MAL', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (175, N'Moxico', N'MOX', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (176, N'Namibe', N'NAM', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (177, N'Uige', N'UIG', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (178, N'Zaire', N'ZAI', N'AO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (179, N'Salta', N'A', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (180, N'Buenos Aires', N'B', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (181, N'Ciudad Autonoma de Buenos Aires', N'C', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (182, N'San Luis', N'D', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (183, N'Entre Rios', N'E', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (184, N'La Rioja', N'F', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (185, N'Santiago del Estero', N'G', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (186, N'Chaco', N'H', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (187, N'San Juan', N'J', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (188, N'Catamarca', N'K', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (189, N'La Pampa', N'L', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (190, N'Mendoza', N'M', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (191, N'Misiones', N'N', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (192, N'Formosa', N'P', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (193, N'Neuquen', N'Q', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (194, N'Rio Negro', N'R', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (195, N'Santa Fe', N'S', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (196, N'Tucuman', N'T', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (197, N'Chubut', N'U', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (198, N'Tierra del Fuego', N'V', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (199, N'Corrientes', N'W', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (200, N'Cordoba', N'X', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (201, N'Jujuy', N'Y', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (202, N'Santa Cruz', N'Z', N'AR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (203, N'Burgenland', N'BG', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (204, N'Karnten', N'KT', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (205, N'Niederosterreich', N'NS', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (206, N'Oberosterreich', N'OS', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (207, N'Salzburg', N'SB', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (208, N'Steiermark', N'SM', N'AT')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (209, N'Tirol', N'TL', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (210, N'Vorarlberg', N'VB', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (211, N'Wien', N'WN', N'AT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (212, N'Abseron', N'ABS', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (213, N'Agstafa', N'AGA', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (214, N'Agdam', N'AGM', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (215, N'Agdas', N'AGS', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (216, N'Agsu', N'AGU', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (217, N'Astara', N'AST', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (218, N'Baki', N'BA', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (219, N'Culfa', N'CUL', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (220, N'Fuzuli', N'FUZ', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (221, N'Goranboy', N'GOR', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (222, N'Goycay', N'GOY', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (223, N'Goygol', N'GYG', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (224, N'Haciqabul', N'HAC', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (225, N'Imisli', N'IMI', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (226, N'Ismayilli', N'ISM', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (227, N'Lacin', N'LAC', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (228, N'Lerik', N'LER', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (229, N'Masalli', N'MAS', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (230, N'Naftalan', N'NA', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (231, N'Neftcala', N'NEF', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (232, N'Naxcivan', N'NV', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (233, N'Naxcivan', N'NX', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (234, N'Oguz', N'OGU', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (235, N'Ordubad', N'ORD', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (236, N'Qax', N'QAX', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (237, N'Qazax', N'QAZ', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (238, N'Quba', N'QBA', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (239, N'Qubadli', N'QBI', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (240, N'Qobustan', N'QOB', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (241, N'Qusar', N'QUS', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (242, N'Sabirabad', N'SAB', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (243, N'Sahbuz', N'SAH', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (244, N'Salyan', N'SAL', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (245, N'Saatli', N'SAT', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (246, N'Sabran', N'SBN', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (247, N'Sumqayit', N'SM', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (248, N'Samaxi', N'SMI', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (249, N'Samux', N'SMX', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (250, N'Sirvan', N'SR', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (251, N'Susa', N'SUS', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (252, N'Tovuz', N'TOV', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (253, N'Ucar', N'UCA', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (254, N'Xacmaz', N'XAC', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (255, N'Xocali', N'XCI', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (256, N'Xizi', N'XIZ', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (257, N'Yardimli', N'YAR', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (258, N'Yevlax', N'YE', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (259, N'Yevlax', N'YEV', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (260, N'Zaqatala', N'ZAQ', N'AZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (261, N'Unsko-Sanski Kanton', N'USK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (262, N'Posavski Kanton', N'PK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (263, N'Tuzlanski Kanton', N'TK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (264, N'Zenicko-Dobojski Kanton', N'ZDK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (265, N'Bosansko-Podrinjski Kanton', N'SK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (266, N'Srednjobosanski Kanton', N'SK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (267, N'Hercegovacko-Neretvanski Kanton', N'HNK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (268, N'Zapadnohercegovacki kanton', N'ZK', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (269, N'Kanton Sarajevo', N'KS', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (270, N'Zupanija br. 10(Hercegbosanska zupanija)', N'HZ', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (271, N'Federacija Bosne i Hercegovine', N'BIH', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (272, N'Brcko distrikt', N'BRC', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (273, N'Republika Srpska', N'SRP', N'BA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (274, N'Christ Church', N'CC', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (275, N'Saint Andrew', N'SA', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (276, N'Saint George', N'SG', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (277, N'Saint James', N'SJ', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (278, N'Saint John', N'SAJ', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (279, N'Saint Joseph', N'SAJ', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (280, N'Saint Lucy', N'SL', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (281, N'Saint Michael', N'SM', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (282, N'Saint Peter', N'SP', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (283, N'Saint Philip', N'SP', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (284, N'Saint Thomas', N'ST', N'BB')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (285, N'Bandarban', N'BD', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (286, N'Barguna', N'DG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (287, N'Bogra', N'BO', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (288, N'Brahmanbaria', N'BM', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (289, N'Bagerhat', N'BH', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (290, N'Barisal', N'BS', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (291, N'Bhola', N'BH', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (292, N'Comilla', N'CO', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (293, N'Chandpur', N'CP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (294, N'Chittagong', N'CG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (295, N'Coxs Bazar', N'CB', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (296, N'Chuadanga', N'CD', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (297, N'Dhaka', N'DH', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (298, N'Dinajpur', N'DI', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (299, N'Faridpur', N'FP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (300, N'Feni', N'FE', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (301, N'Gopalganj', N'GG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (302, N'Gazipur', N'GP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (303, N'Gaibandha', N'19', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (304, N'Habiganj', N'HG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (305, N'Jamalpur', N'JP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (306, N'Jessore', N'JES', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (307, N'Jhenaidah', N'JND', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (308, N'Jaipurhat', N'JH', N'BD')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (309, N'Jhalakati', N'JK', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (310, N'Kishoreganj', N'KG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (311, N'Khulna', N'KHU', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (312, N'Kurigram', N'KUR', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (313, N'Khagrachari', N'KHA', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (314, N'Kushtia', N'KUS', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (315, N'Lakshmipur', N'LAK', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (316, N'Lalmonirhat', N'LAL', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (317, N'Manikganj', N'MG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (318, N'Mymensingh', N'MYS', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (319, N'Munshiganj', N'MUG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (320, N'Madaripur', N'MAD', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (321, N'Magura', N'MAG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (322, N'Moulvibazar', N'MOU', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (323, N'Meherpur', N'MEH', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (324, N'Narayanganj', N'NAR', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (325, N'Netrakona', N'NET', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (326, N'Narsingdi', N'NAR', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (327, N'Narail', N'NAL', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (328, N'Natore', N'NAT', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (329, N'Nawabganj', N'NAW', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (330, N'Nilphamari', N'NIL', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (331, N'Noakhali', N'NOA', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (332, N'Naogaon', N'NAO', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (333, N'Pabna', N'PAB', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (334, N'Pirojpur', N'PIR', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (335, N'Patuakhali', N'PAT', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (336, N'Panchagarh', N'PAN', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (337, N'Rajbari', N'RB', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (338, N'Rajshahi', N'RS', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (339, N'Rangpur', N'RP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (340, N'Rangamati', N'RG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (341, N'Sherpur', N'SP', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (342, N'Satkhira', N'SK', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (343, N'Sirajganj', N'SIG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (344, N'Sylhet', N'SY', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (345, N'Sunamganj', N'SG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (346, N'Shariatpur', N'ST', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (347, N'Tangail', N'TAG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (348, N'Thakurgaon', N'TG', N'BD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (349, N'Bruxelles-Capitale  Region de', N'BRU', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (350, N'Antwerpen', N'VAN', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (351, N'Vlaams Brabant', N'VBR', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (352, N'Vlaamse Gewest', N'VLG', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (353, N'Limburg', N'VLI', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (354, N'Oost-Vlaanderen', N'VOV', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (355, N'West-Vlaanderen', N'VWV', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (356, N'Wallonne  Region', N'WAL', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (357, N'Brabant wallon', N'WBR', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (358, N'Hainaut', N'WHT', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (359, N'Liege', N'WLG', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (360, N'Luxembourg', N'WLX', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (361, N'Namur', N'WNA', N'BE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (362, N'Bale', N'BAL', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (363, N'Bam', N'BAM', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (364, N'Banwa', N'BAN', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (365, N'Bazega ga', N'BAZ', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (366, N'Bougouriba', N'BGR', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (367, N'Boulgou', N'BLG', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (368, N'Boulkiemde', N'BLK', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (369, N'Comoe', N'COM', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (370, N'Ganzourgou', N'GAN', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (371, N'Gnagna', N'GNA', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (372, N'Gourma', N'GOU', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (373, N'Houet', N'HOU', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (374, N'Ioba', N'IOB', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (375, N'Kadiogo', N'KAD', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (376, N'Kenedougou', N'KEN', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (377, N'Komondjari', N'KMD', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (378, N'Kompienga', N'KMP', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (379, N'Koulpelogo', N'KOP', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (380, N'Kossi', N'KOS', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (381, N'Kouritenga', N'KOT', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (382, N'Kourweogo', N'KOW', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (383, N'Leraba', N'LER', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (384, N'Loroum', N'LOR', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (385, N'Mouhoun', N'MOU', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (386, N'Namentenga', N'NAM', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (387, N'Nahouri', N'NAO', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (388, N'Nayala', N'NAY', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (389, N'Noumbiel', N'NOU', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (390, N'Oubritenga', N'OUB', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (391, N'Oudalan', N'OUD', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (392, N'Passore', N'PAS', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (393, N'Poni', N'PON', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (394, N'Seno', N'SEN', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (395, N'Sissili', N'SIS', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (396, N'Sanmatenga', N'SMT', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (397, N'Sanguie', N'SNG', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (398, N'Soum', N'SOM', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (399, N'Sourou', N'SOR', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (400, N'Tapoa', N'TAP', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (401, N'Tui', N'TUI', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (402, N'Yagha', N'YAG', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (403, N'Yatenga', N'YAT', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (404, N'Ziro', N'ZIR', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (405, N'Zondoma', N'ZON', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (406, N'Zoundweogo', N'ZOU', N'BF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (407, N'Blagoevgrad', N'BA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (408, N'Burgas', N'BU', N'BG')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (409, N'Varna', N'VA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (410, N'Veliko Tarnovo', N'VT', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (411, N'Vidin', N'VI', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (412, N'Vratsa', N'VR', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (413, N'Gabrovo', N'GA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (414, N'Dobrich', N'DO', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (415, N'Kardzhali', N'KA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (416, N'Kjustendil', N'KJ', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (417, N'Lovech', N'LO', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (418, N'Montana', N'MO', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (419, N'Pazardzik', N'PA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (420, N'Pernik', N'PE', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (421, N'Pleven', N'PL', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (422, N'Plovdiv', N'PLO', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (423, N'Razgrad', N'RA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (424, N'Ruse', N'RU', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (425, N'Silistra', N'SI', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (426, N'Sliven', N'SL', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (427, N'Smolyan', N'SM', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (428, N'Sofia (stolitsa)', N'SO', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (429, N'Sofia', N'SOF', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (430, N'Stara Zagora', N'SZ', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (431, N'Targovishte', N'TA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (432, N'Haskovo', N'HA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (433, N'Shumen', N'SH', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (434, N'Yambol', N'YA', N'BG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (435, N'Al Manamah (Al Asimah)', N'AM', N'BH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (436, N'Al Janubiyah', N'AJ', N'BH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (437, N'Al Wusta', N'AW', N'BH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (438, N'Ash Shamaliyah', N'AS', N'BH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (439, N'Bubanza', N'BB', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (440, N'Bujumbura Rural', N'BL', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (441, N'Bujumbura Mairie', N'BM', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (442, N'Bururi', N'BR', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (443, N'Cankuzo', N'CA', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (444, N'Cibitoke', N'CI', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (445, N'Gitega', N'GI', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (446, N'Kirundo', N'KI', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (447, N'Karuzi', N'KR', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (448, N'Kayanza', N'KY', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (449, N'Makamba', N'MA', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (450, N'Muramvya', N'MU', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (451, N'Mwaro', N'MW', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (452, N'Muyinga', N'MY', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (453, N'Ngozi', N'NG', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (454, N'Rutana', N'RT', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (455, N'Ruyigi', N'RY', N'BI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (456, N'Atakora', N'AK', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (457, N'Alibori', N'AL', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (458, N'Atlantique', N'AQ', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (459, N'Borgou', N'BO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (460, N'Collines', N'CO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (461, N'Donga', N'DO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (462, N'Kouffo', N'KO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (463, N'Littoral', N'LI', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (464, N'Mono', N'MO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (465, N'Oueme', N'OU', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (466, N'Plateau', N'PL', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (467, N'Zou', N'ZO', N'BJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (468, N'Belait', N'BE', N'BN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (469, N'Brunei-Muara', N'BM', N'BN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (470, N'Temburong', N'TE', N'BN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (471, N'Tutong', N'TU', N'BN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (472, N'El Beni', N'B', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (473, N'Cochabamba', N'C', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (474, N'Chuquisaca', N'H', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (475, N'La Paz', N'L', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (476, N'Pando', N'N', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (477, N'Oruro', N'O', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (478, N'Potosi', N'P', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (479, N'Santa Cruz', N'S', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (480, N'Tarija', N'T', N'BO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (481, N'Bonaire', N'BO', N'BQ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (482, N'Saba', N'SA', N'BQ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (483, N'Sint Eustatius', N'SE', N'BQ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (484, N'Acre', N'AC', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (485, N'Alagoas', N'AL', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (486, N'Amazonas', N'AM', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (487, N'Amapa', N'AP', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (488, N'Bahia', N'BA', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (489, N'Ceara', N'CE', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (490, N'Distrito Federal', N'DF', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (491, N'Espirito Santo', N'ES', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (492, N'Goias', N'GO', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (493, N'Maranhao', N'MA', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (494, N'Minas Gerais', N'MG', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (495, N'Mato Grosso do Sul', N'MS', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (496, N'Mato Grosso', N'MT', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (497, N'Para', N'PA', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (498, N'Paraiba', N'PB', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (499, N'Pernambuco', N'PE', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (500, N'Piaui', N'PI', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (501, N'Parana', N'PR', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (502, N'Rio de Janeiro', N'RJ', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (503, N'Rio Grande do Norte', N'RN', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (504, N'Rondonia', N'RO', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (505, N'Roraima', N'RR', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (506, N'Rio Grande do Sul', N'RS', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (507, N'Santa Catarina', N'SC', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (508, N'Sergipe', N'SE', N'BR')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (509, N'Sao Paulo', N'SP', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (510, N'Tocantins', N'TO', N'BR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (511, N'Acklins', N'AK', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (512, N'Bimini', N'BI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (513, N'Black Point', N'BP', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (514, N'Berry Islands', N'BY', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (515, N'Central Eleuthera', N'CE', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (516, N'Cat Island', N'CI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (517, N'Crooked Island and Long Cay', N'CK', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (518, N'Central Abaco', N'CO', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (519, N'Central Andros', N'CS', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (520, N'East Grand Bahama', N'EG', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (521, N'Exuma', N'EX', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (522, N'City of Freeport', N'FP', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (523, N'Grand Cay', N'GC', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (524, N'Harbour Island', N'HI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (525, N'Hope Town', N'HT', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (526, N'Inagua', N'IN', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (527, N'Long Island', N'LI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (528, N'Mangrove Cay', N'MC', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (529, N'Mayaguana', N'MG', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (530, N'Moores Island', N'MI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (531, N'North Eleuthera', N'NE', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (532, N'North Abaco', N'NO', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (533, N'North Andros', N'NS', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (534, N'Rum Cay', N'RC', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (535, N'Ragged Island', N'RI', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (536, N'South Andros', N'SA', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (537, N'South Eleuthera', N'SE', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (538, N'South Abaco', N'SO', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (539, N'San Salvador', N'SS', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (540, N'Spanish Wells', N'SW', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (541, N'West Grand Bahama', N'WG', N'BS')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (542, N'Paro', N'PA', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (543, N'Chhukha', N'CH', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (544, N'Ha', N'HA', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (545, N'Samtse', N'SAM', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (546, N'Thimphu', N'THI', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (547, N'Tsirang', N'TSI', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (548, N'Dagana', N'DAG', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (549, N'Punakha', N'PUN', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (550, N'Wangdue Phodrang', N'WP', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (551, N'Sarpang', N'SAR', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (552, N'Trongsa', N'TR', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (553, N'Bumthang', N'BU', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (554, N'Zhemgang', N'ZHE', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (555, N'Trashigang', N'TRA', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (556, N'Monggar', N'MNG', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (557, N'Pemagatshel', N'PEM', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (558, N'Lhuentse', N'LHU', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (559, N'Samdrup Jongkha', N'SJ', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (560, N'Gasa', N'GA', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (561, N'Trashi Yangtse', N'TY', N'BT')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (562, N'Central', N'CE', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (563, N'Chobe', N'CH', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (564, N'Francistown', N'FR', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (565, N'Gaborone', N'GA', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (566, N'Ghanzi', N'GH', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (567, N'Jwaneng', N'JW', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (568, N'Kgalagadi', N'KG', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (569, N'Kgatleng', N'KL', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (570, N'Kweneng', N'KW', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (571, N'Lobatse', N'LO', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (572, N'North East', N'NE', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (573, N'North West', N'NW', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (574, N'South East', N'SE', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (575, N'Southern', N'SO', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (576, N'Selibe Phikwe', N'SP', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (577, N'Sowa Town', N'ST', N'BW')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (578, N'Bresckaja voblasc (be) - Brestskaja oblast (ru)', N'BR', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (579, N'Horad Minsk', N'HM', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (580, N'Homyelskaya voblasts (be) - Gomelskaya oblast (ru)', N'HO', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (581, N'Hrodzenskaya voblasts be', N'HR', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (582, N'Mahilyowskaya voblasts be', N'MA', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (583, N'Minskaya voblasts (be) - Minskaya oblast (ru)', N'MI', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (584, N'Vitsyebskaya voblasts be', N'VI', N'BY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (585, N'Belize', N'BZ', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (586, N'Cayo', N'CY', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (587, N'Corozal', N'CZL', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (588, N'Orange Walk', N'OW', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (589, N'Stann Creek', N'SC', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (590, N'Toledo', N'TOL', N'BZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (591, N'Alberta', N'AB', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (592, N'British Columbia', N'BC', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (593, N'Manitoba', N'MB', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (594, N'New Brunswick', N'NB', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (595, N'Newfoundland and Labrador', N'NL', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (596, N'Nova Scotia', N'NS', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (597, N'Northwest Territories', N'NT', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (598, N'Nunavut', N'NU', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (599, N'Ontario', N'ON', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (600, N'Prince Edward Island', N'PE', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (601, N'Quebec', N'QC', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (602, N'Saskatchewan', N'SK', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (603, N'Yukon', N'YT', N'CA')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (604, N'Bas-Congo', N'BC', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (605, N'Bandundu', N'BN', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (606, N'Equateur', N'EQ', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (607, N'Katanga', N'KA', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (608, N'Kasai-Oriental', N'KE', N'CD')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (609, N'Kinshasa', N'KN', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (610, N'Kasai-Occidental', N'KW', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (611, N'Maniema', N'MA', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (612, N'Nord-Kivu', N'NK', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (613, N'Orientale', N'OR', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (614, N'Sud-Kivu', N'SK', N'CD')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (615, N'Ouham', N'AC', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (616, N'Bamingui-Bangoran', N'BB', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (617, N'Bangui', N'BGF', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (618, N'Basse-Kotto', N'BK', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (619, N'Haute-Kotto', N'HK', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (620, N'Haut-Mbomou', N'HM', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (621, N'Mambere-Kadei', N'HS', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (622, N'Gribingui', N'KB', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (623, N'Kemo-Gribingui', N'KG', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (624, N'Lobaye', N'LB', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (625, N'Mbomou', N'MB', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (626, N'Ombella-Mpoko', N'MP', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (627, N'Nana-Mambere', N'NM', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (628, N'Ouham-Pende', N'OP', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (629, N'Sangha', N'SE', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (630, N'Ouaka', N'UK', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (631, N'Vakaga', N'VK', N'CF')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (632, N'Bouenza', N'BO', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (633, N'Pool', N'PO', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (634, N'Sangha', N'SA', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (635, N'Plateaux', N'PL', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (636, N'Cuvette-Ouest', N'CO', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (637, N'Pointe-Noire', N'PN', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (638, N'Lekoumou', N'LE', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (639, N'Kouilou', N'KO', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (640, N'Likouala', N'LI', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (641, N'Cuvette', N'CU', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (642, N'Niari', N'NI', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (643, N'Brazzaville', N'BZV', N'CG')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (644, N'Aargau (de)', N'AG', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (645, N'Appenzell Innerrhoden (de)', N'AI', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (646, N'Appenzell Ausserrhoden (de)', N'AR', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (647, N'Bern (de)', N'BE', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (648, N'Basel-Landschaft (de)', N'BL', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (649, N'Basel-Stadt (de)', N'BS', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (650, N'Fribourg (fr)', N'FR', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (651, N'Geneve (fr)', N'GE', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (652, N'Glarus (de)', N'GL', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (653, N'Graubunden (de)', N'GR', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (654, N'Jura (fr)', N'JU', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (655, N'Luzern (de)', N'LU', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (656, N'Neuchatel (fr)', N'NE', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (657, N'Nidwalden (de)', N'NW', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (658, N'Obwalden (de)', N'OW', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (659, N'Sankt Gallen (de)', N'SG', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (660, N'Schaffhausen (de)', N'SH', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (661, N'Solothurn (de)', N'SO', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (662, N'Schwyz (de)', N'SZ', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (663, N'Thurgau (de)', N'TG', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (664, N'Ticino (it)', N'TI', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (665, N'Uri (de)', N'UR', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (666, N'Vaud (fr)', N'VD', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (667, N'Valais (fr)', N'VS', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (668, N'Zug (de)', N'ZG', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (669, N'Zurich (de)', N'ZH', N'CH')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (670, N'Lagunes (Region des)', N'LA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (671, N'Haut-Sassandra (Region du)', N'HA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (672, N'Savanes (Region des)', N'SA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (673, N'Vallee du Bandama (Region de la)', N'VDB', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (674, N'Moyen-Comoe (Region du)', N'MC', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (675, N'18 Montagnes (Region des)', N'M', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (676, N'Lacs (Region des)', N'LA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (677, N'Zanzan (Region du)', N'ZA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (678, N'Bas-Sassandra (Region du)', N'BS', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (679, N'Denguele (Region du)', N'DE', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (680, N'Nzi-Comoe (Region)', N'NC', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (681, N'Marahoue (Region de la)', N'MA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (682, N'Sud-Comoe (Region du)', N'SC', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (683, N'Worodougou (Region du)', N'WO', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (684, N'Sud-Bandama (Region du)', N'SB', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (685, N'Agnebi (Region de l)', N'AG', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (686, N'Bafing (Region du)', N'BA', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (687, N'Fromager (Region du)', N'FR', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (688, N'Moyen-Cavally (Region du)', N'MC', N'CI')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (689, N'Aysen', N'AY', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (690, N'Antofagasta', N'AN', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (691, N'Arica y Parinacota', N'AP', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (692, N'Araucania', N'AR', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (693, N'Atacama', N'AT', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (694, N'Biobio', N'BI', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (695, N'Coquimbo', N'CO', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (696, N'Libertador General Bernardo OHiggins', N'LI', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (697, N'Los Lagos', N'LL', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (698, N'Los Rios', N'LR', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (699, N'Magallanes', N'MA', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (700, N'Maule', N'ML', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (701, N'Region Metropolitana de Santiago', N'RM', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (702, N'Tarapaca', N'TA', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (703, N'Valparaiso', N'VS', N'CL')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (704, N'Adamaoua', N'AD', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (705, N'Centre', N'CE', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (706, N'Far North', N'EN', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (707, N'East', N'ES', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (708, N'Littoral', N'LT', N'CM')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (709, N'North', N'NO', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (710, N'North-West', N'NW', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (711, N'West', N'OU', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (712, N'South', N'SU', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (713, N'South-West', N'SW', N'CM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (714, N'Beijing', N'BJ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (715, N'Tianjin', N'TJ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (716, N'Hebei', N'HEB', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (717, N'Shanxi', N'SAX', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (718, N'Nei Mongol (mn)', N'15', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (719, N'Liaoning', N'LN', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (720, N'Jilin', N'JL', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (721, N'Heilongjiang', N'HL', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (722, N'Shanghai', N'SHG', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (723, N'Jiangsu', N'JS', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (724, N'Zhejiang', N'33', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (725, N'Anhui', N'AH', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (726, N'Fujian', N'FJ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (727, N'Jiangxi', N'JX', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (728, N'Shandong', N'SD', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (729, N'Henan', N'HEN', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (730, N'Hubei', N'HUB', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (731, N'Hunan', N'HUN', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (732, N'Guangdong', N'GD', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (733, N'Guangxi', N'GX', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (734, N'Hainan', N'HA', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (735, N'Chongqing', N'CQ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (736, N'Sichuan', N'SC', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (737, N'Guizhou', N'GZ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (738, N'Yunnan', N'YN', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (739, N'Xizang', N'54', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (740, N'Shaanxi', N'SAA', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (741, N'Gansu', N'GS', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (742, N'Qinghai', N'QH', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (743, N'Ningxia', N'NX', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (744, N'Xinjiang', N'XJ', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (745, N'Taiwan', N'TWN', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (746, N'Xianggang', N'91', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (747, N'Aomen', N'92', N'CN')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (748, N'Amazonas', N'AMA', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (749, N'Antioquia', N'ANT', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (750, N'Arauca', N'ARA', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (751, N'Atlantico', N'ATL', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (752, N'Bolivar', N'BOL', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (753, N'Boyaca', N'BOY', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (754, N'Caldas', N'CAL', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (755, N'Caqueta', N'CAQ', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (756, N'Casanare', N'CAS', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (757, N'Cauca', N'CAU', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (758, N'Cesar', N'CES', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (759, N'Choco', N'CHO', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (760, N'Cordoba', N'COR', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (761, N'Cundinamarca', N'CUN', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (762, N'Distrito Capital de Bogota', N'DC', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (763, N'Guainia', N'GUA', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (764, N'Guaviare', N'GUV', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (765, N'Huila', N'HUI', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (766, N'La Guajira', N'LAG', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (767, N'Magdalena', N'MAG', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (768, N'Meta', N'MET', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (769, N'Narino', N'NAR', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (770, N'Norte de Santander', N'NSA', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (771, N'Putumayo', N'PUT', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (772, N'Quindio', N'QUI', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (773, N'Risaralda', N'RIS', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (774, N'Santander', N'SAN', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (775, N'San Andres  Providencia y Santa Catalina', N'SAP', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (776, N'Sucre', N'SUC', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (777, N'Tolima', N'TOL', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (778, N'Valle del Cauca', N'VAC', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (779, N'Vaupes', N'VAU', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (780, N'Vichada', N'VID', N'CO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (781, N'Alajuela', N'A', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (782, N'Cartago', N'C', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (783, N'Guanacaste', N'G', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (784, N'Heredia', N'H', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (785, N'Limon', N'L', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (786, N'Puntarenas', N'P', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (787, N'San Jose', N'SJ', N'CR')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (788, N'Pinar del Rio', N'1', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (789, N'La Habana', N'2', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (790, N'Ciudad de La Habana', N'3', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (791, N'Matanzas', N'4', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (792, N'Villa Clara', N'5', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (793, N'Cienfuegos', N'6', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (794, N'Sancti Spiritus', N'7', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (795, N'Ciego de Avila', N'8', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (796, N'Camaguey', N'9', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (797, N'Las Tunas', N'10', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (798, N'Holguin', N'11', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (799, N'Granma', N'12', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (800, N'Santiago de Cuba', N'13', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (801, N'Guantanamo', N'14', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (802, N'Artemisa', N'15', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (803, N'Mayabeque', N'16', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (804, N'Isla de la Juventud', N'99', N'CU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (805, N'Brava', N'BR', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (806, N'Boa Vista', N'BV', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (807, N'Santa Catarina', N'CA', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (808, N'Santa Catarina do Fogo', N'CF', N'CV')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (809, N'Santa Cruz', N'CR', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (810, N'Maio', N'MA', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (811, N'Mosteiros', N'MO', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (812, N'Paul', N'PA', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (813, N'Porto Novo', N'PN', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (814, N'Praia', N'PR', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (815, N'Ribeira Brava', N'RB', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (816, N'Ribeira Grande', N'RG', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (817, N'Ribeira Grande de Santiago', N'RS', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (818, N'Sao Domingos', N'SD', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (819, N'Sao Filipe', N'SF', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (820, N'Sal', N'SL', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (821, N'Sao Miguel', N'SM', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (822, N'Sao Lourenco dos Orgaos', N'SO', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (823, N'Sao Salvador do Mundo', N'SS', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (824, N'Sao Vicente', N'SV', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (825, N'Tarrafal', N'TA', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (826, N'Tarrafal de Sao Nicolau', N'TS', N'CV')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (827, N'Lefkosia', N'LE', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (828, N'Lemesos', N'LE', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (829, N'Larnaka', N'LA', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (830, N'Ammochostos', N'AM', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (831, N'Pafos', N'PA', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (832, N'Keryneia', N'KE', N'CY')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (833, N'Jihocesky kraj', N'JC', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (834, N'Jihomoravsky kraj', N'JM', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (835, N'Karlovarsky kraj', N'KA', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (836, N'Kralovehradecky kraj', N'KR', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (837, N'Liberecky kraj', N'LI', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (838, N'Moravskoslezsky kraj', N'MO', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (839, N'Olomoucky kraj', N'OL', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (840, N'Pardubicky kraj', N'PA', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (841, N'Plzensky kraj', N'PL', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (842, N'Praha  hlavni mesto', N'PR', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (843, N'Stredocesky kraj', N'ST', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (844, N'Ustecky kraj', N'US', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (845, N'Vysocina', N'VY', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (846, N'Zlinsky kraj', N'ZL', N'CZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (847, N'Brandenburg', N'BB', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (848, N'Berlin', N'BE', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (849, N'Baden-Wurttemberg', N'BW', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (850, N'Bayern', N'BY', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (851, N'Bremen', N'HB', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (852, N'Hessen', N'HE', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (853, N'Hamburg', N'HH', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (854, N'Mecklenburg-Vorpommern', N'MV', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (855, N'Niedersachsen', N'NI', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (856, N'Nordrhein-Westfalen', N'NW', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (857, N'Rheinland-Pfalz', N'RP', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (858, N'Schleswig-Holstein', N'SH', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (859, N'Saarland', N'SL', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (860, N'Sachsen', N'SN', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (861, N'Sachsen-Anhalt', N'ST', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (862, N'Thuringen', N'TH', N'DE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (863, N'Arta', N'AR', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (864, N'Ali Sabieh', N'AS', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (865, N'Dikhil', N'DI', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (866, N'Djibouti', N'DJ', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (867, N'Obock', N'OB', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (868, N'Tadjourah', N'TA', N'DJ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (869, N'Nordjylland', N'NO', N'DK')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (870, N'Midtjylland', N'MI', N'DK')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (871, N'Syddanmark', N'SY', N'DK')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (872, N'Hovedstaden', N'HO', N'DK')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (873, N'Sjaelland', N'SJ', N'DK')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (874, N'Saint Andrew', N'SA', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (875, N'Saint David', N'SD', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (876, N'Saint George', N'SG', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (877, N'Saint John', N'SJ', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (878, N'Saint Joseph', N'SJO', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (879, N'Saint Luke', N'SL', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (880, N'Saint Mark', N'SM', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (881, N'Saint Patrick', N'SP', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (882, N'Saint Paul', N'SPA', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (883, N'Saint Peter', N'SPE', N'DM')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (884, N'Distrito Nacional (Santo Domingo)', N'SN', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (885, N'Azua', N'AZ', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (886, N'Baoruco', N'BA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (887, N'Barahona', N'BAR', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (888, N'Dajabon', N'DA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (889, N'Duarte', N'DUA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (890, N'La Estrelleta [Elias Pina]', N'LE', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (891, N'El Seibo', N'ES', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (892, N'Espaillat', N'ES', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (893, N'Independencia', N'IN', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (894, N'La Altagracia', N'LA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (895, N'La Romana', N'LR', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (896, N'La Vega', N'LV', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (897, N'Maria Trinidad Sanchez', N'MTS', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (898, N'Monte Cristi', N'MC', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (899, N'Pedernales', N'PE', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (900, N'Peravia', N'PE', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (901, N'Puerto Plata', N'PP', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (902, N'Hermanas Mirabal', N'HM', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (903, N'Samana', N'SA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (904, N'San Cristobal', N'SC', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (905, N'San Juan', N'SJ', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (906, N'San Pedro de Macoris', N'SPD', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (907, N'Sanchez Ramirez', N'SR', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (908, N'Santiago', N'SA', N'DO')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (909, N'Santiago Rodriguez', N'SR', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (910, N'Valverde', N'VA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (911, N'Monsenor Nouel', N'MN', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (912, N'Monte Plata', N'MP', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (913, N'Hato Mayor', N'HM', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (914, N'San Jose de Ocoa', N'SJ', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (915, N'Santo Domingo', N'SD', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (916, N'Cibao Nordeste', N'CN', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (917, N'Cibao Noroeste', N'CNO', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (918, N'Cibao Norte', N'CNO', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (919, N'Cibao Sur', N'CS', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (920, N'El Valle', N'EV', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (921, N'Enriquillo', N'EN', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (922, N'Higuamo', N'HI', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (923, N'Ozama', N'OZ', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (924, N'Valdesia', N'VA', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (925, N'Yuma', N'YU', N'DO')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (926, N'Adrar', N'AD', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (927, N'Chlef', N'CH', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (928, N'Laghouat', N'LA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (929, N'Oum el Bouaghi', N'OE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (930, N'Batna', N'BA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (931, N'Bejaia', N'BE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (932, N'Biskra', N'BI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (933, N'Bechar', N'BE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (934, N'Blida', N'BI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (935, N'Bouira', N'BO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (936, N'Tamanrasset', N'TA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (937, N'Tebessa', N'TE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (938, N'Tlemcen', N'TL', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (939, N'Tiaret', N'TI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (940, N'Tizi Ouzou', N'TO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (941, N'Alger', N'AL', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (942, N'Djelfa', N'DJ', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (943, N'Jijel', N'JI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (944, N'Setif', N'SE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (945, N'Saida', N'SA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (946, N'Skikda', N'SK', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (947, N'Sidi Bel Abbes', N'SB', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (948, N'Annaba', N'AN', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (949, N'Guelma', N'GU', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (950, N'Constantine', N'CO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (951, N'Medea', N'ME', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (952, N'Mostaganem', N'MO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (953, N'Msila', N'MS', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (954, N'Mascara', N'MA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (955, N'Ouargla', N'OU', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (956, N'Oran', N'OR', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (957, N'El Bayadh', N'EB', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (958, N'Illizi', N'IL', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (959, N'Bordj Bou Arreridj', N'BBA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (960, N'Boumerdes', N'BO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (961, N'El Tarf', N'ET', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (962, N'Tindouf', N'TI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (963, N'Tissemsilt', N'TI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (964, N'El Oued', N'EO', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (965, N'Khenchela', N'KH', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (966, N'Souk Ahras', N'SA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (967, N'Tipaza', N'TI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (968, N'Mila', N'MI', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (969, N'Ain Defla', N'AD', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (970, N'Naama', N'NA', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (971, N'Ain Temouchent', N'AT', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (972, N'Ghardaia', N'GH', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (973, N'Relizane', N'RE', N'DZ')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (974, N'Azuay', N'A', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (975, N'Bolivar', N'B', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (976, N'Carchi', N'C', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (977, N'Orellana', N'D', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (978, N'Esmeraldas', N'E', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (979, N'Canar', N'F', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (980, N'Guayas', N'G', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (981, N'Chimborazo', N'H', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (982, N'Imbabura', N'I', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (983, N'Loja', N'L', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (984, N'Manabi', N'M', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (985, N'Napo', N'N', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (986, N'El Oro', N'O', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (987, N'Pichincha', N'P', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (988, N'Los Rios', N'R', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (989, N'Morona-Santiago', N'S', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (990, N'Santo Domingo de los Tsachilas', N'SD', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (991, N'Santa Elena', N'SE', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (992, N'Tungurahua', N'T', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (993, N'Sucumbios', N'U', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (994, N'Galapagos', N'W', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (995, N'Cotopaxi', N'X', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (996, N'Pastaza', N'Y', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (997, N'Zamora-Chinchipe', N'Z', N'EC')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (998, N'Harjumaa', N'HR', N'EE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (999, N'Hiiumaa', N'HI', N'EE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1000, N'Ida-Virumaa', N'IV', N'EE')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1001, N'Australian Capital Territory', N'ACT', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1002, N'Northern Territory', N'NT', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1003, N'Jervis Bay Territory', N'JBT', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1004, N'New South Wales', N'NSW', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1005, N'Queensland', N'QLD', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1006, N'South Australia', N'SA', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1007, N'Tasmania', N'TAS', N'AU')
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1008, N'Victoria', N'VIC', N'AU')
GO
INSERT [dbo].[CountryStates] ([StateId], [StateName], [StateAbbrName], [CountryId]) VALUES (1009, N'Western Australia', N'WA', N'AU')
SET IDENTITY_INSERT [dbo].[CountryStates] OFF
INSERT [dbo].[Currencies] ([CurrencyId], [CurrencyName], [CurrencySymbol], [CurrencyFont]) VALUES (N'AUD', N'Australia Dollar', N'$', NULL)
INSERT [dbo].[Currencies] ([CurrencyId], [CurrencyName], [CurrencySymbol], [CurrencyFont]) VALUES (N'INR', N'Rupees', N'₹', N'Rs')
INSERT [dbo].[Currencies] ([CurrencyId], [CurrencyName], [CurrencySymbol], [CurrencyFont]) VALUES (N'USD', N'USD Dollar', N'$', NULL)
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (1, N'Raj', N'Gupta', N'India')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (2, N'Raj', N'Gupta', N'India')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (3, N'Mohan', N'Kumar', N'USA')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (4, N'James', N'Barry', N'UK')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (5, N'James', N'Barry', N'UK')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [Country]) VALUES (6, N'James', N'Barry', N'UK')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[LookupGroups] ON 

INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (1, N'BooleanYesNo', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (2, N'CheckCourseAddons', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (3, N'DropDownAge', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (4, N'ListBoxModules', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (5, N'RadioJobs', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (6, N'ChkTermCondition', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (7, N'Delivery Options', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (8, N'Platforms', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (9, N'What is your industry?', 1)
INSERT [dbo].[LookupGroups] ([LookupGroupId], [LookupGroupName], [IsActive]) VALUES (10, N'Which EMR are you currently using?', 1)
SET IDENTITY_INSERT [dbo].[LookupGroups] OFF
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (1, N'No', N'False', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (1, N'Yes', N'True', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (2, N'Advanced Chapters', N'Advanced Chapters', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (2, N'Basic Chapters', N'Basic Chapters', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (2, N'Extra1 Chapters', N'Extra1 Chapters', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (2, N'Extra2 Chapters', N'Extra2 Chapters', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (2, N'looksval', N'looksval', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (3, N'Age(Yrs) 1-18', N'Age 1-18', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (3, N'Age(Yrs) 19-35', N'Age 19-35', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (3, N'Age(Yrs) 36-50', N'Age 36-50', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (4, N'Module 1', N'Module 1', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (4, N'Module 2', N'Module 2', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (4, N'Module 3', N'Module 3', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (4, N'Module 4', N'Module 4', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (5, N'AIN/PCA', N'AIN-PCA', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (5, N'EN', N'EN', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (5, N'Other', N'Other', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (5, N'RM', N'RM', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (5, N'RN', N'RN', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (6, N'Yes', N'True', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (7, N'API', N'API', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (7, N'ASP', N'ASP', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (7, N'HTML', N'HTML', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (7, N'XML', N'XML', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (8, N'HTML5', N'HTML5', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (8, N'RWD', N'RWD', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Business Development', N'Business Development', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Consumer Portal/Website.', N'Consumer Portal/Website', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Health Plan/Managed Care Organization.', N'Health Plan/Managed Care Organization', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Hospital/Healthcare', N'Hospital/Healthcare', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'I am a consumer.', N'I am a consumer', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'I am an educator.', N'I am an educator.', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'I am an employer.', N'I am an employer.', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Pharmaceutical', N'Pharmaceutical', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (9, N'Physician Office/Organization', N'Physician Office/Organization', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (10, N'Allscripts', N'Allscripts', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (10, N'eClinicalWorks', N'eClinicalWorks', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (10, N'Epic', N'Epic', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (10, N'Greenway', N'Greenway', 1)
INSERT [dbo].[LookupValues] ([LookupGroupId], [LookupDisplay], [LookupDataValue], [IsActive]) VALUES (10, N'I am currently not using an EMR.', N'I am currently not using an EMR.', 1)
INSERT [dbo].[MerchantProductBundlePrices] ([MerchantId], [BundleId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 1, 1, 1, N'INR', CAST(5999.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-02-03 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductBundlePrices] ([MerchantId], [BundleId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 1, 1, 1, N'USD', CAST(299.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'2021-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductBundlePrices] ([MerchantId], [BundleId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 3, 1, N'INR', CAST(799.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-02-03 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductBundlePrices] ([MerchantId], [BundleId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 3, 1, N'USD', CAST(29.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-02-03 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductBundles] ([MerchantId], [BundleId], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 1, 1, CAST(N'2021-02-04 13:04:33.897' AS DateTime), NULL)
INSERT [dbo].[MerchantProductBundles] ([MerchantId], [BundleId], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 1, CAST(N'2021-02-04 13:05:43.363' AS DateTime), NULL)
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 1, 1, N'USD', CAST(29.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 2, 1, N'USD', CAST(6.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 3, 1, N'USD', CAST(14.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 4, 1, N'USD', CAST(14.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 0, CAST(N'2021-01-26 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 5, 1, N'USD', CAST(19.9900 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-27 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 3, 1, 1, N'USD', CAST(29.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'2021-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProductPrices] ([MerchantId], [ProductId], [LicenseType], [PriceType], [CurrencyCode], [PriceA], [PriceB], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 3, 2, 1, N'USD', CAST(29.0000 AS Decimal(10, 4)), CAST(0.0000 AS Decimal(10, 4)), 1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'9999-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 2, 8.5, 1, CAST(N'2021-01-02 22:46:17.690' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 3, 0, 1, CAST(N'2021-01-02 22:49:42.343' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 4, 0, 1, CAST(N'2021-01-03 14:32:12.137' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 5, 0, 1, CAST(N'2021-01-07 18:17:49.143' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 6, 0, 1, CAST(N'2021-01-07 18:23:57.690' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 7, 0, 1, CAST(N'2021-01-07 18:28:24.707' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 8, 0, 1, CAST(N'2021-01-07 19:26:17.347' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 9, 0, 1, CAST(N'2021-01-07 20:02:56.150' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 10, 0, 1, CAST(N'2021-01-07 20:04:47.940' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 11, 0, 1, CAST(N'2021-01-07 20:06:50.573' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 12, 0, 1, CAST(N'2021-01-07 20:09:16.497' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 13, 0, 1, CAST(N'2021-01-07 20:12:00.263' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 14, 0, 1, CAST(N'2021-01-07 20:14:48.700' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 15, 4, 1, CAST(N'2021-02-23 19:45:54.213' AS DateTime), NULL)
INSERT [dbo].[MerchantProducts] ([MerchantId], [ProductId], [CPDHours], [IsActive], [ActiveFrom], [ActiveTo]) VALUES (24, 16, NULL, 1, CAST(N'2021-02-23 21:09:30.800' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Merchants] ON 

INSERT [dbo].[Merchants] ([MerchantId], [MerchantCompany], [MerchantAbbrName], [AddressLine1], [AddressLine2], [AddressLine3], [City], [StateId], [CountryId], [ZipCode], [MerchantHomePage], [MerchantRegistrationPage], [InvoicePrefix], [LogoPath], [MobileLogoPath], [InternalLogoPath], [SiteTitle], [SiteDescription], [AllowUserRegistration], [DateFormat], [TimeZoneOffset], [TemplateTheme], [IsActive], [ActiveFrom], [PaymentGatewayURL], [ShoppingCartURL], [PaymentGatewayAPIURL], [PaymentGatewayAPIUsername], [PaymentGatewayAPIPassword], [PaymentGatewaySecretPassword], [PaymentGatewayResponseURL], [DefaultCurrencyId], [eLearningPassingScore], [EmailTemplatesPostId], [SupportECommerce], [SupportMultiplePrices], [BrandLogoPath], [EnableSingleSignOn], [PublicKey], [SSOReturnURL], [SSOLogoutURL], [FreeTrialProductUniqueCode], [NotificationsEmailAddress]) VALUES (24, N'Ebix Inc', N'ADAM', N'1 Ebix Way', N'', N'', N'ABC', 19, N'US', N'30097', N'AODIndex', N'AODRegistration', N'A1', N'Content/images/client_logos/ADAM/logo.png', N'Content/images/client_logos/ADAM/mobile-logo.png', N'', N'A.D.A.M. OnDemand Medical eLearning', N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical eLearning programs for professionals in the pharmaceutical and healthcare industries, students, and patients.', 0, N'', N'', NULL, 1, CAST(N'2020-10-18 19:42:39.757' AS DateTime), N'f', N'f', N'f', N'f', N'f', N'f', N'f', N'USD', 80, 2015413, 1, 0, N'Content/images/client_logos/ADAM/ebix.png', NULL, N'', N'', N'', N'', N'aod-support@ebix.com')
SET IDENTITY_INSERT [dbo].[Merchants] OFF
SET IDENTITY_INSERT [dbo].[MerchantUserGroups] ON 

INSERT [dbo].[MerchantUserGroups] ([MerchantId], [UserGroupId], [UserGroupName], [IsActive]) VALUES (24, 14, N'AOD-Group', 1)
SET IDENTITY_INSERT [dbo].[MerchantUserGroups] OFF
SET IDENTITY_INSERT [dbo].[MetaGroups] ON 

INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (1, N'Course Features:', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (2, N'Description', 10, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (3, N'Learning Objectives', 10, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (4, N'Outline', 10, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (5, N'Emails', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (6, N'Anmf Registration', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (7, N'DemoSite Product', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (8, N'Demo Credentials', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (9, N'DemoSite User', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (10, N'AODRegistration', 0, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (11, N'Course Path', 1, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (12, N'SEO', 5, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (13, N'Dashbrd Tab', 5, 1)
INSERT [dbo].[MetaGroups] ([MetaGroupId], [MetaGroupName], [DisplayOrder], [IsActive]) VALUES (14, N'Oakstone Registration', 1, 1)
SET IDENTITY_INSERT [dbo].[MetaGroups] OFF
SET IDENTITY_INSERT [dbo].[MetaKeys] ON 

INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (1, 1, N'course_cpd_hours', N'Course cpd hours', 1, 1, 2, N'', 0, 0, 9999, 1, NULL, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (2, 2, N'course_description', N'Course description', 1, 2, 1, N'', 0, 0, 10000, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (3, 1, N'course_features', N'Course features', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (4, 1, N'course_language', N'Course language', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (5, 1, N'course_length', N'Course length', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (7, 1, N'course_target_audience', N'Course target audience', 1, 1, 1, N'', 1, 0, 500, 1, NULL, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (8, 1, N'course_video_url', N'Course video url', 1, 1, 1, N'', 0, 0, 500, 0, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (9, 1, N'isFlashOnly', N'isFlashOnly', 1, 5, 4, N'', 0, 0, 500, 0, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (10, 1, N'isNew', N'isNew', 1, 5, 4, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (11, 3, N'learning_objective_content', N'Learning objective content', 1, 1, 1, N'', 1, 0, 500, 1, 0, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (12, 3, N'learning_objectives', N'Learning objective', 1, 1, 1, N'', 1, 0, 2000, 1, 0, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (13, 1, N'related_courses', N'Related courses', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (14, 1, N'isUpdated', N'isUpdated', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (15, 4, N'course_outline', N'Course outline', 1, 2, 1, N'', 0, 0, 7000, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (16, 11, N'Course_Path', N'Course Path', 1, 1, 1, N'', 0, 0, 2000, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (17, 11, N'TotalVisibleSlides', N'Total Visible Slides', 1, 1, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (18, 12, N'Meta_Description', N'Meta Description', 1, 2, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
INSERT [dbo].[MetaKeys] ([MetaId], [MetaGroupId], [KeyName], [KeyDisplay], [TemplateId], [KeyControlType], [KeyDataType], [DefaultValue], [Mandatory], [DisplayOrder], [MaxLength], [IsActive], [LookupGroupId], [ConditionalMetaId], [ConditionalMetaValue]) VALUES (19, 12, N'Meta_Keyword', N'Meta Keyword', 1, 2, 1, N'', 0, 0, 500, 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[MetaKeys] OFF
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 2, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 3, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 4, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 5, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 6, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 7, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 8, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 9, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 10, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 11, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 12, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 13, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (1, 14, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 2, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 3, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 4, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 5, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 6, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 7, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 8, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 9, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 10, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 11, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 12, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 13, 1)
INSERT [dbo].[ProductBundleProducts] ([BundleId], [ProductId], [IsActive]) VALUES (2, 14, 1)
SET IDENTITY_INSERT [dbo].[ProductBundles] ON 

INSERT [dbo].[ProductBundles] ([BundleId], [BundleName], [IsCompanyBundle], [CompanyId], [CreatorMerchantId], [IsActive], [DisplayOrder]) VALUES (1, N'Complete Library', 1, 1, 24, 1, 1)
INSERT [dbo].[ProductBundles] ([BundleId], [BundleName], [IsCompanyBundle], [CompanyId], [CreatorMerchantId], [IsActive], [DisplayOrder]) VALUES (2, N'Complete Library', 1, 1, 24, 1, 2)
SET IDENTITY_INSERT [dbo].[ProductBundles] OFF
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 2, N'This learning program is designed to introduce you to the anatomy and physiology of the breast. The program begins with a brief overview of the external and internal structures of the breast. You will then learn about how hormones contribute to the development and function of the breast, and how milk production and secretion work. Finally, you will learn how the breast changes with age.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 3, N'Audio narration|Animations|Progress checks|Pop quizzes|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 5, N'27 topics|45 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 11, N'Identify the external structures of the breast.|Identify the internal structures of the breast.|Describe the role of hormones in the lactation process.|Summarize how the breast changes with age.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 13, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 15, N'<ol>
        <li>Sound Check</li>
        <li>
            Welcome
            <ol>
                <li>Disclaimer</li>
                <li>
                    Navigation Instructions
                </li>
                <li>
                    Introduction
                </li>
                <li>
                    Learning Objectives
                </li>
            </ol>
        </li>
        <li>
            Anatomy Of The Breast
            <ol>
                <li>
                    Overview
                </li>    
                <li>
                    External Structures
                </li>
                <li>
                    Popup: Skin
                </li>
                <li>
                    Popup: Areola And Nipple
                </li>
                <li>
                    Internal Structures
                    
                    <ol>
                        <li>
                            Lobe Anatomy
                        </li>            
                        <li>
                            Duct Anatomy
                        </li>
                        <li>
                            Progress Check
                        </li>
                        <li>
                            Pectoralis Major
                        </li>
                        <li>
                            Connective Tissue
                        </li>
                        <li>
                            Popup: Pectoral Fascia
                        </li>
                        <li>
                            Popup: Cooper’s Ligaments
                        </li>
                        <li>
                            Popup: Adipose Tissue
                        </li>
                    </ol>
               </li>
                <li>Progress Check</li>
                <li>Section Summary</li>
            </ol>
        </li>	
        <li>
            Physiology Of The Breast
            <ol>
                <li>Overview</li>
                <li>Side Note: Did You Know?</li>
                <li>Milk Production And Secretion</li>
                <li>Slideshow: Milk Production And Secretion Reflex</li>
                <li>Animated Popup: Prolactin Effects</li>
                <li>Popup: Other Hormones</li>
                <li>Milk Ejection</li>
                <li>Slideshow: Milk Ejection Reflex</li>
                <li>Side Note: Did You Know?</li>
                <li>
                    Breast Changes With Aging
                    <ol>
                        <li>Non–cancer-related Changes</li>
                        <li>Cancer Risk</li>
                    </ol>
                </li>
                <li>Progress Check</li>
                <li>Section Summary</li>
            </ol>
        </li>
        <li>
            Test Your Acquired Knowledge
            
            <ol>
                <li>Summary</li>
                <li>Final Assessment</li>
            </ol>
        </li>
        <li>End Of Program	</li>
        <li>Glossary	</li>
        <li>References	</li>
    </ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 18, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Anatomy and Physiology of the Breast learning program.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (2, 19, N'Understanding the Anatomy of the Visual System, Understanding the Anatomy of the Visual System, Understanding the Physiology of the Visual System, Understanding the Physiology of the Visual System, Anatomy and Physiology of the Breast, Understanding the Anatomy of the Respiratory System,')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 2, N'This learning program is designed to introduce you to the basic principles of hematology, specifically the cells, tissues and organs that comprise the hematopoietic system. You will learn about the various cellular and non-cellular components of blood, how blood cells are formed (hematopoiesis) and the different types of blood cells that protect the body against injury, infection, and disease. You will also learn about the functions of the blood, with a focus on the hemostatic or clotting response and the mechanisms through which it is regulated. The program concludes with a discussion of blood groups and the principles underlying blood transfusion.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 3, N'Audio narration|Animations|Progress Checks|Pop Quizzes|Final Assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 5, N'42 topics|50 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 11, N'Identify the cellular and non-cellular components of blood|Understand the normal formation and development of blood cells|Describe the structure of white blood cells|Describe the structure of red blood cells and the importance of hemoglobin|Describe the origin of platelets|Summarize the functions of blood|Explain the hematopoietic cascade and its regulation|Summarize the factors and mechanisms involved in coagulation, fibrinolysis and anticoagulatio')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 13, N'07011109,04011109')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 15, N'<ol>
<li> Getting Started
<ol>
<li> Sound Check</li>
<li> Disclaimer</li>
<li> Welcome</li>
<li> Navigation Instructions</li>
</ol>
</li>
<li> Staying Focused
<ol>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> Test your Current Knowledge
<ol>
<li> Pretest</li>
</ol>
</li>
<li> Components of Blood
<ol>
<li> Plasma
<ol>
<li> Plasma proteins</li>
<li> Soluble gases</li>
<li> Electrolytes</li>
<li> Nutrients</li>
</ol>
</li>
<li> Formed Elements
<ol>
<li> Red blood cells</li>
<li> White blood cells</li>
<li> Platelets</li>
</ol>
</li>
<li> Progress Check</li>
</ol>
</li>
<li> Functions of Blood
<ol>
<li> Transportation
<ol>
<li> Exchange of gases (O2/CO2)</li>
<li> Exchange of nutrient/waste</li>
<li> Messenger functions</li>
</ol>
</li>
<li> Regulation
<ol>
<li> Maintenance of homeostasis</li>
</ol>
</li>
<li> Protection
<ol>
<li> Hemostasis</li>
<li> The Immune Response</li>
</ol>
</li>
<li> Progress Check</li>
</ol>
</li>
<li> Hematopoiesis
<ol>
<li> Hematopoieitic Cascade and its Regulation
<ol>
<li> Hematopoietic stem cell</li>
<li> Hematopoiesis</li>
</ol>
</li>
<li> Generative Lymphoid Tissue
<ol>
<li> Fetal liver</li>
<li> Bone marrow</li>
<li> Thymus</li>
</ol>
</li>
<li> Secondary Lymphoid Tissue
<ol>
<li> Spleen</li>
<li> Lymph nodes</li>
</ol>
</li>
<li> Leukocytes
<ol>
<li> Agranulocytes</li>
<li> Granulocytes</li>
</ol>
</li>
<li> Erythrocytes
<ol>
<li> Erythropoiesis: Production of Red Blood Cells</li>
<li> Anatomy of a Red Blood Cell</li>
</ol>
</li>
<li> Platelets</li>
<li> Progress Check</li>
</ol>
</li>
<li> Hemostasis
<ol>
<li> The Hemostatic Response
<ol>
<li> Vasoconstriction</li>
<li> Platelet plug formation</li>
<li> Blood coagulation</li>
<li> Clot retraction</li>
</ol>
</li>
<li> Hemostatic Control Mechanisms
<ol>
<li> Fibrinolysis</li>
<li> Anti-clotting mechanisms</li>
</ol>
</li>
<li> Progress Check</li>
</ol>
</li>
<li> Blood Groups
<ol>
<li> ABP Blood Antigen Group</li>
<li> Rh Blood Antigen Group</li>
<li> Transfusions</li>
<li> Progress Check</li>
</ol>
</li>
<li> Test your Acquired Knowledge
<ol>
<li> Summary</li>
<li> Posttest</li>
</ol>
</li>
<li> Conclusion</li>
<li> Glossary</li>
<li> References
<ul>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 18, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (3, 19, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 2, N'Sleep is a crucial component of our health and well-being, and sleep disorders such as narcolepsy can have a significant impact on the functioning of those who suffer from them. The clinical management of such disorders is best taken care of by a sleep specialist.

This learning program is designed to introduce you to the clinical management of narcolepsy. The program begins with an overview of the diagnosis of narcolepsy. You will learn about the basics of narcolepsy treatment and the management of narcolepsy-associated symptoms. You will also learn about emerging therapies for narcolepsy.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 3, N'Audio narration|Animations|Progress checks|Pop quizzes|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 5, N'26 topics|40 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 11, N'Identify the ICSD-2’s diagnostic criteria for the 3 forms of narcolepsy.|Outline the approaches to diagnosing key symptoms associated with narcolepsy.|Describe the treatment goals and approaches for narcolepsy.|Recall the major types of approved treatments for narcolepsy.|List emerging therapies in the treatment of narcolepsy.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 13, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 15, N'<ol>
<li> Getting Started
<ol>
<li> Sound Check</li>
<li> Disclaimer</li>
<li> Welcome</li>
<li> Navigation Instructions</li>
</ol>
</li>
<li> Staying Focused
<ol>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> Diagnosing Narcolepsy
<ol>
<li> Overview</li>
<li> Basic Diagnostic Procedure
<ul>
<li>Side Note: Clinical Insights</li>
</ul>
</li>
<li> Diagnostic Criteria
<ul>
<li>Popup: Narcolepsy With Cataplexy</li>
<li>Popup: Narcolepsy Without Cataplexy</li>
<li>Popup: Secondary Narcolepsy</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Challenges</li>
<li> Diagnosing Eds
<ul>
<li>Side Note: Clinical Insights</li>
</ul>
</li>
<li> Diagnosing Cataplexy</li>
<li> Progress Check</li>
</ol>
</li>
<li> Treatment Of Narcolepsy
<ol>
<li> Introduction</li>
<li> Nonpharmacological Options</li>
<li> Pop Quiz</li>
<li> Pharmacological Options For Eds
<ol>
<li> Stimulants</li>
<li> Wake-promoting Agents</li>
<li> Sodium Oxybate
<ul>
<li>Side Note: Digging Deeper</li>
</ul>
</li>
</ol>
</li>
<li> Pop Quiz</li>
<li> Management Of Other Narcolepsy-associated Symptoms
<ul>
<li>Popup: Cataplexy</li>
<li>Popup: Disrupted Nocturnal Sleep</li>
<li>Popup: Hypnagogic Hallucinations And Sleep Paralysis</li>
</ul>
</li>
<li> Progress Check</li>
<li> Emerging Therapies
<ul>
<li>Popup: Hypocretin-based Therapies</li>
<li>Popup: Histamine-based Therapies</li>
<li>Popup: Endocrine-based Therapies</li>
<li>Popup: Immunotherapy</li>
</ul>
</li>
<li> Pop Quiz</li>
</ol>
</li>
<li> Test Your Acquired Knowledge
<ol>
<li> Summary</li>
<li> Final Assessment</li>
</ol>
</li>
<li> End Of Program</li>
<li> Glossary</li>
<li> References</li>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 18, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Clinical Management of Narcolepsy.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (4, 19, N'Understanding the Anatomy of the Visual System, Understanding the Anatomy of the Visual System, Understanding the Physiology of the Visual System, Understanding the Physiology of the Visual System, Anatomy and Physiology of the Breast, Understanding the Anatomy of the Respiratory System,')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 2, N'The Clinical Management Strategies in Acute Lymphoblastic Leukemia learning program is designed to give insight into the treatment regimen of acute lymphoblastic leukemia (ALL) in children, adolescents, and adults. It also discusses risk stratification. What are the main treatment protocols and guidelines for ALL? Is therapy different in children than in adults? How does the Philadelphia chromosome, an important ALL prognostic factor, influence the treatment options for a patient? What is “CNS prophylaxis”? This program aims to provide answers to these questions.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 3, N'Audio narration|Progress checks|Animations|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 5, N'27 topics|60 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 7, N'Medical students|Pharmaceutical representatives|	Nurses')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 11, N'Recall key information about the ALL treatment guidelines.|Recall the specifics of the ALL treatment environment.|Discuss the assessment of response to ALL treatment.|Describe the treatment pathways in pediatric ALL patients.|Describe the treatment pathways in adult ALL patients.|List the complications that can arise during ALL treatment and describe their management.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 12, N'Upon completion of this learning program  you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 13, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 15, N'<ol>
<li>Welcome
<ol>
<li> Disclaimer</li>
<li> Navigation Instructions</li>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> Treatment Strategies And Guidelines
<ol>
<li> Introduction</li>
<li> Treatment Guidelines For All</li>
<li> The All Treatment Environment</li>
<li> Pop Quiz </li>
<li> Assessment Of Response To All Treatment </li>
<li> Progress Check </li>
<li> Section Summary </li>
</ol>
</li>
<li> Treatment Pathways For Pediatric Patients 
<ol>
<li> Phases Of Treatment </li>
<li> The Berlin-Frankfurt-Münster Protocol </li>
<li> Risk-Based Treatment Assignment </li>
<li> Pop Quiz </li>
<li> Treatment Of All Pediatric Patients </li>
<li> Cns Prophylaxis </li>
<li> Treatment Of Refractory All In Children </li>
<li> Treatment Of Relapsed All In Children </li>
<li> Allogeneic Stem Cell Transplantation </li>
<li> Progress Check </li>
<li> Section Summary </li>
</ol>
</li>
<li> Treatment Pathways For Adult Patients 
<ol>
<li> Introduction </li>
<li> Treatment Protocols In Adults </li>
<li> Risk Stratification For Aya And Adult All Patients </li>
<li> Pop Quiz </li>
<li> Treatment Of Aya Patients </li>
<li> Treatment Of Adult Patients </li>
<li> Cns Prophylaxis </li>
<li> Treatment Of Refractory Or Relapsed Disease In Adults </li>
<li> Allogeneic Stem Cell Transplantation </li>
<li> Progress Check </li>
<li> Section Summary </li>
</ol>
</li>
<li> Managing Treatment Complications 
<ol>
<li> Introduction </li>
<li> Side Effects Of Chemotherapy </li>
<li> Infections </li>
<li> Bleeding </li>
<li> Progress Check </li>
<li> Section Summary </li>
</ol>
</li>
<li> Test Your Acquired Knowledge
<ol>
<li> Summary</li>
<li> Final Assessment</li>
</ol>
</li>
<li> End Of Program</li>
<li> Glossary</li>
<li> References</li>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 18, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Clinical Management Strategies in Acute Lymphoblastic Leukemia learning program.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (5, 19, N'Understanding the Anatomy of the Visual System, Understanding the Anatomy of the Visual System, Understanding the Physiology of the Visual System, Understanding the Physiology of the Visual System, Anatomy and Physiology of the Breast, Understanding the Anatomy of the Respiratory System,')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 2, N'This learning program is designed to introduce you to hematological malignancies. The program begins with a brief review of normal hematopoietic differentiation and then moves on to provide an overview of the main hematological malignancies. You will then learn about the classification, staging, epidemiology, risk factors, and treatment of hematological malignancies. You will also learn about the economic impact of hematological malignancies.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 3, N'Audio narration|Animations|Progress checks|Pop quizzes|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 5, N'31 topics|48 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 11, N'Define the various hematological malignancies.|Recall the classification of hematological malignancies.|List the clinical tools for staging hematological malignancies.|Describe the epidemiology of hematological malignancies.|List the risk factors of hematological malignancies.|Outline the treatment options for hematological malignancies.|Recall the economic impact of hematological malignancies.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 13, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 15, N'<ol>
<li> Sound Check </li>
<li> Welcome 
<ol>
<li> Disclaimer</li>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> Hematological Malignancies 
<ol>
<li> Normal Hematopoietic Differentiation
<ul>
<li>Slideshow: Normal Hematopoietic Differentiation</li>
<li>Side Note: Digging Deeper</li>
</ul>
</li>
<li> Normal Hematopoietic Differentiation (Continued)
<ul>
<li>Popup: Progenitor Cells</li>
<li>Popup: Precursor Cells</li>
<li>Popup: Formed Elements</li>
</ul>
</li>
<li> Abnormal Hematopoietic Differentiation
<ul>
<li>Animation: Leukemic Cell Proliferation</li>
</ul>
</li>
<li> Leukemia
<ul>
<li>Slideshow: The 4 Types Of Leukemia</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Lymphoma
<ul>
<li>Popup: Lymphoma Versus Leukemia</li>
</ul>
</li>
<li> Lymphoma (Continued)
<ul>
<li>Popup: Hodgkin Lymphoma</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Multiple Myeloma
<ul>
<li>Popup: Malignant Plasma Cells</li>
</ul>
</li>
<li> Myelodysplastic Syndromes
<ul>
<li>Popup: Myelodysplastic Syndromes</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Classification
<ul>
<li>Popup: 2001 Classification</li>
<li>Popup: 2001 Publication And 2008 Revision</li>
</ul>
</li>
<li> Clinical Staging
<ul>
<li>Popup: Rai Staging System</li>
<li>Popup: Binet Staging System</li>
<li>Popup: Ann Arbor Staging System</li>
<li>Popup: Durie-salmon Staging System</li>
<li>Popup: International Staging System</li>
</ul>
</li>
<li> Progress Check</li>
</ol>
</li>
<li> Epidemiology, Treatment, And Economic Impact 
<ol>
<li> Epidemiology
<ul>
<li>Popup: New Cases Diagnosed Worldwide</li>
<li>Popup: New Cases Diagnosed In The United States</li>
<li>Popup: Leukemia And Lymphoma In The United States</li>
</ul>
</li>
<li> Epidemiology In Childhood</li>
<li> Epidemiology In Childhood (Continued)</li>
<li> Pop Quiz</li>
<li> Risk Factors
<ul>
<li>Popup: Risk Factors For Leukemia</li>
<li>Popup: More Risk Factors For Other Hematological Malignancies</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Treatment
<ul>
<li>Popup: Treatment Options</li>
<li>Side Note: Clinical Insights</li>
</ul>
</li>
<li> Economic Impact
<ul>
<li>Popup: The Wider Economic Impact Of Cancer</li>
</ul>
</li>
<li> Progress Check</li>
</ol>
</li>
<li> Test Your Acquired Knowledge 
<ol>
<li> Summary</li>
<li> Final Assessment</li>
</ol>
</li>
<li> End Of Program </li>
<li> Glossary </li>
<li> References </li>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 18, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Introduction to Hematological Malignancies learning program.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (6, 19, N'Understanding the Anatomy of the Visual System, Understanding the Anatomy of the Visual System, Understanding the Physiology of the Visual System, Understanding the Physiology of the Visual System, Anatomy and Physiology of the Breast, Understanding the Anatomy of the Respiratory System,')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 1, N'2')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 2, N'Most, if not all, of us have already experienced what it is like to have difficulties falling asleep, to lie awake in the middle of the night, or to feel tired and drowsy during the day. But eventually we will recover after a good night’s sleep. However, when sleep problems occur regularly, they can prevent a person from effectively going on with their daily routine, and hamper their ability to function normally. At this point, it should be considered that a sleep disorder may be the underlying cause of the sleep problems.

This learning program is designed to introduce you to sleep disorders, which are of many kinds and have many different causes. The program begins with an overview of the tools used for measuring sleep, including tools for both subjective and objective evaluation of potentially abnormal patterns of sleep. You will briefly learn about the main system used to classify sleep disorders. The program concludes with a detailed description of each class of sleep disorder, and of some of the major disorders included in each class.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 3, N'Audio narration|Animations|Progress checks|Pop quizzes|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 4, N'English')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 5, N'31 topics|49 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 11, N'List the many beneficial effects of sleep.|Recall the factors impacting sleep and the consequences of sleep deprivation.|Describe the neurological pathways involved in wakefulness and sleep.|Identify the neurotransmitters involved in sleep.|Match the distinctive stages of sleep with their characteristic features.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 13, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 15, N'<ol>
<li> Getting Started 
<ol>
<li> Sound Check</li>
<li> Disclaimer</li>
<li> Welcome</li>
<li> Navigation Instructions</li>
</ol>
</li>
<li> Staying Focused 
<ol>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> Measuring Sleep </li>
<li> Subjective Measurements 
<ol>
<li> Overview</li>
<li> Stanford Sleepiness Scale</li>
<li> Epworth Sleepiness Scale
<ul>
<li>Side Note: Digging Deeper</li>
</ul>
</li>
<li> Progress Check</li>
<li> Other Subjective Measurements
<ul>
<li>Side Note: Digging Deeper</li>
</ul>
</li>
<li> Pop Quiz</li>
</ol>
</li>
<li> Objective Measurements
<ol>
<li> Overview</li>
<li> Polysomnography
<ul>
<li>Popup: Electroencephalogram</li>
<li>Popup: Electrooculogram</li>
<li>Popup: Electromyogram</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Multiple Sleep Latency Test</li>
<li> Maintenance Of Wakefulness Test</li>
<li> Progress Check</li>
</ol>
</li>
<li> Sleep Disorders
<ol>
<li> Overview</li>
<li> The International Classification Of Sleep Disorders</li>
<li> Pop Quiz</li>
<li> Insomnias</li>
<li> Pop Quiz</li>
<li> Sleep-related Breathing Disorders
<ul>
<li>Popup: Central Sleep Apnea</li>
<li>Popup: Obstructive Sleep Apnea</li>
<li>Popup: Sleep-related Hypoventilation And Hypoxemia</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Hypersomnias
<ul>
<li>Side Note: Did You Know?</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Circadian Rhythm Sleep Disorders</li>
<li> Pop Quiz</li>
<li> Parasomnias</li>
<li> Pop Quiz</li>
<li> Sleep-related Movement Disorders
<ul>
<li>Popup: Restless Leg Syndrome</li>
<li>Popup: Periodic Limb Movement Disorder</li>
<li>Popup: Bruxism</li>
</ul>
</li>
<li> Pop Quiz</li>
<li> Isolated Symptoms</li>
<li> Other Sleep Disorders</li>
<li> Progress Check</li>
</ol>
</li>
<li> Test Your Aquired Knowledge
<ol>
<li> Summary</li>
<li> Final Assessment</li>
</ol>
</li>
<li> Glossary </li>
<li> End Of Program</li>
<li> References</li>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 16, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Introduction to Sleep Disorders.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 17, N'Understanding the Anatomy of the Visual System, Understanding the Anatomy of the Visual System, Understanding the Physiology of the Visual System, Understanding the Physiology of the Visual System, Anatomy and Physiology of the Breast, Understanding the Anatomy of the Respiratory System,')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 18, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (7, 19, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 1, N'1')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 2, N'This program is designed to introduce you to the main features of the cardiovascular system and how they work together to carry out their important functions in the body. The program begins with an overview of the cardiovascular system, followed by an explanation of its components and function. You will then learn about the different components in the blood and how they relate to hemostasis. You will also learn about the structure of the heart, about the cardiac cycle, and about the conduction system, which ensures the rhythmicity of the pulse. And lastly, you will learn about the different types of blood vessels and the roles they play in hemodynamics and blood pressure.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 3, N'Audio narration|Animations|Progress checks|Pop quizzes|Final assessment|Completion certificate')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 4, N'English')
GO
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 5, N'48 topics|45 minutes of seat time')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 7, N'Nurses|Midwives|Student Nurses and Midwives|AIN’s/PCA’s|Medical Professionals|Medical Students|Allied Health Professionals')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 10, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 11, N'Identify primary components of the cardiovascular system and their function.|Link the components of blood to their functions.|Describe the structure and function of the heart.|Relate the cardiac cycle to the electrocardiogram.|Understand factors that affect blood flow through the cardiovascular system.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 12, N'Upon completion of this learning program, you will be able to:')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 13, N'04011109,06011109,07011109')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 14, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 15, N'<ol>
<li> Getting Started
<ol>
<li> Sound Check</li>
<li> Disclaimer</li>
<li> Welcome</li>
<li> Navigation Instructions</li>
</ol>
</li>
<li> Staying Focused
<ol>
<li> Introduction</li>
<li> Learning Objectives</li>
</ol>
</li>
<li> The Cardiovascular System
<ol>
<li> Overview
<ul>
<li>Pop Up: Carotid Arteries</li>
<li>Pop Up: Aorta</li>
<li>Pop Up: Vena Cava</li>
<li>Pop Quiz</li>
</ul>
</li>
<li> Components And Function
<ul>
<li>Pop Quiz</li>
</ul>
</li>
</ol>
</li>
<li> The Blood
<ol>
<li> Blood Function
<ul>
<li>Side Note – Did You Know?</li>
<li>Progress Check</li>
</ul>
</li>
<li> Blood Components
<ul>
<li>Pop Up: Red Blood Cells</li>
<li>Pop Up: White Blood Cells</li>
<li>Pop Up: Platelets</li>
<li>Side Note – Digging Deeper</li>
<li>Progress Check</li>
</ul>
</li>
<li> Hemostasis
<ul>
<li>Side Note – Did You Know?</li>
<li>Progress Check</li>
</ul>
</li>
</ol>
</li>
<li> The Heart
<ol>
<li> Heart Structure
<ul>
<li>Pop Up: Right Atrium</li>
<li>Pop Up: Left Atrium</li>
<li>Pop Up: Right Ventricle</li>
<li>Pop Up: Left Ventricle</li>
<li>Pop Up: Bicuspid Valve</li>
<li>Pop Up: Tricuspid Valve</li>
<li>Pop Up: Aortic Valve</li>
<li>Pop Up: Pulmonary Valve</li>
<li>Progress Check</li>
</ul>
</li>
<li> The Cardiac Cycle
<ul>
<li>Side Note – Did You Know?</li>
<li>Side Note – Did You Know?</li>
<li>Progress Check</li>
</ul>
</li>
<li> Paths Of Circulation
<ul>
<li>Pop Up: Afferent Arteriole</li>
<li>Pop Up: Efferent Arteriole</li>
<li>Pop Up: Bowman’s Capsule</li>
<li>Pop Up: Glomerulus</li>
<li>Pop Quiz</li>
</ul>
</li>
<li> Coronary Circulation</li>
<li> Coronary Arteries
<ul>
<li>Pop Quiz</li>
</ul>
</li>
<li> Coronary Veins</li>
<li> The Conduction System
<ul>
<li>Slider Bar Animation: Electrocardiogram Recordings</li>
<li>Side Note – Digging Deeper</li>
<li>Progress Check</li>
</ul>
</li>
<li> Cardiac Output
<ul>
<li>Side Note – Digging Deeper</li>
</ul>
</li>
<li> Stroke Volume
<ul>
<li>Pop Quiz</li>
</ul>
</li>
</ol>
</li>
<li> The Blood Vessels
<ol>
<li> Overview</li>
<li> Vessels Types – Arteries
<ul>
<li>Side Note – Digging Deeper</li>
<li>Pop Quiz</li>
</ul>
</li>
<li> Vessels Types – Veins</li>
<li> Vessels Types – Capillaries
<ul>
<li>Progress Check</li>
</ul>
</li>
<li> The Major Arteries
<ul>
<li>Pop Quiz</li>
</ul>
</li>
<li> The Major Veins
<ul>
<li>Side Note – Did You Know?</li>
</ul>
</li>
<li> Hemodynamics
<ul>
<li>Side Note – Did You Know?</li>
<li>Pop Quiz</li>
</ul>
</li>
<li> Blood Pressure
<ul>
<li>Side Note – Did You Know?</li>
<li>Pop Quiz</li>
</ul>
</li>
<li> Blood Pressure Regulation
<ul>
<li>Slideshow: Angiotensin And Blood Pressure</li>
<li>Side Note – Did You Know?</li>
</ul>
</li>
</ol>
</li>
<li> Test Your Acquired Knowledge
<ol>
<li> Summary</li>
<li> Final Assessment</li>
</ol>
</li>
<li> End Of Program</li>
<li> Glossary</li>
<li> References</li>
</ol>')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 16, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 17, N'')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 18, N'A.D.A.M. OnDemand is the most comprehensive library of off-the-shelf medical programs including Introduction to the Cardiovascular System learning program.')
INSERT [dbo].[ProductMetaData] ([ProductId], [MetaId], [MetaValue]) VALUES (8, 19, N'A.D.A.M. OnDemand™ Introduction to the Cardiovascular System, The Principles of Cardiac Catheterization, The Principles of Cardiac Catheterization, The Cardiac Catheterization Patient Experience,Understanding the Anatomy of the Skin')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (2, 1, 1, N'Anatomy and Physiology of the Breast', N'11014009', N'AnatomyandPhysiologyoftheBreast', N'', 0, 0, 1, 1, CAST(N'2021-01-02 22:43:04.073' AS DateTime), CAST(N'2021-01-02 22:43:04.073' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (3, 1, 1, N'Blood Anatomy and Physiology', N'05011009', N'BloodAnatomyandPhysiology', N'', 0, 0, 1, 1, CAST(N'2021-01-02 22:49:42.290' AS DateTime), CAST(N'2021-01-02 22:49:42.290' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (4, 1, 1, N'Clinical Management of Narcolepsy', N'07044109', N'ClinicalManagementofNarcolepsy', N'', 0, 0, 1, 1, CAST(N'2021-01-03 14:32:11.990' AS DateTime), CAST(N'2021-01-03 14:32:11.990' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (5, 1, 1, N'Clinical Management Strategies in Acute Lymphoblastic Leukemia', N'08052009', N'ClinicalManagementStrategiesinAcuteLymphoblasticLeukemia', N'', 0, 0, 1, 1, CAST(N'2021-01-07 18:17:48.350' AS DateTime), CAST(N'2021-01-07 18:17:48.350' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (6, 1, 1, N'Introduction to Hematological Malignancies', N'08050009', N'IntroductiontoHematologicalMalignancies', N'', 0, 0, 1, 1, CAST(N'2021-01-07 18:23:57.680' AS DateTime), CAST(N'2021-01-07 18:23:57.680' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (7, 1, 1, N'Introduction to Sleep Disorders', N'07043009', N'IntroductiontoSleepDisorders', N'', 0, 0, 1, 1, CAST(N'2021-01-07 18:28:24.697' AS DateTime), CAST(N'2021-01-07 18:28:24.697' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (8, 1, 1, N'Introduction to the Cardiovascular System', N'01011009', N'IntroductiontotheCardiovascularSystem', N'', 0, 0, 1, 1, CAST(N'2021-01-07 19:26:17.230' AS DateTime), CAST(N'2021-01-07 19:26:17.230' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (9, 1, 1, N'Nutrition', N'18010109', N'Nutrition', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:02:56.130' AS DateTime), CAST(N'2021-01-07 20:02:56.130' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (10, 1, 1, N'Opioids', N'18010309', N'Opioids', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:04:47.900' AS DateTime), CAST(N'2021-01-07 20:04:47.900' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (11, 1, 1, N'The Anatomy of a Clinical Reprint', N'15015009', N'TheAnatomyofaClinicalReprint', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:06:50.563' AS DateTime), CAST(N'2021-01-07 20:06:50.563' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (12, 1, 1, N'The Pharmaceutical Industry – From Lab to Market', N'15011009', N'ThePharmaceuticalIndustry–FromLabtoMarket', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:09:16.483' AS DateTime), CAST(N'2021-01-07 20:09:16.483' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (13, 1, 1, N'The Principles of Cardiac Catheterization', N'01061109', N'ThePrinciplesofCardiacCatheterization', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:12:00.253' AS DateTime), CAST(N'2021-01-07 20:12:00.253' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (14, 1, 1, N'The Principles of Cardiac Catheterization Patient Experience', N'01061509', N'ThePrinciplesofCardiacCatheterizationPatientExperience', N'', 0, 0, 1, 1, CAST(N'2021-01-07 20:14:48.690' AS DateTime), CAST(N'2021-01-07 20:14:48.690' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (15, 1, 1, N'Understanding Acute Lymphoblastic Leukemia', N'08051009', N'UnderstandingAcuteLymphoblasticLeukemia', N'', 0, 0, 1, 1, CAST(N'2021-02-23 19:45:54.213' AS DateTime), CAST(N'2021-02-23 19:45:54.213' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductId], [ProductType], [CompanyId], [ProductName], [ProductUniqueCode], [ProductUniqueName], [ProductSummary], [DisplayOrder], [IsFeatured], [IsActive], [PublishStatus], [LastUpdatedOn], [ActiveFrom], [ActiveTo]) VALUES (16, 1, 1, N'Understanding ADHD', N'07045009', N'UnderstandingADHD', N'', 0, 0, 1, 1, CAST(N'2021-02-23 21:09:30.347' AS DateTime), CAST(N'2021-02-23 21:09:30.347' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'Admin', CAST(N'2020-09-27 13:33:59.873' AS DateTime), NULL, 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'Moderator', CAST(N'2020-09-27 13:33:59.873' AS DateTime), NULL, 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, N'User', CAST(N'2020-09-27 13:33:59.873' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (1, N'Ali', 978)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (2, N'Zaid', 770)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (3, N'Mohd', 1140)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (4, N'Jack', 770)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (5, N'John', 1240)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (6, N'Mike', 1140)
INSERT [dbo].[StudentScore] ([Student_ID], [Student_Name], [Student_Score]) VALUES (7, N'Goerge', 885)
INSERT [dbo].[UserRole] ([UserId], [RoleId], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, 1, CAST(N'2020-10-02 19:06:50.170' AS DateTime), NULL, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, 2, CAST(N'2020-10-02 19:07:45.780' AS DateTime), NULL, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, 3, CAST(N'2020-10-02 19:07:45.780' AS DateTime), NULL, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, 3, CAST(N'2020-10-02 19:08:22.863' AS DateTime), NULL, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (16, 2, CAST(N'2020-10-18 19:42:40.100' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [LoginId], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [DisplayName], [Address1], [Address2], [City], [PostalCode], [StateId], [CountryId], [IsActive], [ActiveFrom], [PasswordChangeDate], [UpdatedDate], [UpdatedBy]) VALUES (1, N'amit', N'$2a$08$6c5SBqo.JnDhnOsBZkiuoeYGk77n/Bs8HNE3Vyrw7mQ2WzBTxWtS6', N'amit254a@gmail.com', N'Amit', N'', N'Kumar', N'Amit Kumar', N'test', N'', N'Delhi', N'110092', 10, N'US', 1, CAST(N'2020-10-02 19:06:50.137' AS DateTime), CAST(N'2020-10-02 19:06:50.137' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [LoginId], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [DisplayName], [Address1], [Address2], [City], [PostalCode], [StateId], [CountryId], [IsActive], [ActiveFrom], [PasswordChangeDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'nisha', N'$2a$08$4gl6BfHMOyTPA4U/Z9be3OlU7GQHCyfhdUSl5qjqWs1IvyhFa315.', N'nisha@gmail.com', N'Nisha', N'', N'Vats', N'Nisha Vats', N'test', N'', N'Delhi', N'201902', 10, N'US', 1, CAST(N'2020-10-02 19:07:45.763' AS DateTime), CAST(N'2020-10-02 19:07:45.763' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [LoginId], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [DisplayName], [Address1], [Address2], [City], [PostalCode], [StateId], [CountryId], [IsActive], [ActiveFrom], [PasswordChangeDate], [UpdatedDate], [UpdatedBy]) VALUES (3, N'suraj', N'$2a$08$rC9MYxzERzdu8Wtk12yKue1Cq7vUeEykUZRVzopFnOeVpFFQJMf9m', N'suraj@gmail.com', N'Suraj', N'', N'Kumar', N'Suraj Kumar', N'test', N'', N'Noida', N'201902', 10, N'US', 1, CAST(N'2020-10-02 19:08:22.800' AS DateTime), CAST(N'2020-10-02 19:08:22.800' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserId], [LoginId], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [DisplayName], [Address1], [Address2], [City], [PostalCode], [StateId], [CountryId], [IsActive], [ActiveFrom], [PasswordChangeDate], [UpdatedDate], [UpdatedBy]) VALUES (16, N'amit123', N'$2a$08$O29JnThpj/sRixW.aHbFGeVEN/qlQta5QxdCVyI13R/mIiz5faz5S', N'kumar.amit@ebix.com', N'Amit', N'', N'Kumar', N'Amit Kumar', N'test', NULL, N'ABC', N'30015', 10, N'US', 1, CAST(N'2020-10-18 19:42:40.050' AS DateTime), CAST(N'2020-10-18 19:42:40.050' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'0FfxCmDRHtW5ruma5Cc12VhswAQcHleW', CAST(N'2020-12-29 18:44:56.507' AS DateTime), CAST(N'2020-12-29 18:44:56.507' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'0IBrgsKEw8qJmaInsp6C0Pk39slakJ7n', CAST(N'2020-12-22 14:24:59.670' AS DateTime), CAST(N'2020-12-22 14:24:59.670' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'0MfQxmvT95q3lBlrVgT4yLqXMox5ahdQ', CAST(N'2021-03-02 13:46:04.050' AS DateTime), CAST(N'2021-03-02 13:46:04.050' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'0qWM4NBfnn2kovPfkYs9ZsJIGOeGehMS', CAST(N'2020-12-23 20:47:08.640' AS DateTime), CAST(N'2020-12-23 20:47:08.640' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'10qVw3I10dlPjZNPdFbtalNhKqvretRc', CAST(N'2020-12-21 16:12:00.533' AS DateTime), CAST(N'2020-12-21 16:12:00.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'1JgCANqblZ35dY72ebjT7PKxX5kUbpYn', CAST(N'2021-01-03 18:56:03.797' AS DateTime), CAST(N'2021-01-03 18:56:03.797' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'1k6sCHbRp8RGs1TITyyKnMdd9ObdDxlv', CAST(N'2020-12-08 21:32:50.770' AS DateTime), CAST(N'2020-12-08 21:32:50.770' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'1UevkTRr2658TravUwfwJseLJyTBlz95', CAST(N'2020-12-03 17:56:59.200' AS DateTime), CAST(N'2020-12-03 17:56:59.200' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'1WlASVkG8T03aMt78YHXUgwGolRb4EZL', CAST(N'2020-12-03 18:09:51.173' AS DateTime), CAST(N'2020-12-03 18:09:51.173' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'1YBASNwdseFdeXALg3Yy9XKMrY09abwt', CAST(N'2021-01-17 20:21:39.207' AS DateTime), CAST(N'2021-01-17 20:21:39.207' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'2AfmAXXth70RMcam9b6OBuSIaiBBb3F1', CAST(N'2020-12-23 14:04:13.197' AS DateTime), CAST(N'2020-12-23 14:04:13.197' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'2gqv7GuJbjksmVDFLDVZQafEUpB2Sq03', CAST(N'2020-12-12 14:14:15.103' AS DateTime), CAST(N'2020-12-12 14:14:15.103' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'2OE06D8hZbrAij0i1jWD4BQWqzkt1Ngr', CAST(N'2020-12-10 13:10:08.613' AS DateTime), CAST(N'2020-12-10 13:10:08.613' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'2rJfwAVJBZSJZQEmUjs4CGA0j99MijP2', CAST(N'2021-01-06 15:24:15.220' AS DateTime), CAST(N'2021-01-06 15:24:15.220' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'34HijtAOPWCoE4J8PfibmKC96HmInQIX', CAST(N'2020-12-21 19:32:09.043' AS DateTime), CAST(N'2020-12-21 19:32:09.043' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'35rmo0hMeCB70tU2ae1vgHD1kTTzVZpc', CAST(N'2020-11-25 19:04:05.890' AS DateTime), CAST(N'2020-11-25 19:04:05.890' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3CIOUIZepoSU0dcdCMQIcIHYoQjz5dSE', CAST(N'2021-01-05 16:49:17.350' AS DateTime), CAST(N'2021-01-05 16:49:17.350' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3LtcHix0YNrtrHZBssSb6CFEJEViqN7r', CAST(N'2020-12-21 15:52:18.100' AS DateTime), CAST(N'2020-12-21 15:52:18.100' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3MhcYsPDv3n01Kb61LksIDMQdutnnjB4', CAST(N'2020-11-25 20:58:09.723' AS DateTime), CAST(N'2020-11-25 20:58:09.723' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3o91Ayt0eZ086NR4maOyWfsUwSYfYIa0', CAST(N'2021-02-16 13:58:01.157' AS DateTime), CAST(N'2021-02-16 13:58:01.157' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3pZEg8w2s6cOx4JJfTDVjbTbsdMzWRGs', CAST(N'2021-03-08 16:35:36.397' AS DateTime), CAST(N'2021-03-08 16:35:36.397' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3SBkk6m0vmBj85ZadgtafmykqFKca7AU', CAST(N'2020-12-11 11:25:09.867' AS DateTime), CAST(N'2020-12-11 11:25:09.867' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'3XuIc9QfMuLLhUqAyV1cP6tAXOgRzocQ', CAST(N'2020-12-21 19:27:49.323' AS DateTime), CAST(N'2020-12-21 19:27:49.323' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'40J2x6WYLwmECvPG2jwi0xvSiSU2iSJs', CAST(N'2021-01-04 14:08:29.177' AS DateTime), CAST(N'2021-01-04 14:08:29.177' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4FcOGd6GVERt97u5QO2q6zTRdNycSoyZ', CAST(N'2021-01-09 20:26:52.870' AS DateTime), CAST(N'2021-01-09 20:26:52.870' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4lUj2iOcTFK52rkJSzbODaTVQUrnPrGQ', CAST(N'2020-12-25 09:59:59.653' AS DateTime), CAST(N'2020-12-25 09:59:59.653' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4MheEmIIQhjdWuHa4OOq7e3kK1BfmXIe', CAST(N'2020-12-21 17:16:03.307' AS DateTime), CAST(N'2020-12-21 17:16:03.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4mWAqWq8PwG1taQgfwFPWZ6aQVnhZ46h', CAST(N'2020-12-23 14:01:24.260' AS DateTime), CAST(N'2020-12-23 14:01:24.260' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4mWwtN5uVMsaX1MtN2xXntVnDlVh1e4Z', CAST(N'2020-11-24 13:51:56.567' AS DateTime), CAST(N'2020-11-24 13:51:56.567' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'4WSarc7nyNIDuJDxSg6hSl4Cf7KWcKo5', CAST(N'2021-01-27 17:15:02.493' AS DateTime), CAST(N'2021-01-27 17:15:02.493' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'51ISNEz3qt05SezZda9WCPIg3uLdSQMx', CAST(N'2020-10-18 19:02:10.383' AS DateTime), CAST(N'2020-10-18 19:02:10.383' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5c5g1bX8T7VhjHDiiN3oBAsmnZTgI6Ho', CAST(N'2020-11-26 14:46:34.257' AS DateTime), CAST(N'2020-11-26 14:46:34.257' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5csDnisaY3wuRB8y784oWOIxV8XklOR8', CAST(N'2020-12-22 21:43:38.520' AS DateTime), CAST(N'2020-12-22 21:43:38.520' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5fDyYGwpd7MJtdznVkqBCPfFrIf4h40y', CAST(N'2020-12-21 10:30:56.730' AS DateTime), CAST(N'2020-12-21 10:30:56.730' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5klQA62tQEg9BS47c5eVb9q9GjvdT1Nz', CAST(N'2020-12-03 17:20:07.917' AS DateTime), CAST(N'2020-12-03 17:20:07.917' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5tXcCypN9isPU24vXU0joH9t8FQsE70u', CAST(N'2020-12-21 14:17:41.047' AS DateTime), CAST(N'2020-12-21 14:17:41.047' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5xiTfLeUxZC5c05MEycCZBYQGJomDXWe', CAST(N'2020-12-25 21:21:41.700' AS DateTime), CAST(N'2020-12-25 21:21:41.700' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5xQE9W3jTLe351av1cvDyp2zCyHuLpH4', CAST(N'2021-02-19 20:35:38.767' AS DateTime), CAST(N'2021-02-19 20:35:38.767' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5z6F8UnxYcu0qFudLytSGrUrPSM4M7Oi', CAST(N'2020-12-28 22:55:50.957' AS DateTime), CAST(N'2020-12-28 22:55:50.957' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5zluDrnk5ZhMb4D8g7ersl0vTWgf0evh', CAST(N'2020-12-23 19:54:01.620' AS DateTime), CAST(N'2020-12-23 19:54:01.620' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'5ztytEahoui9fcpYuamcYO8YHaoXsa2b', CAST(N'2020-12-21 12:25:11.307' AS DateTime), CAST(N'2020-12-21 12:25:11.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'66wpOzibI4Z4CWhM8CL5LLw4Kj4G7xh2', CAST(N'2021-01-16 16:55:04.087' AS DateTime), CAST(N'2021-01-16 16:55:04.087' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'6Ac7c98ZXsWAcRcdw4769qfQMZZSk5TA', CAST(N'2020-12-28 20:30:18.383' AS DateTime), CAST(N'2020-12-28 20:30:18.383' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'6Kdh3JLy8EvN1ysFSI6Oy7EtbIFs7e2E', CAST(N'2020-10-18 19:42:24.307' AS DateTime), CAST(N'2020-10-18 19:42:24.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'6TqlPRTPG6EOQTs7wf4NSWIOmPePIrvJ', CAST(N'2021-02-25 20:29:30.243' AS DateTime), CAST(N'2021-02-25 20:29:30.243' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'6XtrROzsOZQfjuTJskxIbzPIPxc2ppW5', CAST(N'2020-12-03 18:15:44.930' AS DateTime), CAST(N'2020-12-03 18:15:44.930' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'6z3UYx5Q1hQbI1W2NVpoSDPkBAphCYf7', CAST(N'2020-12-29 18:42:10.540' AS DateTime), CAST(N'2020-12-29 18:42:10.540' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7a7UFBqYXe3szHP8lwtOYujjvevNcZEe', CAST(N'2020-12-18 21:04:54.617' AS DateTime), CAST(N'2020-12-18 21:04:54.617' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7hamtNL6feyg8fuxunudOOCxFILvXuYo', CAST(N'2021-02-16 13:30:56.807' AS DateTime), CAST(N'2021-02-16 13:30:56.807' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7NQ5UMB9lAJ7aDVcAnVyJjBmHInILbAc', CAST(N'2021-01-06 20:12:05.720' AS DateTime), CAST(N'2021-01-06 20:12:05.720' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7oj2YlyF1xbUbi8QmtLoIlMIRvkxXamH', CAST(N'2021-01-30 14:15:46.837' AS DateTime), CAST(N'2021-01-30 14:15:46.837' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7Sid4gM5o6bHVx6OvSLLwtJZgn62zTBW', CAST(N'2020-12-02 22:01:36.943' AS DateTime), CAST(N'2020-12-02 22:01:36.943' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'7tN7K1YrDugnt3ex6UBCZLavpd47jkXT', CAST(N'2020-12-11 16:10:40.253' AS DateTime), CAST(N'2020-12-11 16:10:40.253' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'89SMBixclSFRKpxoYUrOUEs4vkFO0LH5', CAST(N'2021-02-06 17:48:47.270' AS DateTime), CAST(N'2021-02-06 17:48:47.270' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8azpwbJewXxwNLyPeUUvnH36mnx6CUSb', CAST(N'2021-02-16 13:52:57.833' AS DateTime), CAST(N'2021-02-16 13:52:57.833' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8dCJOmgHw7a2wQRN0TcOhUDJnhjnAhWo', CAST(N'2020-12-06 15:33:08.683' AS DateTime), CAST(N'2020-12-06 15:33:08.683' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8ei5sFqaVpzedTWszhTFEkj0Pemi85RR', CAST(N'2021-02-16 19:40:01.110' AS DateTime), CAST(N'2021-02-16 19:40:01.110' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8eT8QmVBr6ykRsHD6l1gQtqxgKrQQ2d4', CAST(N'2020-12-22 21:41:09.937' AS DateTime), CAST(N'2020-12-22 21:41:09.937' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8hkm9Q1WbYcRicptXH2GXog5eR0wpYcs', CAST(N'2020-11-24 19:05:03.547' AS DateTime), CAST(N'2020-11-24 19:05:03.547' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8ib61lu2MoH2g4lDeV1okyHjTZe7p324', CAST(N'2021-01-22 20:15:09.417' AS DateTime), CAST(N'2021-01-22 20:15:09.417' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8irUpUY5ueSGGDPtUI67jyXnJy4Lp7sH', CAST(N'2021-01-06 15:25:09.730' AS DateTime), CAST(N'2021-01-06 15:25:09.730' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8RcTOBJSnZlgtkIStHB4mWIXWUWkMxtU', CAST(N'2020-12-10 18:49:40.210' AS DateTime), CAST(N'2020-12-10 18:49:40.210' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'8YyIAW57RA1F9TjWXbROMHJFD609wia0', CAST(N'2020-10-18 16:25:21.047' AS DateTime), CAST(N'2020-10-18 16:25:21.047' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'956iNUXLFyieNE28swysCxw7zpvWjMoW', CAST(N'2021-02-06 20:21:24.057' AS DateTime), CAST(N'2021-02-06 20:21:24.057' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9IEmc2nBt1uKlaO4vi6oXwla9JzepmG3', CAST(N'2020-12-21 10:15:47.510' AS DateTime), CAST(N'2020-12-21 10:15:47.510' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9nPFmeIaA8GfO13lCAiQ5u59zIK72OOB', CAST(N'2021-02-24 16:04:27.263' AS DateTime), CAST(N'2021-02-24 16:04:27.263' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9Oi1lbTjn86EAgCpzNiz3leUnZylZ8RE', CAST(N'2021-02-23 18:58:57.593' AS DateTime), CAST(N'2021-02-23 18:58:57.593' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9oog6XqhT5mRGtz7c4pUlisQncFKz8mN', CAST(N'2021-02-06 16:12:51.473' AS DateTime), CAST(N'2021-02-06 16:12:51.473' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9UB2NRmJyPJOegjhIT96ACBZ4LoNvrfG', CAST(N'2020-12-13 23:20:43.860' AS DateTime), CAST(N'2020-12-13 23:20:43.860' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'9ZlSkRpTbullY29bOPEQNoQW0aTPj1q8', CAST(N'2021-01-20 13:37:07.810' AS DateTime), CAST(N'2021-01-20 13:37:07.810' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'A2MWp69iGORC8mZzoUoyQWvkuewQ2OnR', CAST(N'2020-12-02 21:29:37.830' AS DateTime), CAST(N'2020-12-02 21:29:37.830' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'A46QZbHXPAi8C7eEEIklokXyAR5VZ2Lm', CAST(N'2020-12-22 11:40:09.570' AS DateTime), CAST(N'2020-12-22 11:40:09.570' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'A5NIdpXlyn9hQWR3oSCB6ur4GiafYVE8', CAST(N'2020-11-24 19:30:54.073' AS DateTime), CAST(N'2020-11-24 19:30:54.073' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'a7csN69efDWsYeAYYlkyfDTn7TARzaQg', CAST(N'2020-12-06 20:23:00.113' AS DateTime), CAST(N'2020-12-06 20:23:00.113' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'abeu6ZA1qA6alPCGYncM2H1CzRf2Lc2Y', CAST(N'2020-11-26 20:16:13.720' AS DateTime), CAST(N'2020-11-26 20:16:13.720' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ABpfQTD4dYcnQ8BLgeY4bpqdwOh9X0jr', CAST(N'2020-12-25 10:57:43.063' AS DateTime), CAST(N'2020-12-25 10:57:43.063' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'aFTYE5haOJu0pp4ZM9IShaaqGb8omsuU', CAST(N'2020-12-24 22:23:03.023' AS DateTime), CAST(N'2020-12-24 22:23:03.023' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'aGJb3HJdERYFEX8n7dY9awYYXvG6xrXz', CAST(N'2020-12-06 21:13:07.587' AS DateTime), CAST(N'2020-12-06 21:13:07.587' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ajBKmKkQE2RyxgrQLlyJhqMXlMlXauHo', CAST(N'2020-12-22 12:08:37.867' AS DateTime), CAST(N'2020-12-22 12:08:37.867' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'aNd2tKF19PnU0DlHYxsc9id8OLH4ooMw', CAST(N'2020-12-21 14:33:48.920' AS DateTime), CAST(N'2020-12-21 14:33:48.920' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'AQdmFfwre4Ta3lvVqSLD8Yg6Ie7YKfpw', CAST(N'2020-12-03 12:45:06.263' AS DateTime), CAST(N'2020-12-03 12:45:06.263' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ATtWumPa9dlcduDr0jlENFqTLHTNfOrx', CAST(N'2020-12-21 17:39:05.093' AS DateTime), CAST(N'2020-12-21 17:39:05.093' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'aUih8pHSevNlLZ0A93811ZzZE5wtD7XB', CAST(N'2020-12-25 22:56:39.443' AS DateTime), CAST(N'2020-12-25 22:56:39.443' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'AUP4SrWGfMJ3KMGL3U3uNHwKyJHX1Scx', CAST(N'2021-02-10 13:20:07.410' AS DateTime), CAST(N'2021-02-10 13:20:07.410' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'AUVIQS1MpqDqKbrEGC7LvOQMJanFm14X', CAST(N'2020-12-28 15:01:58.600' AS DateTime), CAST(N'2020-12-28 15:01:58.600' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'B86lBlytJLiw50ZOsbmoVja0URVbvv3s', CAST(N'2021-03-01 10:48:38.957' AS DateTime), CAST(N'2021-03-01 10:48:38.957' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'B8AeKeBjCMhP1B1w19HBxx8RhB2LxPnd', CAST(N'2021-01-31 15:54:42.447' AS DateTime), CAST(N'2021-01-31 15:54:42.447' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'b8nOIsHCQSShRbsRNZkmG38L8rtpjbUi', CAST(N'2020-12-03 18:11:24.180' AS DateTime), CAST(N'2020-12-03 18:11:24.180' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'B9fNBO8OpIwtEVdvYb1O8HSQqZ1W3uod', CAST(N'2020-12-21 10:45:24.567' AS DateTime), CAST(N'2020-12-21 10:45:24.567' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'b9mAjsjwWTtGm946442epvu6GyL5im0n', CAST(N'2021-03-10 17:33:52.347' AS DateTime), CAST(N'2021-03-10 17:33:52.347' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'bswfigvaZhQCvFZOQdNp4rrLz8EWOgzS', CAST(N'2020-12-21 13:20:37.140' AS DateTime), CAST(N'2020-12-21 13:20:37.140' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'BUJSi732f1hfank8QtPlVRLhgBcDAS4O', CAST(N'2021-01-24 20:35:32.840' AS DateTime), CAST(N'2021-01-24 20:35:32.840' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'bYYoNbXN3KNztAxgjtbGixiHj8QFeFJY', CAST(N'2020-11-24 19:12:22.880' AS DateTime), CAST(N'2020-11-24 19:12:22.880' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'c6077csrO1iJZUktcppMiGzwu9ur43Jy', CAST(N'2021-01-02 22:21:50.557' AS DateTime), CAST(N'2021-01-02 22:21:50.557' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ccseLg906iolDFpkMUZCkJ29YwKtxFHx', CAST(N'2020-11-30 10:53:20.533' AS DateTime), CAST(N'2020-11-30 10:53:20.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'CfzzvQM1KkVPkyG2jaRGnJMnAQAkfbQI', CAST(N'2020-12-29 17:13:44.263' AS DateTime), CAST(N'2020-12-29 17:13:44.263' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ci7nZF0gb07CDKRk6MJOQuQiECnUZnNw', CAST(N'2021-02-16 14:01:13.833' AS DateTime), CAST(N'2021-02-16 14:01:13.833' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'CKcsIknNs6P2xx6xx8wwUfwr6FItqE5t', CAST(N'2020-12-23 18:13:46.210' AS DateTime), CAST(N'2020-12-23 18:13:46.210' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'CrL6hvocEzRqbf2FSyuNigFXMzIrJyt1', CAST(N'2020-12-25 10:53:53.117' AS DateTime), CAST(N'2020-12-25 10:53:53.117' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ctxL6PQcEGCGQh6MMAVJkIhuljHmiJpg', CAST(N'2020-10-05 17:13:20.140' AS DateTime), CAST(N'2020-10-05 17:13:20.140' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
GO
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'cwrAJTbMvBZv6OSIzeGwkhlyZ0T6AkQ8', CAST(N'2021-02-16 13:56:58.357' AS DateTime), CAST(N'2021-02-16 13:56:58.357' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'D3BidJKV6zOHixAdf6SnTnDXroP82RIf', CAST(N'2020-12-03 12:46:02.373' AS DateTime), CAST(N'2020-12-03 12:46:02.373' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'd6BtNwZJ5ZppUzTTRnhblVe39n6u0tnx', CAST(N'2020-12-10 16:37:19.807' AS DateTime), CAST(N'2020-12-10 16:37:19.807' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'D6lEzeUKqb8dhxBUWf0MJcrMWmR3xzHL', CAST(N'2020-12-21 19:39:49.203' AS DateTime), CAST(N'2020-12-21 19:39:49.203' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Db3TWBDMEPRjxQsujSCR3UorHWJvWdci', CAST(N'2020-12-03 13:10:06.543' AS DateTime), CAST(N'2020-12-03 13:10:06.543' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'DCYGrAp3oHDgViqgG2bpPzh67szoTOnE', CAST(N'2021-02-16 15:40:55.770' AS DateTime), CAST(N'2021-02-16 15:40:55.770' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'dDE468ayhmqnTvWk3CZpMQ8Ncgl6casj', CAST(N'2020-12-14 12:01:36.580' AS DateTime), CAST(N'2020-12-14 12:01:36.580' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'dertkoRePZwZSPNiUQ5t4qdm5JBuhPLt', CAST(N'2021-02-16 17:38:39.337' AS DateTime), CAST(N'2021-02-16 17:38:39.337' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'DfyvXNbLc6aOUGwONk1r1avn9v6Wrfd7', CAST(N'2021-02-05 21:08:44.227' AS DateTime), CAST(N'2021-02-05 21:08:44.227' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Dmxw2cK0k0jQXsFc7GirPwKcyCLoe7LK', CAST(N'2020-12-23 17:33:36.187' AS DateTime), CAST(N'2020-12-23 17:33:36.187' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'dPMyD9wFxGL5wINhiOTPvGP3vGIiv4C7', CAST(N'2021-02-16 13:25:30.207' AS DateTime), CAST(N'2021-02-16 13:25:30.207' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Dpp4MCWV7iqHDEg0qp2DyQVwFJc3HgLR', CAST(N'2021-01-31 16:10:57.987' AS DateTime), CAST(N'2021-01-31 16:10:57.987' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'DTH1SG2PrnqvhQgAQvk6pmRvcZ2XWuos', CAST(N'2020-12-21 14:01:54.307' AS DateTime), CAST(N'2020-12-21 14:01:54.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'dw5UHuysX8SSbl7HX9ojcGCIHtFfi8iz', CAST(N'2020-12-23 16:14:10.743' AS DateTime), CAST(N'2020-12-23 16:14:10.743' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'dWTcW9Qm9AONW5dHjPGubK0DjmcRaLYj', CAST(N'2021-01-30 22:43:37.510' AS DateTime), CAST(N'2021-01-30 22:43:37.510' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'DxEyazBrlKFl2z8WicuTGePx8T2ICGIh', CAST(N'2021-02-16 18:29:40.793' AS DateTime), CAST(N'2021-02-16 18:29:40.793' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'e4Ah1YZB9Td8zKdBh9PCxFtKryrBB9HT', CAST(N'2021-01-08 20:17:11.857' AS DateTime), CAST(N'2021-01-08 20:17:11.857' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'E9HLlGFFlpRc7jvX2sE3aIfW4BgUg3DH', CAST(N'2021-02-16 20:14:04.810' AS DateTime), CAST(N'2021-02-16 20:14:04.810' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'e9qyUoWaMacdUhK1tXa4QDT7jGBUuwVy', CAST(N'2020-10-18 17:22:23.723' AS DateTime), CAST(N'2020-10-18 17:22:23.723' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eckcRAxjcndA90A3MpXqgfOuLg7uJD5m', CAST(N'2021-01-29 13:28:07.407' AS DateTime), CAST(N'2021-01-29 13:28:07.407' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ee74eneM0NKJaE0qWyj66NzgVQOebNSs', CAST(N'2020-11-27 11:37:22.880' AS DateTime), CAST(N'2020-11-27 11:37:22.880' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EFN8wNh5cZaqofdXThjM00o0gEDKZy1T', CAST(N'2021-02-16 16:08:58.193' AS DateTime), CAST(N'2021-02-16 16:08:58.193' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EHTamauRhrcJJ50qTeFgskQPDZ9ohs8I', CAST(N'2021-02-15 19:41:34.780' AS DateTime), CAST(N'2021-02-15 19:41:34.780' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eHuxtvRbbSGWndhLieC6hEPZUGRXnxyJ', CAST(N'2020-12-22 14:35:07.953' AS DateTime), CAST(N'2020-12-22 14:35:07.953' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EJhiUQgOz3vc6Ff7SGdsASioNKTIDdOQ', CAST(N'2021-01-11 22:51:18.957' AS DateTime), CAST(N'2021-01-11 22:51:18.957' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eKBTUSB1OIkdEN9F8jHRp8IpVf0sCZH5', CAST(N'2021-01-05 21:48:15.317' AS DateTime), CAST(N'2021-01-05 21:48:15.317' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EmLcnThU7PVJMAPXFBWWOLIqWRLfacut', CAST(N'2020-11-27 18:33:09.470' AS DateTime), CAST(N'2020-11-27 18:33:09.470' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eneO2iqe9JKXYO5Rjk9u7UmXfOupGHsQ', CAST(N'2021-01-23 13:19:16.560' AS DateTime), CAST(N'2021-01-23 13:19:16.560' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Eq3FJQziZD011HOJBZwGWUeANR445Lk2', CAST(N'2021-01-09 20:02:12.017' AS DateTime), CAST(N'2021-01-09 20:02:12.017' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EqRRRQYKPafVk1Yo6CifVB9EEVnn1FMS', CAST(N'2021-01-12 18:03:13.000' AS DateTime), CAST(N'2021-01-12 18:03:13.000' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eTtmvfjiOQNEmaQEETPCsKfF6kQJHKgO', CAST(N'2021-01-02 19:59:03.293' AS DateTime), CAST(N'2021-01-02 19:59:03.293' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'eUCU245r39u6pikfe9Ve4wkMqEfsOI7N', CAST(N'2020-12-11 18:28:40.547' AS DateTime), CAST(N'2020-12-11 18:28:40.547' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'EXcvviHvG4xA2dvSm007kaVWQOTtdspN', CAST(N'2020-12-11 15:56:16.510' AS DateTime), CAST(N'2020-12-11 15:56:16.510' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ezuZDIYcR9jJ5DDENgIUA1KNlJIms3oS', CAST(N'2021-01-06 14:45:32.877' AS DateTime), CAST(N'2021-01-06 14:45:32.877' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'F1LT3oCf9QJywjo86UVuOncJl8PWdkru', CAST(N'2021-02-03 21:16:05.037' AS DateTime), CAST(N'2021-02-03 21:16:05.037' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'f30ejRRbDAdVdb07HbL2kg0N055aIGZl', CAST(N'2021-02-03 20:40:51.550' AS DateTime), CAST(N'2021-02-03 20:40:51.550' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FaNtRMDIDI7JVq3VVr4LddY3W3iJfxvD', CAST(N'2020-10-18 15:10:55.767' AS DateTime), CAST(N'2020-10-18 15:10:55.767' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Fe7CnzFFNLo6kX4usfL8UscIjWhzyAdp', CAST(N'2020-11-21 15:06:51.460' AS DateTime), CAST(N'2020-11-21 15:06:51.460' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FMP3OtnkZ1VDr2LgPw9v77PYoa09VE3n', CAST(N'2020-10-18 18:40:46.943' AS DateTime), CAST(N'2020-10-18 18:40:46.943' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'foiojVuyCNks0snTpdTai8bQDys3sS3X', CAST(N'2020-10-18 17:43:53.410' AS DateTime), CAST(N'2020-10-18 17:43:53.410' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FPa4Awbo8Mx6sBkZiSkqpT59se0er6R5', CAST(N'2020-12-21 19:34:27.627' AS DateTime), CAST(N'2020-12-21 19:34:27.627' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'fPoOuSlFles78WnzrQlXJyVorPADc0W9', CAST(N'2021-02-06 17:52:58.783' AS DateTime), CAST(N'2021-02-06 17:52:58.783' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FrroXu1JQIY0UP8gUe4zrmW0SzPKtyH1', CAST(N'2020-10-05 18:51:22.100' AS DateTime), CAST(N'2020-10-05 18:51:22.100' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Ft2P79C3i5JBvn7s8oRiWDizkLYr1P4X', CAST(N'2020-12-21 14:41:30.943' AS DateTime), CAST(N'2020-12-21 14:41:30.943' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FtxcpJUYYTxPkHtz83DsxmYGpqJ4HQs9', CAST(N'2021-03-03 20:42:18.373' AS DateTime), CAST(N'2021-03-03 20:42:18.373' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FvgTD72Vb1SXfnAzghiSYLxDPdoARfgs', CAST(N'2021-02-02 12:05:38.317' AS DateTime), CAST(N'2021-02-02 12:05:38.317' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FVjyrg559gSnLE0uGLUctBjTkGWVSPrZ', CAST(N'2021-01-02 22:26:48.110' AS DateTime), CAST(N'2021-01-02 22:26:48.110' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'FXvMWdRuwy5KELNUq23le5QPlYZiw9vu', CAST(N'2021-01-04 17:10:31.117' AS DateTime), CAST(N'2021-01-04 17:10:31.117' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'g1qec4ihw2oKTR5kaRsyA0z10WtaQk1O', CAST(N'2021-02-15 19:42:15.667' AS DateTime), CAST(N'2021-02-15 19:42:15.667' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'G5FZXZJA1nG0IGFwuD9n2l6r5jpHbjHL', CAST(N'2020-12-03 21:13:52.360' AS DateTime), CAST(N'2020-12-03 21:13:52.360' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'G7nINzAnkvVpYMr3nQCdNLsaCUCw1GRw', CAST(N'2020-10-18 17:00:58.710' AS DateTime), CAST(N'2020-10-18 17:00:58.710' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'g7w5A4VjLovFX967pi1NxU6qniGfke6Y', CAST(N'2020-12-21 19:52:15.633' AS DateTime), CAST(N'2020-12-21 19:52:15.633' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'G8hnlVFCjwfFtRsxwzqCA039ICBGQ3zy', CAST(N'2020-11-21 14:23:49.810' AS DateTime), CAST(N'2020-11-21 14:23:49.810' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'G8tCCgNu9rYI7DylXvjdwZmiJLC2B4A4', CAST(N'2020-10-18 15:33:59.513' AS DateTime), CAST(N'2020-10-18 15:33:59.513' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'g9wUg7csN3IWm0KKiaD5f4RQlOlGsyK3', CAST(N'2020-10-05 17:23:27.063' AS DateTime), CAST(N'2020-10-05 17:23:27.063' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'gcH6dIdf8k9dq5miD4lQtacvz5Lb0mnH', CAST(N'2021-02-24 19:34:07.267' AS DateTime), CAST(N'2021-02-24 19:34:07.267' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'GI5sFJzwhQPUyEQUUj6uYaP48r2N09zJ', CAST(N'2020-10-18 16:51:59.870' AS DateTime), CAST(N'2020-10-18 16:51:59.870' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'gmYl2PLFjUPxgXxIzZhkaHlm3RZDi2sH', CAST(N'2020-12-23 20:45:26.727' AS DateTime), CAST(N'2020-12-23 20:45:26.727' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'gNn3DrXZVpgu32IZ5tuZ96LtnFBY83Bg', CAST(N'2021-02-16 13:50:09.147' AS DateTime), CAST(N'2021-02-16 13:50:09.147' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'GOU0uPnHE4iuiIVGFxcREEKb9bJo85Y6', CAST(N'2020-12-22 12:18:29.760' AS DateTime), CAST(N'2020-12-22 12:18:29.760' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'gQgz5tBwpQ2nBcxIpZn2iiilAsLquJ6g', CAST(N'2020-12-22 18:39:36.720' AS DateTime), CAST(N'2020-12-22 18:39:36.720' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'GrZcZM28r4bWWsMJ9gmCNWftqa1IWiQo', CAST(N'2021-02-06 17:52:49.530' AS DateTime), CAST(N'2021-02-06 17:52:49.530' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Gu9fq2nfPiHe5lkSCxIZT7OLUa6WpCl1', CAST(N'2020-11-30 19:17:06.260' AS DateTime), CAST(N'2020-11-30 19:17:06.260' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'h1osYoKUkijLY9jOTRXaUlg6cVR2WIUa', CAST(N'2021-02-21 20:41:51.937' AS DateTime), CAST(N'2021-02-21 20:41:51.937' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'H7FkDGZ33ZP9QdUy3ksowAFbO07YW2p1', CAST(N'2020-12-03 12:46:14.450' AS DateTime), CAST(N'2020-12-03 12:46:14.450' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'h8GndQnkKxrpu2OtpZp8dMINU6CnRASI', CAST(N'2020-12-10 18:40:04.413' AS DateTime), CAST(N'2020-12-10 18:40:04.413' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HaTW06HbrzOgSUQszc2sEvFOpgxdg8ZL', CAST(N'2021-01-06 14:24:04.373' AS DateTime), CAST(N'2021-01-06 14:24:04.373' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'hio3UcnTInFm2DRmrntiUX4kWwMpHbNH', CAST(N'2021-01-13 15:26:06.050' AS DateTime), CAST(N'2021-01-13 15:26:06.050' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HJXSfXupSQAZrHQQZ1BVtVoYtwjDAQ4S', CAST(N'2020-11-27 11:36:25.713' AS DateTime), CAST(N'2020-11-27 11:36:25.713' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HKKd0xDfgJC4VoXel8jsgiFl9Gy9YQk0', CAST(N'2020-12-09 15:17:18.483' AS DateTime), CAST(N'2020-12-09 15:17:18.483' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'hmWTI1KsoENshbSkaBDINEbR6oLDGWEz', CAST(N'2020-12-16 16:44:52.497' AS DateTime), CAST(N'2020-12-16 16:44:52.497' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Hpy38OTIKSm7aOqlzy7cjefp9TfyqT8Q', CAST(N'2021-01-07 18:21:04.573' AS DateTime), CAST(N'2021-01-07 18:21:04.573' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HTKJKyoGkIfrOdaKFyxUTz8rtEJL8Etm', CAST(N'2021-01-18 19:18:07.707' AS DateTime), CAST(N'2021-01-18 19:18:07.707' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HUc6Rz48wXgCe9YUjrzKsT2jXw0b1MqP', CAST(N'2020-12-03 16:53:22.843' AS DateTime), CAST(N'2020-12-03 16:53:22.843' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HUzxqthdSZl81OSrWurVwHFCLPaysY3d', CAST(N'2020-12-21 19:59:06.273' AS DateTime), CAST(N'2020-12-21 19:59:06.273' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Hw6IkMjh4aUjeK4xlT8hskgLumqPwQ9F', CAST(N'2020-10-18 18:03:58.020' AS DateTime), CAST(N'2020-10-18 18:03:58.020' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'HwC1INFyMKekDO4KX7M3FClvSIUsTmfq', CAST(N'2020-11-24 13:59:45.990' AS DateTime), CAST(N'2020-11-24 13:59:45.990' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'hxIGAEe04XfKKayIwiKiiPljfKzE85Oc', CAST(N'2020-10-05 17:20:44.583' AS DateTime), CAST(N'2020-10-05 17:20:44.583' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'hYrfyhUywGYExSFqubgkya7yDzVbxUqt', CAST(N'2021-01-02 22:39:25.267' AS DateTime), CAST(N'2021-01-02 22:39:25.267' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'I6uk99PdHhJJqTpulvBk9Ug7hnbkU9JT', CAST(N'2021-01-08 19:13:19.880' AS DateTime), CAST(N'2021-01-08 19:13:19.880' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'I7kF2oPKyXoY4QeF0R3RwO7p1HztfLfn', CAST(N'2021-01-13 15:34:40.600' AS DateTime), CAST(N'2021-01-13 15:34:40.600' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'icctbWZvb8NJheZlYtHpr6MTz1uk1Fb1', CAST(N'2020-12-23 20:51:07.300' AS DateTime), CAST(N'2020-12-23 20:51:07.300' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Ie8WCVkyaHXKQdlGoSnryoGvnT0JDoNu', CAST(N'2021-01-02 22:29:51.117' AS DateTime), CAST(N'2021-01-02 22:29:51.117' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'iGnGCw2bMZ2lZHXqGO8HvmNNgClkpX8r', CAST(N'2020-12-02 22:36:57.270' AS DateTime), CAST(N'2020-12-02 22:36:57.270' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IGRLRzOAMuviOUGP2Kw3jQGC4VUduxVL', CAST(N'2021-01-16 17:12:15.153' AS DateTime), CAST(N'2021-01-16 17:12:15.153' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'iJ9TijuvA9Aa22Ll0PVP3LVr2BEYtTjT', CAST(N'2020-12-13 20:31:23.953' AS DateTime), CAST(N'2020-12-13 20:31:23.953' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'iKdQDLlC4eAYd5wIHA5YHqTHzPmaMDN3', CAST(N'2021-01-04 13:26:51.780' AS DateTime), CAST(N'2021-01-04 13:26:51.780' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'iKL9Psz0xvlu6lurQwtj0UCvP5D722W9', CAST(N'2020-10-18 19:19:23.777' AS DateTime), CAST(N'2020-10-18 19:19:23.777' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ikv9Efoh3ppwZifW0wlf946iYwELAiQo', CAST(N'2020-12-21 17:29:08.170' AS DateTime), CAST(N'2020-12-21 17:29:08.170' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ILOvh2TUAIxDgh3DsOcBFaGSDHIKMTvt', CAST(N'2020-12-24 22:20:11.583' AS DateTime), CAST(N'2020-12-24 22:20:11.583' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IMWWGLT5hbeBRDKFSGsndhV4wGIMDLY9', CAST(N'2020-12-14 10:45:16.400' AS DateTime), CAST(N'2020-12-14 10:45:16.400' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IN73bI1UibgC6mE4RzbJJXFlabtrV0ru', CAST(N'2021-01-14 23:16:55.533' AS DateTime), CAST(N'2021-01-14 23:16:55.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Iq5RV7VIFADYrYJuJuJnZ9YHdN63YqjK', CAST(N'2021-01-14 23:13:28.363' AS DateTime), CAST(N'2021-01-14 23:13:28.363' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IWICSpGPCT1LeDmpkxxMdxpc3uutp0nl', CAST(N'2020-12-21 20:06:04.440' AS DateTime), CAST(N'2020-12-21 20:06:04.440' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'iwxGAf28FUhEER34VAEf9yZ4wPZdKtw6', CAST(N'2020-12-29 20:55:10.587' AS DateTime), CAST(N'2020-12-29 20:55:10.587' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IxCdZAOkwMkQXWag5C14xNQxHSNSYwn0', CAST(N'2021-01-18 18:07:25.267' AS DateTime), CAST(N'2021-01-18 18:07:25.267' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'IyjIGdGRVtdxGgxszLCy48arECnmhzuN', CAST(N'2021-01-26 21:51:15.360' AS DateTime), CAST(N'2021-01-26 21:51:15.360' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'j01OebsXAFWF6Zf2xzczG5t0SQYi6pfr', CAST(N'2021-01-29 15:12:33.200' AS DateTime), CAST(N'2021-01-29 15:12:33.200' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'J12eTJL9riMNVnvrzsSBPupfzO2AAb2T', CAST(N'2021-03-04 20:48:10.610' AS DateTime), CAST(N'2021-03-04 20:48:10.610' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'j1AEnXNXlycClsKcqKSSFOjslzEvtzdu', CAST(N'2020-12-22 12:10:19.640' AS DateTime), CAST(N'2020-12-22 12:10:19.640' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
GO
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JA9GkOC8czqUowvHsHDtuFPAVgUd2WnA', CAST(N'2021-01-23 19:06:02.780' AS DateTime), CAST(N'2021-01-23 19:06:02.780' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JBZmtnRStI7eS73XqVSyWY8aemu62HYF', CAST(N'2020-12-07 17:23:19.590' AS DateTime), CAST(N'2020-12-07 17:23:19.590' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jC93kWdxi16gfGDjSVeIVh5VMwVtA5Ca', CAST(N'2020-12-28 19:41:49.817' AS DateTime), CAST(N'2020-12-28 19:41:49.817' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JCCLgZGEO7knWl5mN9SevnjbVDENYs46', CAST(N'2020-12-23 19:19:36.867' AS DateTime), CAST(N'2020-12-23 19:19:36.867' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jEyejs6lmHlIGW9EyLnnGMssIVk2fQW7', CAST(N'2020-12-10 16:51:50.783' AS DateTime), CAST(N'2020-12-10 16:51:50.783' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JFydB3eYOqfebhf5h1Cl8lbnLL3hZJzm', CAST(N'2020-10-23 16:35:03.433' AS DateTime), CAST(N'2020-10-23 16:35:03.433' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jjoqysocal1aleWs3SLfrKk722nMbkTk', CAST(N'2021-01-13 13:57:08.347' AS DateTime), CAST(N'2021-01-13 13:57:08.347' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JL18SEAupKGHFHxub99YklkOoRtHnCGZ', CAST(N'2020-12-21 19:29:15.587' AS DateTime), CAST(N'2020-12-21 19:29:15.587' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jp1mOHvyhlN0duOP70n8RbWxFC8dLKsk', CAST(N'2020-12-23 18:20:23.577' AS DateTime), CAST(N'2020-12-23 18:20:23.577' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'JqRKcRxjm7e5xKkWPmzHk8o2E2SIunGI', CAST(N'2021-01-20 20:51:59.793' AS DateTime), CAST(N'2021-01-20 20:51:59.793' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jXeAFK8Wt4oENPkf2A0BPxyDho8ZfuRD', CAST(N'2020-12-23 14:02:50.743' AS DateTime), CAST(N'2020-12-23 14:02:50.743' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'jxtjyRXUFVRcKxofX9PtgQLCHuBOULQl', CAST(N'2020-12-03 11:57:46.320' AS DateTime), CAST(N'2020-12-03 11:57:46.320' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'K7kxZdWUXcDyorf3zDDwOfEgndYaLk0U', CAST(N'2021-02-19 16:29:48.877' AS DateTime), CAST(N'2021-02-19 16:29:48.877' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'kcbKfO9Vo11ZATy56rxZwSC63v7F4KfK', CAST(N'2020-10-18 16:21:52.633' AS DateTime), CAST(N'2020-10-18 16:21:52.633' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KdUg4TQd7DVSzo5JMnHZdiDmlujZWG3E', CAST(N'2020-12-11 14:13:38.090' AS DateTime), CAST(N'2020-12-11 14:13:38.090' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'kgtXuc3ANG8Ge5vy8kHBBQAWKAySZeli', CAST(N'2020-10-18 17:19:54.050' AS DateTime), CAST(N'2020-10-18 17:19:54.050' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KHFxOLHECEBIpNDBVGq4cGHiTSyKlSmn', CAST(N'2020-12-14 10:51:31.953' AS DateTime), CAST(N'2020-12-14 10:51:31.953' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KHSeaVjbrSb1apvSPFLW44KlU7nGRB5S', CAST(N'2020-10-18 17:07:50.907' AS DateTime), CAST(N'2020-10-18 17:07:50.907' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KiJlA1P21FWn8RHfyNmRad2MRhHDjMsX', CAST(N'2020-12-08 10:29:05.600' AS DateTime), CAST(N'2020-12-08 10:29:05.600' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'kIyY2lRiK108tbvBXAgXpSxfuFIkRuEa', CAST(N'2021-02-16 18:29:52.017' AS DateTime), CAST(N'2021-02-16 18:29:52.017' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KkBigfkhJUdaPTiyRHZAERDmGXDL7pEt', CAST(N'2020-12-22 13:47:49.960' AS DateTime), CAST(N'2020-12-22 13:47:49.960' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KnEGQw3YfmqVqU4iRLq71g4cDJaWQYkw', CAST(N'2020-11-29 18:20:53.687' AS DateTime), CAST(N'2020-11-29 18:20:53.687' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KoJJsqHJul2Ui0aSp8f7nD2PhStYP7jV', CAST(N'2021-01-05 13:58:55.277' AS DateTime), CAST(N'2021-01-05 13:58:55.277' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KPOBmFbZQsA85aatJCl1Ym2ZogEB07y3', CAST(N'2021-02-15 19:37:37.717' AS DateTime), CAST(N'2021-02-15 19:37:37.717' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'kPX5uBMlILRcf1mR74H0gWxrOq57iRRB', CAST(N'2021-01-16 22:46:12.900' AS DateTime), CAST(N'2021-01-16 22:46:12.900' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'kuIisueIdYVjmIXqqBCMYcZsPy2qH2BS', CAST(N'2020-12-10 18:41:39.997' AS DateTime), CAST(N'2020-12-10 18:41:39.997' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KUk7x7TXoiuagmcU4kXs6WEcS2h2z7V6', CAST(N'2021-01-26 21:37:53.567' AS DateTime), CAST(N'2021-01-26 21:37:53.567' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'KytGs5Zb8obTqAyweLaEfH60H0PAK7Uz', CAST(N'2021-02-10 11:39:20.130' AS DateTime), CAST(N'2021-02-10 11:39:20.130' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'l08mzzvrwiyVHGL1v2Qz9mGDqdKDQ7nV', CAST(N'2021-02-04 13:14:49.113' AS DateTime), CAST(N'2021-02-04 13:14:49.113' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'l7Trr4q6zS2mwHJdalpsdjORwkySszrH', CAST(N'2020-12-25 08:22:37.713' AS DateTime), CAST(N'2020-12-25 08:22:37.713' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'lALEkbGB7G1VUBwT1XI7lP5sVIYXI614', CAST(N'2021-01-19 16:34:22.307' AS DateTime), CAST(N'2021-01-19 16:34:22.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'LCUar8xq0nktGtpCA0Ev4o1g5Cu8LVoE', CAST(N'2020-10-18 16:28:29.140' AS DateTime), CAST(N'2020-10-18 16:28:29.140' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'LdOHbXerh2K5xFjTcxwnSqQkJCuFm149', CAST(N'2021-02-16 15:29:38.660' AS DateTime), CAST(N'2021-02-16 15:29:38.660' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'lhh1fbFa2gXG9wuGXcKCdMSbGDg40HiU', CAST(N'2021-01-28 18:13:23.497' AS DateTime), CAST(N'2021-01-28 18:13:23.497' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'lpGEhOQPHsHD5FFINsk4yXDbrl2kZQV9', CAST(N'2021-02-26 20:31:22.190' AS DateTime), CAST(N'2021-02-26 20:31:22.190' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Ls58LRvwH8HpUwP16wDkxGqSEbsQCO4R', CAST(N'2021-02-18 19:01:07.113' AS DateTime), CAST(N'2021-02-18 19:01:07.113' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'LV5e9WipDS6rLLDeOHpvh08w9mV1iwpt', CAST(N'2021-01-26 21:47:57.637' AS DateTime), CAST(N'2021-01-26 21:47:57.637' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'LzPeYI5oPME22YHOXiVW9rfl5pzT8zMe', CAST(N'2020-12-08 20:12:47.773' AS DateTime), CAST(N'2020-12-08 20:12:47.773' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'lztoJrl4FeWkiAgtnMB5jeivc3PrzHHb', CAST(N'2020-10-18 17:35:30.850' AS DateTime), CAST(N'2020-10-18 17:35:30.850' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'M74mQwVdWWYGJZFlsQhrtr4apZCPGsoa', CAST(N'2020-11-26 19:36:40.533' AS DateTime), CAST(N'2020-11-26 19:36:40.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Ma5nBBpy46RRFMPtJAkAW2MaPhEEM8e6', CAST(N'2020-12-11 16:12:13.983' AS DateTime), CAST(N'2020-12-11 16:12:13.983' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Mbabkr9vVAIZsgOLYgW0pukscbeEGGmJ', CAST(N'2021-02-23 14:38:55.310' AS DateTime), CAST(N'2021-02-23 14:38:55.310' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'mBUKZ2vewIe4umNEY4P1x9zwRp1JUfEO', CAST(N'2021-01-18 17:34:38.767' AS DateTime), CAST(N'2021-01-18 17:34:38.767' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'mdICDSDYGRgWvimgkEHkyfvjgb2cefOW', CAST(N'2020-12-01 11:15:07.767' AS DateTime), CAST(N'2020-12-01 11:15:07.767' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MjB1cFoqzAmu3n9rgLJo1fbi8kMXfBXi', CAST(N'2020-12-03 16:49:02.893' AS DateTime), CAST(N'2020-12-03 16:49:02.893' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ml8DjOYlM7cZ9X4MzF4f2fghJUKYZFRq', CAST(N'2020-12-10 18:03:22.300' AS DateTime), CAST(N'2020-12-10 18:03:22.300' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MliXOpGSlVhfh76Aq8K0aFMkY07sdoqn', CAST(N'2021-01-19 16:18:59.593' AS DateTime), CAST(N'2021-01-19 16:18:59.593' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MOgEedsCfWA70C8ygpDwBmLqRgRzBPtv', CAST(N'2020-11-25 21:01:13.097' AS DateTime), CAST(N'2020-11-25 21:01:13.097' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MRGuKUrCiF5AGFetJJbYDSj8qNCYOifs', CAST(N'2021-02-16 15:27:47.020' AS DateTime), CAST(N'2021-02-16 15:27:47.020' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MS6VDa6v7uKASWNWbeIDS6tg02ioVH2y', CAST(N'2020-12-21 16:17:17.433' AS DateTime), CAST(N'2020-12-21 16:17:17.433' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MSTMjF2CyWSYlmcRSNkXC3wdwVDl5or2', CAST(N'2020-12-21 14:00:26.690' AS DateTime), CAST(N'2020-12-21 14:00:26.690' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MyeP2m7LlzbZKEOXr8nClNo71yBSSr8E', CAST(N'2020-12-08 21:51:20.623' AS DateTime), CAST(N'2020-12-08 21:51:20.623' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'MzpclPnVxuqpbWLT7NR8hAWvKtLINIu8', CAST(N'2020-12-21 18:23:19.527' AS DateTime), CAST(N'2020-12-21 18:23:19.527' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'n4hRbZmldyQdnUTzyP5FjeJoPmICnoXc', CAST(N'2021-01-27 17:15:55.637' AS DateTime), CAST(N'2021-01-27 17:15:55.637' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'n6qJviQD5sTOcZvVUvYxyma7RY4BRJGa', CAST(N'2021-01-14 21:13:29.760' AS DateTime), CAST(N'2021-01-14 21:13:29.760' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'n9zx7gEPGj6kmIwfV58NUtqm0ZQBB2F2', CAST(N'2021-01-05 16:50:51.907' AS DateTime), CAST(N'2021-01-05 16:50:51.907' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'nbSwzDdQRmNtFwDCHKsnsFYpJxK4cIKg', CAST(N'2021-02-02 12:16:30.520' AS DateTime), CAST(N'2021-02-02 12:16:30.520' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'niN82Ph1giWNk3H2yTFJxUuDBisF2Bd1', CAST(N'2021-02-02 15:04:26.033' AS DateTime), CAST(N'2021-02-02 15:04:26.033' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'NKrlZyUXar6kVpQgxq8ffVSRPxWAyeae', CAST(N'2020-12-29 20:48:18.987' AS DateTime), CAST(N'2020-12-29 20:48:18.987' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'nN7z8EEfxl1dtx7uNWrIriA6RfgUCnyx', CAST(N'2021-01-06 18:33:23.533' AS DateTime), CAST(N'2021-01-06 18:33:23.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'NPjYHJfHzbpJx3TF12rw93YkSn0l4FOg', CAST(N'2020-12-21 20:02:21.707' AS DateTime), CAST(N'2020-12-21 20:02:21.707' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'nRZ9mO4B6SCI1BGgumiOheNnRx5MdTZM', CAST(N'2020-12-10 18:22:04.877' AS DateTime), CAST(N'2020-12-10 18:22:04.877' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'NSLUG2XonJHqiq6dy5x92pfgXCd5tKil', CAST(N'2020-12-05 12:47:36.343' AS DateTime), CAST(N'2020-12-05 12:47:36.343' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Nurbyfeu4DIiYpxEdySN5aBAaJgwosQS', CAST(N'2021-01-09 20:14:32.553' AS DateTime), CAST(N'2021-01-09 20:14:32.553' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'NVvW6DRHJx4mLiUgjA7B1V0DhF5bsQsp', CAST(N'2021-02-15 19:39:37.850' AS DateTime), CAST(N'2021-02-15 19:39:37.850' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'nvxE39DeNUmGkxOyVKPCjuCNl6p2YyYA', CAST(N'2020-12-22 12:13:29.487' AS DateTime), CAST(N'2020-12-22 12:13:29.487' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Nwk43kXllRJi7JMtgQL2e790wE44T8Kp', CAST(N'2021-01-04 11:16:15.557' AS DateTime), CAST(N'2021-01-04 11:16:15.557' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'O1GEr1NX3K3ogZhnMLDZgeNJagq5Xgom', CAST(N'2020-10-18 15:32:09.940' AS DateTime), CAST(N'2020-10-18 15:32:09.940' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'o7NAbibiavyqtqarK9g50FEGb1rW5P5r', CAST(N'2020-11-24 14:21:30.627' AS DateTime), CAST(N'2020-11-24 14:21:30.627' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'oabUkV4EIwd9TeQExOZQCdf6y6hFWdYA', CAST(N'2020-12-05 19:16:01.083' AS DateTime), CAST(N'2020-12-05 19:16:01.083' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'oBWGuefhpbNmM7HYeFuBv7zyYcujaiFD', CAST(N'2020-12-21 18:33:33.630' AS DateTime), CAST(N'2020-12-21 18:33:33.630' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'OFSZ0HTgIRaQIZNdUK8UX25iXSGnnrrh', CAST(N'2021-01-14 16:13:12.480' AS DateTime), CAST(N'2021-01-14 16:13:12.480' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Okz5bP05SjNiEDXhlrQmKtaK5ex0Kq0J', CAST(N'2021-01-06 15:20:58.770' AS DateTime), CAST(N'2021-01-06 15:20:58.770' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'OluGWzDPfdmmQpMQ3M2o5jLkWOQyMIH9', CAST(N'2020-12-21 19:50:09.540' AS DateTime), CAST(N'2020-12-21 19:50:09.540' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ow13LOFlAJ8yS1Fa81xDxqkld5WZuSNb', CAST(N'2020-12-10 16:44:55.670' AS DateTime), CAST(N'2020-12-10 16:44:55.670' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'p5lpKb3RdHvIEmvXeNz0BslvIagFjUej', CAST(N'2020-12-02 22:37:10.840' AS DateTime), CAST(N'2020-12-02 22:37:10.840' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'P5SqoUQDgXKElknN5WN0IX44ngfXEAyS', CAST(N'2021-01-17 19:26:39.450' AS DateTime), CAST(N'2021-01-17 19:26:39.450' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'p6Kgqbn5ReMHmdxOBIYksZTmpPdqqTzu', CAST(N'2021-02-22 14:08:56.393' AS DateTime), CAST(N'2021-02-22 14:08:56.393' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'PchFrPZPgqJasl6SyNz5TTmWublu2HrK', CAST(N'2020-11-29 18:53:44.160' AS DateTime), CAST(N'2020-11-29 18:53:44.160' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'pGv8l8I5U2JHo1LxRJsHyELO4cX8BEfO', CAST(N'2021-02-16 12:09:39.103' AS DateTime), CAST(N'2021-02-16 12:09:39.103' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Phr1IRBUkDnywrCfIEPiv3y8M2iRlYw7', CAST(N'2021-01-14 20:56:40.353' AS DateTime), CAST(N'2021-01-14 20:56:40.353' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'PN55354gcRaNpERVGqmjfSczAAjCPBnj', CAST(N'2020-12-03 16:30:14.743' AS DateTime), CAST(N'2020-12-03 16:30:14.743' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'pnLWUEoG7XqwroMEWxqcGroZ3i6DjAjH', CAST(N'2020-10-18 16:36:03.207' AS DateTime), CAST(N'2020-10-18 16:36:03.207' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'pRfr9sePgr2okctZ9KRJlmcohVSDi1wN', CAST(N'2021-02-09 19:54:59.457' AS DateTime), CAST(N'2021-02-09 19:54:59.457' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'pScTwqbdrPNqKrYPN6VTxMwIIatSPhlr', CAST(N'2021-02-19 20:52:37.663' AS DateTime), CAST(N'2021-02-19 20:52:37.663' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'pv3jEVIgspQMJqApxwL01ITS3wheHt5Z', CAST(N'2020-12-03 16:24:16.030' AS DateTime), CAST(N'2020-12-03 16:24:16.030' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'PX23BcKTTgjZb0T13ypFTZpp1hfe0gbO', CAST(N'2021-02-16 16:19:20.650' AS DateTime), CAST(N'2021-02-16 16:19:20.650' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Q9RIXMzAnFTHapY5SBG0GZ7Oq1GWXX54', CAST(N'2021-01-07 15:10:48.043' AS DateTime), CAST(N'2021-01-07 15:10:48.043' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'qgqBxCCtJstIcx49B7cVcyqJwYLft3N9', CAST(N'2020-12-06 19:00:45.080' AS DateTime), CAST(N'2020-12-06 19:00:45.080' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'qrFIMAbfztgw1PnFM4QTdqXCPNBralCk', CAST(N'2020-12-23 18:22:50.747' AS DateTime), CAST(N'2020-12-23 18:22:50.747' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'QTu9EewFFtPXxhbG4QnZel34Yt1F3Nr6', CAST(N'2020-12-23 18:15:59.737' AS DateTime), CAST(N'2020-12-23 18:15:59.737' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'R2w8cl0TuXkfcA8rnLodLoRR7PfU7mCd', CAST(N'2020-12-03 18:46:52.653' AS DateTime), CAST(N'2020-12-03 18:46:52.653' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'r753zFC4ifUEbyJ07dS5lMyyfGCKXIjW', CAST(N'2020-10-18 15:35:39.300' AS DateTime), CAST(N'2020-10-18 15:35:39.300' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rbe6bl3myLZZzIhxPV9FBMDGDDWMO0as', CAST(N'2021-01-03 14:27:34.483' AS DateTime), CAST(N'2021-01-03 14:27:34.483' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rCJ9H3C31forA5687c1WNPR3atz9DNWk', CAST(N'2020-11-21 14:52:30.213' AS DateTime), CAST(N'2020-11-21 14:52:30.213' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rDm3nbKx76JIHZ0T6LBmXMtE6kSqFvn7', CAST(N'2020-12-22 16:35:35.233' AS DateTime), CAST(N'2020-12-22 16:35:35.233' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'RGjwfE5SXAQsD0RxwmV0p68YTM8Eq31u', CAST(N'2020-12-21 14:54:19.070' AS DateTime), CAST(N'2020-12-21 14:54:19.070' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rGokybU4XvJ8YARge5JyjXrXaiGje137', CAST(N'2021-01-06 14:27:20.407' AS DateTime), CAST(N'2021-01-06 14:27:20.407' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Rja247sqjPPAX9yWaC3smniMrZDP0oYx', CAST(N'2021-01-23 21:53:08.677' AS DateTime), CAST(N'2021-01-23 21:53:08.677' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'RjQ0ppTboKnspfbtvYA147MKLX0mdGnD', CAST(N'2020-12-10 18:31:25.500' AS DateTime), CAST(N'2020-12-10 18:31:25.500' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
GO
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rnsdmK7CU61ZzcCOUQbJ38CgsR8N5oK0', CAST(N'2020-12-21 16:15:52.477' AS DateTime), CAST(N'2020-12-21 16:15:52.477' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rq7TNuIZL5OdxCpDpIbfO4q0Tz2Wjkd1', CAST(N'2020-12-25 04:36:01.870' AS DateTime), CAST(N'2020-12-25 04:36:01.870' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rqdTGi9DlGjWiB66UuNm9rpud5Fr5ALf', CAST(N'2020-12-21 12:50:02.623' AS DateTime), CAST(N'2020-12-21 12:50:02.623' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'RvsvJmqVzfbBotRPU1pQGl47q8N3ijib', CAST(N'2020-10-18 17:14:36.097' AS DateTime), CAST(N'2020-10-18 17:14:36.097' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'rXQJesGoD7IJcaaOOZRrY4Fx0RmdlwAv', CAST(N'2020-12-23 17:53:50.827' AS DateTime), CAST(N'2020-12-23 17:53:50.827' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'RZu1eC2FDsEgI60PYJtYwqGjYWenMnLV', CAST(N'2021-01-05 16:36:54.897' AS DateTime), CAST(N'2021-01-05 16:36:54.897' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'S7AovTJm3x6g7ptoIbiTMV9yXhscffGK', CAST(N'2021-01-06 15:23:42.707' AS DateTime), CAST(N'2021-01-06 15:23:42.707' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'S7Iw13RZtOZgMQtPOzXOGsiWSxrM39xu', CAST(N'2021-03-09 16:45:56.307' AS DateTime), CAST(N'2021-03-09 16:45:56.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N's8YVZmWWAzEQEuJne1XY432vONOmNLqO', CAST(N'2020-12-06 14:26:22.213' AS DateTime), CAST(N'2020-12-06 14:26:22.213' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'saFZTUgyC7G8zcDaolGtoBaf2KmOxnWg', CAST(N'2021-01-11 11:26:26.590' AS DateTime), CAST(N'2021-01-11 11:26:26.590' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'saNXgKXOJCiw7qkGj0Cy8vTsqPNzvlgX', CAST(N'2020-12-22 13:58:19.497' AS DateTime), CAST(N'2020-12-22 13:58:19.497' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'sbtMzvJEPHkNGtGqW0FqOQJbBXxGJHuo', CAST(N'2021-01-15 18:07:49.850' AS DateTime), CAST(N'2021-01-15 18:07:49.850' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Sh3d1NAJuswG6c1mZVzTN6oK27JSrXTV', CAST(N'2020-12-21 12:58:38.020' AS DateTime), CAST(N'2020-12-21 12:58:38.020' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'siJfOKlZCuGsXlJRp1ezF4nowaEnFdOQ', CAST(N'2021-01-10 19:02:39.253' AS DateTime), CAST(N'2021-01-10 19:02:39.253' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SiubvrLYJfbv0hAjcLvRatK0DnZ456eE', CAST(N'2020-12-18 22:46:04.370' AS DateTime), CAST(N'2020-12-18 22:46:04.370' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SKn6FxTtStQDRUsTCL2gTGboLtG49n0I', CAST(N'2021-01-05 17:04:09.013' AS DateTime), CAST(N'2021-01-05 17:04:09.013' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SN4kARbFPae1aCGINQ6GWBsAtbOjEKN0', CAST(N'2021-02-21 18:09:00.717' AS DateTime), CAST(N'2021-02-21 18:09:00.717' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SN4NhIkaIcVsnj7tb5NJBOFU2zCZeZlA', CAST(N'2021-01-25 17:24:24.390' AS DateTime), CAST(N'2021-01-25 17:24:24.390' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SPFN5dGsJAO4LmcVQWYipDtjVs6RiNCO', CAST(N'2020-11-30 18:02:58.270' AS DateTime), CAST(N'2020-11-30 18:02:58.270' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'sTmDGkvnzv0R2M9OyBfYIjtb9YVWxGjo', CAST(N'2020-12-25 08:35:27.550' AS DateTime), CAST(N'2020-12-25 08:35:27.550' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SvelXRrtGRCkqJnnmAD1aVKK1Er5WX17', CAST(N'2021-02-04 13:01:18.013' AS DateTime), CAST(N'2021-02-04 13:01:18.013' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'SwM1spbccfhREFKoMubll5dQcZlV8BFR', CAST(N'2021-01-12 16:25:18.017' AS DateTime), CAST(N'2021-01-12 16:25:18.017' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tAZg74WtmqUEYxE2kLskg90XmTxAKW8O', CAST(N'2020-12-23 14:29:41.810' AS DateTime), CAST(N'2020-12-23 14:29:41.810' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'TEw2YQzSJXfQIg65eqIMghhhYXpdqzj1', CAST(N'2021-02-19 14:22:08.537' AS DateTime), CAST(N'2021-02-19 14:22:08.537' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tHFyGqCVK5s8u0l6J7a19dM6XLm2Mf0X', CAST(N'2021-01-11 21:29:41.747' AS DateTime), CAST(N'2021-01-11 21:29:41.747' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tiVRjShQ3D40xTW8ecqErCnO8K8KdhQm', CAST(N'2021-02-16 17:40:57.040' AS DateTime), CAST(N'2021-02-16 17:40:57.040' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tj8SAeX2L5EsfqetobqCDZ72R48T0pEv', CAST(N'2021-01-16 18:17:38.527' AS DateTime), CAST(N'2021-01-16 18:17:38.527' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tomOAM240huRGIgRcITkNCUIRqn52wVw', CAST(N'2020-12-10 16:23:32.073' AS DateTime), CAST(N'2020-12-10 16:23:32.073' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tQ5mGRgzFEXM6FBmqQREH8Rdi0ouiQ9F', CAST(N'2020-12-23 19:58:00.020' AS DateTime), CAST(N'2020-12-23 19:58:00.020' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Tqq0CJhX88yXEIjvnDY6M4SW0Vqz9cOe', CAST(N'2021-01-20 14:02:48.853' AS DateTime), CAST(N'2021-01-20 14:02:48.853' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Ts4lBHfrWmG0aJJnhnFjntKwac2zArpU', CAST(N'2021-02-06 21:39:17.030' AS DateTime), CAST(N'2021-02-06 21:39:17.030' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tuIFcry43Rry5ryicuOrtgi3DKc1NQ00', CAST(N'2021-01-15 17:09:57.297' AS DateTime), CAST(N'2021-01-15 17:09:57.297' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'TUKNauMuOZwQO7BngccEnD21JoSQ9QV1', CAST(N'2020-10-23 17:25:15.077' AS DateTime), CAST(N'2020-10-23 17:25:15.077' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'TUvM7lwwtqRhQoPGTkIdxDG8eFfWM7mV', CAST(N'2020-12-03 17:09:07.977' AS DateTime), CAST(N'2020-12-03 17:09:07.977' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'twWBari0dNjkLPTgcbC71On7crdBGwpJ', CAST(N'2021-01-02 20:20:02.393' AS DateTime), CAST(N'2021-01-02 20:20:02.393' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'tZgy1purGecDFQHMnB5SiMdQRPmp7Jom', CAST(N'2021-02-16 13:52:40.260' AS DateTime), CAST(N'2021-02-16 13:52:40.260' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'TzjaHTvj7DWc8jWUYZstzB8bDOmVGY1l', CAST(N'2020-12-03 12:46:41.230' AS DateTime), CAST(N'2020-12-03 12:46:41.230' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'U1WmwI27Ta7sxTqofGi9ur0l5M4LedVC', CAST(N'2020-12-06 21:04:41.460' AS DateTime), CAST(N'2020-12-06 21:04:41.460' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'u3rbCkrSAUnidOdokmYXHgh0JXa2Oj5P', CAST(N'2020-10-18 19:17:16.097' AS DateTime), CAST(N'2020-10-18 19:17:16.097' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'u7HqTRBzgovh0uIMwLe5hJhFzc8w4wg7', CAST(N'2020-11-24 19:51:55.063' AS DateTime), CAST(N'2020-11-24 19:51:55.063' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'uAXxRZ36o0fiUByoSpyJm0u8sqQQWKLK', CAST(N'2020-12-26 19:43:15.250' AS DateTime), CAST(N'2020-12-26 19:43:15.250' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'uFWdaMIIq8El0zFLvrZb3tt7j0zmQb5s', CAST(N'2021-01-16 21:28:15.123' AS DateTime), CAST(N'2021-01-16 21:28:15.123' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ugA0UjnxEB3bU0cS3zWOnxffIxqw1Rck', CAST(N'2020-12-14 11:52:16.717' AS DateTime), CAST(N'2020-12-14 11:52:16.717' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'UHpTIoZo95sdzL3PgwDoxEBW3gpgUjot', CAST(N'2021-01-06 15:35:31.560' AS DateTime), CAST(N'2021-01-06 15:35:31.560' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ujE4qvfRc7N3R5GIXOzRD2D6SYhorofO', CAST(N'2020-12-23 10:30:38.333' AS DateTime), CAST(N'2020-12-23 10:30:38.333' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ujV2dNkpXt6n2dAWH86qVdUt7MPRktqF', CAST(N'2020-12-23 20:03:49.853' AS DateTime), CAST(N'2020-12-23 20:03:49.853' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'uMXjmRKnx5jcdNmlz2oheNFzsqZlYABy', CAST(N'2020-12-05 19:49:35.343' AS DateTime), CAST(N'2020-12-05 19:49:35.343' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'UnasXKbgyXVCHH3qx3gjBEtHOGWUA8jB', CAST(N'2020-12-11 16:43:43.657' AS DateTime), CAST(N'2020-12-11 16:43:43.657' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'UQ7pyZxKk5Wtmj9WE10oHtzEmCMpsphw', CAST(N'2020-12-25 04:36:54.610' AS DateTime), CAST(N'2020-12-25 04:36:54.610' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'uWE1naESPcJtP0bcaWIDHsRD8m4F3RKb', CAST(N'2020-10-18 16:45:32.257' AS DateTime), CAST(N'2020-10-18 16:45:32.257' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'uwz9cUxcSeHS4XWMrkgEcBFyzxuQLkPn', CAST(N'2020-12-23 18:26:31.217' AS DateTime), CAST(N'2020-12-23 18:26:31.217' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'UYKaG4dEjdbJtZjNIe2rT25XtTtpwvaK', CAST(N'2021-01-13 11:25:10.520' AS DateTime), CAST(N'2021-01-13 11:25:10.520' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'V5smHnZzoctrKB1ZQjFS011muR1QZawZ', CAST(N'2020-12-22 13:50:05.053' AS DateTime), CAST(N'2020-12-22 13:50:05.053' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'VbCRT1DsYfdP0ZKGVkJVdwruzCskDOwL', CAST(N'2020-12-03 17:04:46.447' AS DateTime), CAST(N'2020-12-03 17:04:46.447' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'vdKfGHYHKiVfJR61Jdcfutjn0xG8ldSI', CAST(N'2021-01-30 19:43:56.370' AS DateTime), CAST(N'2021-01-30 19:43:56.370' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'VSeD3lCpKNOGsjqOzeMzk45nuy664jCB', CAST(N'2020-12-21 15:19:27.367' AS DateTime), CAST(N'2020-12-21 15:19:27.367' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Vu9u63orOrHjFvFQo1hUIVlbFLYEh67A', CAST(N'2020-11-29 20:26:54.247' AS DateTime), CAST(N'2020-11-29 20:26:54.247' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'VwHgi3Jo3ddXgKx3HjJvX49DU3G5LXgn', CAST(N'2021-01-13 10:32:29.267' AS DateTime), CAST(N'2021-01-13 10:32:29.267' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'W1PecupB7Zlq4w8wLys7NkbitVMZ3ks9', CAST(N'2020-12-12 14:13:00.420' AS DateTime), CAST(N'2020-12-12 14:13:00.420' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'W6iB3vgieZrbn54nmJdmJp2xJ7ba5zt2', CAST(N'2021-01-06 14:47:46.040' AS DateTime), CAST(N'2021-01-06 14:47:46.040' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'W6TG6IFjzipuo197QKYHtgNUZDhEE23n', CAST(N'2020-12-12 14:48:54.873' AS DateTime), CAST(N'2020-12-12 14:48:54.873' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'W8YZFHTo5SofUfaOTep6ekgWXZJqPYm6', CAST(N'2020-12-23 18:37:29.903' AS DateTime), CAST(N'2020-12-23 18:37:29.903' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'wESPFcppxsatzZ7tXwFdrh5dmsfT7QLJ', CAST(N'2020-12-10 18:05:56.660' AS DateTime), CAST(N'2020-12-10 18:05:56.660' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'whJqbcLdLi0hAlg2zQxfXUFrVWFsWcaC', CAST(N'2021-01-11 16:36:34.210' AS DateTime), CAST(N'2021-01-11 16:36:34.210' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WJp7jvrWH58ExBm8qRqPdAaZnglLp9QQ', CAST(N'2021-01-22 20:52:53.250' AS DateTime), CAST(N'2021-01-22 20:52:53.250' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WKxkFUEZFVB6wlBo1rmIWqdOh57t9RYa', CAST(N'2020-10-05 18:52:51.700' AS DateTime), CAST(N'2020-10-05 18:52:51.700' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WnR3TOkbjadf4hgSeDIeK6aunrFxPskQ', CAST(N'2021-01-25 10:03:40.950' AS DateTime), CAST(N'2021-01-25 10:03:40.950' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WS6L4mzl16XZXRdHP9Mqko7B7cXNQTjH', CAST(N'2021-01-04 21:27:35.030' AS DateTime), CAST(N'2021-01-04 21:27:35.030' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WSoUeg1GjHVfuGt17MJTiOQazxV3LJ8v', CAST(N'2021-02-16 13:17:41.270' AS DateTime), CAST(N'2021-02-16 13:17:41.270' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WuErqjZyiXP1kf3G5WykGqMs2SqKlWMD', CAST(N'2021-01-12 22:05:29.510' AS DateTime), CAST(N'2021-01-12 22:05:29.510' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'WvolBvtEbxzwRBHz82fZTZZojDab0iH9', CAST(N'2020-12-12 13:53:42.820' AS DateTime), CAST(N'2020-12-12 13:53:42.820' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xcFGYipf4J1HimOEm5hThyM9jvCGFbuv', CAST(N'2020-12-23 18:17:24.340' AS DateTime), CAST(N'2020-12-23 18:17:24.340' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'XhkkGZxXcOhe7slBflJaDGFhTBEYKikw', CAST(N'2021-01-05 16:35:36.150' AS DateTime), CAST(N'2021-01-05 16:35:36.150' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'XjdmcE7gjL9C7vWdi8kNYL0UcqGxpAI5', CAST(N'2020-12-22 13:55:01.583' AS DateTime), CAST(N'2020-12-22 13:55:01.583' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'XKGO8FqaQlhbaa689HCUkifM8NwgF76R', CAST(N'2020-12-03 16:40:22.503' AS DateTime), CAST(N'2020-12-03 16:40:22.503' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xMyJ1zrHz1lktqNnWhkwkrgP22i4aOCl', CAST(N'2020-12-03 17:39:57.203' AS DateTime), CAST(N'2020-12-03 17:39:57.203' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xOovGMc2eTjAOtUFJBPn9uWRVB6t8SSR', CAST(N'2020-12-22 17:46:54.843' AS DateTime), CAST(N'2020-12-22 17:46:54.843' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xT6NHlSZPYgGkFcbsZOjxy3ZVJJAs2Ha', CAST(N'2020-12-21 10:40:53.193' AS DateTime), CAST(N'2020-12-21 10:40:53.193' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xuJnR7pbTSl9XRhQG25A99bJCgxVwK5z', CAST(N'2020-12-03 16:50:02.440' AS DateTime), CAST(N'2020-12-03 16:50:02.440' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Xv8MZdlON2ctarkdzfVveo6Z1l1EezdV', CAST(N'2021-01-07 19:26:29.010' AS DateTime), CAST(N'2021-01-07 19:26:29.010' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'xyPSU7Ek1XTXf9RbqhogvXox6KZfjOF6', CAST(N'2021-02-05 21:14:18.103' AS DateTime), CAST(N'2021-02-05 21:14:18.103' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Y1T7Ya0HhBdOuRFZTaytkw0vSzvJgk9L', CAST(N'2020-12-15 19:13:16.957' AS DateTime), CAST(N'2020-12-15 19:13:16.957' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Y49QH0QiN4BSILrF9htGvXTwTZcjJKrl', CAST(N'2020-10-18 17:28:31.290' AS DateTime), CAST(N'2020-10-18 17:28:31.290' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Y6AjEYANCn18ZJCmwhmBvwTCXYfpbyzC', CAST(N'2020-10-18 16:22:21.683' AS DateTime), CAST(N'2020-10-18 16:22:21.683' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'y6xcrv5NrpJ6IjtgHylDaUodFrn4WLuH', CAST(N'2020-12-03 18:46:10.420' AS DateTime), CAST(N'2020-12-03 18:46:10.420' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Y8AaGkKb0Q5aHOwN3awFuKMbB7gC0Q83', CAST(N'2021-02-08 13:39:26.587' AS DateTime), CAST(N'2021-02-08 13:39:26.587' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YcdvtKcHGtRM4zSWfociZgxNbuJ1e7dU', CAST(N'2021-01-05 16:44:33.583' AS DateTime), CAST(N'2021-01-05 16:44:33.583' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YCldKrCrC0AUHS6X1210lL3PGmo5Y4uQ', CAST(N'2020-12-03 20:54:17.697' AS DateTime), CAST(N'2020-12-03 20:54:17.697' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'yDbLusw5lvhIPcfbxrFsqLow3VF1ae9K', CAST(N'2021-01-16 21:20:42.330' AS DateTime), CAST(N'2021-01-16 21:20:42.330' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YHrl4vIYVEBoznsHS5yPcC9BP0XxIDOY', CAST(N'2021-01-28 17:10:09.733' AS DateTime), CAST(N'2021-01-28 17:10:09.733' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YIueqveWCNYlNTve6bnHWBrrInmP9xza', CAST(N'2020-12-07 22:01:40.340' AS DateTime), CAST(N'2020-12-07 22:01:40.340' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YorfZlScqmdxIP5nu2vUILwWLt3ZX7V2', CAST(N'2020-11-26 20:16:42.507' AS DateTime), CAST(N'2020-11-26 20:16:42.507' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YR1UxjF5pHDUwS8FqDP3OSTYJHPTuA6Y', CAST(N'2020-12-14 11:02:35.433' AS DateTime), CAST(N'2020-12-14 11:02:35.433' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YRMOc6KuEZWFkJ2d5yo1cqLZiAHuuXVs', CAST(N'2021-01-02 22:15:13.250' AS DateTime), CAST(N'2021-01-02 22:15:13.250' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'yrwAp1k33CJ7jx2RJ7CuTXF4ZWD4Xwrb', CAST(N'2020-12-03 17:40:24.707' AS DateTime), CAST(N'2020-12-03 17:40:24.707' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ysXvyb31sqo2wZNFl14j7lRoKrxkCBPx', CAST(N'2020-12-21 16:34:37.090' AS DateTime), CAST(N'2020-12-21 16:34:37.090' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ytH0FOTuJML9MvdOFehuz0ci08hlJssn', CAST(N'2020-12-15 19:36:45.443' AS DateTime), CAST(N'2020-12-15 19:36:45.443' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'YuHeh6tlLSxEPBzn0PlPnup7wGbvBEFx', CAST(N'2020-12-21 12:04:01.253' AS DateTime), CAST(N'2020-12-21 12:04:01.253' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'Z6TueJLKhUA65E3njrL8Y03sx6niPqW2', CAST(N'2020-10-18 19:26:08.867' AS DateTime), CAST(N'2020-10-18 19:26:08.867' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZAmouHaeEeqUf8OObf1WxnWn1oqboILp', CAST(N'2021-02-15 19:46:58.440' AS DateTime), CAST(N'2021-02-15 19:46:58.440' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
GO
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZBeQTe0k4GpwXJNajLk5alQSSuxQpx0U', CAST(N'2020-12-08 20:00:54.307' AS DateTime), CAST(N'2020-12-08 20:00:54.307' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZF4EDU4P8jFxyEMzlKfcUTRzvo7xUL3g', CAST(N'2020-11-26 20:19:56.810' AS DateTime), CAST(N'2020-11-26 20:19:56.810' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'zFlPhfy24AOw0wQUeKLO4QdRShDURsRs', CAST(N'2020-11-25 11:50:20.200' AS DateTime), CAST(N'2020-11-25 11:50:20.200' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'zfNNwav1vb3QKJkNp4pKfuOX0lSBQ0Xs', CAST(N'2020-10-18 18:27:46.650' AS DateTime), CAST(N'2020-10-18 18:27:46.650' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZG8GptOR01KUrz9YWff6ZKDSKUFzZ2Ra', CAST(N'2021-01-04 12:17:18.560' AS DateTime), CAST(N'2021-01-04 12:17:18.560' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'zHPSqEeA5rFtMglKNgebYVYk5oXh6x9W', CAST(N'2020-12-12 19:55:50.623' AS DateTime), CAST(N'2020-12-12 19:55:50.623' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'zIhBDEKYvcBv8A5GRfAkGSFJP17JY2TK', CAST(N'2020-12-13 13:21:45.573' AS DateTime), CAST(N'2020-12-13 13:21:45.573' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZMwcAwl0DTlhgQqpRdPdMX4m94ziuXXy', CAST(N'2020-12-03 20:34:29.183' AS DateTime), CAST(N'2020-12-03 20:34:29.183' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'znkCc2kQ1mSVXifUkVbSax3Smz5AQl9q', CAST(N'2021-02-06 22:42:12.073' AS DateTime), CAST(N'2021-02-06 22:42:12.073' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZOgexuv8QZSJbssaDiz7h4idskh1AQ4P', CAST(N'2020-12-21 10:47:22.620' AS DateTime), CAST(N'2020-12-21 10:47:22.620' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'zSxGcvgobiY3SEX2UBVXsf4FcMLqUnvE', CAST(N'2020-12-25 06:37:42.850' AS DateTime), CAST(N'2020-12-25 06:37:42.850' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (1, N'ZufT9K57CMQ570TkNj1mZWIxs8CfOMHT', CAST(N'2020-12-21 13:19:10.533' AS DateTime), CAST(N'2020-12-21 13:19:10.533' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'25LiLtdBO0l0PLX4uRfFkm69mJfdpPFT', CAST(N'2020-10-05 17:21:45.270' AS DateTime), CAST(N'2020-10-05 17:21:45.270' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'CWg9VQYoCnmRytBtfinMkTeu7ZGjaFFZ', CAST(N'2020-10-03 14:06:09.267' AS DateTime), CAST(N'2020-10-03 14:06:09.267' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'f507vUQbcCjpBxwObKtbIKOGqYYslFRN', CAST(N'2020-12-03 13:22:11.767' AS DateTime), CAST(N'2020-12-03 13:22:11.767' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'I8ktEjqNgtjUkMDnrd2fCas8Oxav2gL6', CAST(N'2020-12-03 18:46:29.940' AS DateTime), CAST(N'2020-12-03 18:46:29.940' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'lHIC0CeShjrAt5P84I040YrvbIW58xcT', CAST(N'2020-10-05 17:09:16.620' AS DateTime), CAST(N'2020-10-05 17:09:16.620' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'pbB4iRE5U3O2PliGL9eC3hMcaR79seGD', CAST(N'2020-10-05 17:01:33.493' AS DateTime), CAST(N'2020-10-05 17:01:33.493' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'SessionId', CAST(N'2020-10-03 13:01:35.087' AS DateTime), CAST(N'2020-10-03 13:01:35.087' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'SessionId1', CAST(N'2020-10-03 13:44:09.900' AS DateTime), CAST(N'2020-10-03 13:44:09.900' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'SessionId2', CAST(N'2020-10-03 13:53:28.753' AS DateTime), CAST(N'2020-10-03 13:53:28.753' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'X5P9cfScH2mFPsKG3r7V4bfLgvGXTVuB', CAST(N'2020-12-03 16:19:33.710' AS DateTime), CAST(N'2020-12-03 16:19:33.710' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'y9ocQDNYHJ46HvJscFGz6gfuB0CfYwHc', CAST(N'2020-10-05 17:00:16.780' AS DateTime), CAST(N'2020-10-05 17:00:16.780' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UserSessions] ([UserId], [SessionId], [LoginDateTime], [LastActiveDateTime], [LogoutDateTime], [SessionStatus], [IPAddress], [Browser], [OS]) VALUES (2, N'yFE1TpQvmcCPjgHs10Uj2OyZkrFVLtBj', CAST(N'2020-10-03 14:07:49.367' AS DateTime), CAST(N'2020-10-03 14:07:49.367' AS DateTime), NULL, 1, N'127.0.0.1', N'Postman', N'Windows')
INSERT [dbo].[UsersMerchantUserGroups] ([UserId], [UserGroupId], [IsActive]) VALUES (16, 14, 1)
/****** Object:  Index [UQ_ReversePK]    Script Date: 3/12/2021 5:15:03 PM ******/
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [UQ_ReversePK] UNIQUE NONCLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_ActiveFrom]  DEFAULT (getdate()) FOR [ActiveFrom]
GO
ALTER TABLE [dbo].[MerchantsSiteUrl] ADD  CONSTRAINT [DF_MerchantsSiteUrl_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MerchantsSiteUrls] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrganizationMerchants] ADD  CONSTRAINT [DF_OrganizationMerchants_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrganizationMerchants] ADD  CONSTRAINT [DF_OrganizationMerchants_ActiveFrom]  DEFAULT (getdate()) FOR [ActiveFrom]
GO
ALTER TABLE [dbo].[Organizations] ADD  CONSTRAINT [DF_Organizations_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Organizations] ADD  CONSTRAINT [DF_Organizations_IsMarketPlace]  DEFAULT ((0)) FOR [IsMarketPlace]
GO
ALTER TABLE [dbo].[Organizations] ADD  CONSTRAINT [DF_Organizations_ActiveFrom]  DEFAULT (getdate()) FOR [ActiveFrom]
GO
ALTER TABLE [dbo].[PostResources] ADD  CONSTRAINT [DF_PostResources_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PostResources] ADD  CONSTRAINT [DF_PostResources_LastUpdatedOn]  DEFAULT (getdate()) FOR [LastUpdatedOn]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_LastUpdatedDate]  DEFAULT (getdate()) FOR [LastUpdatedDate]
GO
ALTER TABLE [dbo].[PostsContainerTemplates] ADD  CONSTRAINT [DF_PostsContainerTemplates_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PostsContainerTemplates] ADD  CONSTRAINT [DF_PostsContainerTemplates_ActiveFrom]  DEFAULT (getdate()) FOR [ActiveFrom]
GO
ALTER TABLE [dbo].[Resources] ADD  CONSTRAINT [DF_Resources_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Resources] ADD  CONSTRAINT [DF_Resources_LastUpdatedOn]  DEFAULT (getdate()) FOR [LastUpdatedOn]
GO
ALTER TABLE [dbo].[Templates] ADD  CONSTRAINT [DF_Templates_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CategoryProducts]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProducts_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[CategoryProducts] CHECK CONSTRAINT [FK_CategoryProducts_Categories]
GO
ALTER TABLE [dbo].[CategoryProducts]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CategoryProducts] CHECK CONSTRAINT [FK_CategoryProducts_Products]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Currencies]
GO
ALTER TABLE [dbo].[CountryStates]  WITH CHECK ADD  CONSTRAINT [FK_CountryStates_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[CountryStates] CHECK CONSTRAINT [FK_CountryStates_Countries]
GO
ALTER TABLE [dbo].[LookupValues]  WITH CHECK ADD  CONSTRAINT [FK_LookupValues_LookupGroup] FOREIGN KEY([LookupGroupId])
REFERENCES [dbo].[LookupGroups] ([LookupGroupId])
GO
ALTER TABLE [dbo].[LookupValues] CHECK CONSTRAINT [FK_LookupValues_LookupGroup]
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductBundlePrices_Currencies] FOREIGN KEY([CurrencyCode])
REFERENCES [dbo].[Currencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices] CHECK CONSTRAINT [FK_MerchantProductBundlePrices_Currencies]
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductBundlePrices_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices] CHECK CONSTRAINT [FK_MerchantProductBundlePrices_Merchants]
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductBundlePrices_ProductBundles] FOREIGN KEY([BundleId])
REFERENCES [dbo].[ProductBundles] ([BundleId])
GO
ALTER TABLE [dbo].[MerchantProductBundlePrices] CHECK CONSTRAINT [FK_MerchantProductBundlePrices_ProductBundles]
GO
ALTER TABLE [dbo].[MerchantProductBundles]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductBundles_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantProductBundles] CHECK CONSTRAINT [FK_MerchantProductBundles_Merchants]
GO
ALTER TABLE [dbo].[MerchantProductBundles]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductBundles_ProductBundles] FOREIGN KEY([BundleId])
REFERENCES [dbo].[ProductBundles] ([BundleId])
GO
ALTER TABLE [dbo].[MerchantProductBundles] CHECK CONSTRAINT [FK_MerchantProductBundles_ProductBundles]
GO
ALTER TABLE [dbo].[MerchantProductPrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductPrices_Currencies] FOREIGN KEY([CurrencyCode])
REFERENCES [dbo].[Currencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[MerchantProductPrices] CHECK CONSTRAINT [FK_MerchantProductPrices_Currencies]
GO
ALTER TABLE [dbo].[MerchantProductPrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductPrices_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantProductPrices] CHECK CONSTRAINT [FK_MerchantProductPrices_Merchants]
GO
ALTER TABLE [dbo].[MerchantProductPrices]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProductPrices_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[MerchantProductPrices] CHECK CONSTRAINT [FK_MerchantProductPrices_Products]
GO
ALTER TABLE [dbo].[MerchantProducts]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProducts_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantProducts] CHECK CONSTRAINT [FK_MerchantProducts_Merchants]
GO
ALTER TABLE [dbo].[MerchantProducts]  WITH CHECK ADD  CONSTRAINT [FK_MerchantProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[MerchantProducts] CHECK CONSTRAINT [FK_MerchantProducts_Products]
GO
ALTER TABLE [dbo].[Merchants]  WITH CHECK ADD  CONSTRAINT [FK_Merchants_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Merchants] CHECK CONSTRAINT [FK_Merchants_Countries]
GO
ALTER TABLE [dbo].[Merchants]  WITH CHECK ADD  CONSTRAINT [FK_Merchants_CountryStates] FOREIGN KEY([StateId])
REFERENCES [dbo].[CountryStates] ([StateId])
GO
ALTER TABLE [dbo].[Merchants] CHECK CONSTRAINT [FK_Merchants_CountryStates]
GO
ALTER TABLE [dbo].[Merchants]  WITH CHECK ADD  CONSTRAINT [FK_Merchants_Currencies] FOREIGN KEY([DefaultCurrencyId])
REFERENCES [dbo].[Currencies] ([CurrencyId])
GO
ALTER TABLE [dbo].[Merchants] CHECK CONSTRAINT [FK_Merchants_Currencies]
GO
ALTER TABLE [dbo].[MerchantsSiteUrl]  WITH CHECK ADD  CONSTRAINT [FK_MerchantsSiteUrl_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantsSiteUrl] CHECK CONSTRAINT [FK_MerchantsSiteUrl_Merchants]
GO
ALTER TABLE [dbo].[MetaKeys]  WITH CHECK ADD  CONSTRAINT [FK_MetaKeys_ContainerTemplates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[ContainerTemplates] ([TemplateId])
GO
ALTER TABLE [dbo].[MetaKeys] CHECK CONSTRAINT [FK_MetaKeys_ContainerTemplates]
GO
ALTER TABLE [dbo].[MetaKeys]  WITH NOCHECK ADD  CONSTRAINT [FK_MetaKeys_LookupGroups] FOREIGN KEY([LookupGroupId])
REFERENCES [dbo].[LookupGroups] ([LookupGroupId])
GO
ALTER TABLE [dbo].[MetaKeys] NOCHECK CONSTRAINT [FK_MetaKeys_LookupGroups]
GO
ALTER TABLE [dbo].[MetaKeys]  WITH CHECK ADD  CONSTRAINT [FK_MetaKeys_MetaGroups] FOREIGN KEY([MetaGroupId])
REFERENCES [dbo].[MetaGroups] ([MetaGroupId])
GO
ALTER TABLE [dbo].[MetaKeys] CHECK CONSTRAINT [FK_MetaKeys_MetaGroups]
GO
ALTER TABLE [dbo].[OrganizationMerchants]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationMerchants_Organizations] FOREIGN KEY([OrgId])
REFERENCES [dbo].[Organizations] ([OrgId])
GO
ALTER TABLE [dbo].[OrganizationMerchants] CHECK CONSTRAINT [FK_OrganizationMerchants_Organizations]
GO
ALTER TABLE [dbo].[OrganizationMerchants]  WITH CHECK ADD  CONSTRAINT [FK_OrgMerchants_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[OrganizationMerchants] CHECK CONSTRAINT [FK_OrgMerchants_Merchants]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Merchants] FOREIGN KEY([DefaultMerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Merchants]
GO
ALTER TABLE [dbo].[PostMetaData]  WITH CHECK ADD  CONSTRAINT [FK_PostMetaData_MetaKeys] FOREIGN KEY([MetaId])
REFERENCES [dbo].[MetaKeys] ([MetaId])
GO
ALTER TABLE [dbo].[PostMetaData] CHECK CONSTRAINT [FK_PostMetaData_MetaKeys]
GO
ALTER TABLE [dbo].[PostMetaData]  WITH CHECK ADD  CONSTRAINT [FK_PostMetaData_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostMetaData] CHECK CONSTRAINT [FK_PostMetaData_Posts]
GO
ALTER TABLE [dbo].[PostResources]  WITH CHECK ADD  CONSTRAINT [FK_PostResources_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostResources] CHECK CONSTRAINT [FK_PostResources_Posts]
GO
ALTER TABLE [dbo].[PostResources]  WITH CHECK ADD  CONSTRAINT [FK_PostResources_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([ResourceId])
GO
ALTER TABLE [dbo].[PostResources] CHECK CONSTRAINT [FK_PostResources_Resources]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_ApproverUsers] FOREIGN KEY([ApproverUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_ApproverUsers]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_AuthorUsers] FOREIGN KEY([AuthorUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_AuthorUsers]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Images] FOREIGN KEY([ThumbnailImageId])
REFERENCES [dbo].[Images] ([ImageId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Images]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_ParentPosts] FOREIGN KEY([PostParentId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_ParentPosts]
GO
ALTER TABLE [dbo].[PostsContainerTemplates]  WITH CHECK ADD  CONSTRAINT [FK_PostsContainerTemplates_ContainerTemplates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[ContainerTemplates] ([TemplateId])
GO
ALTER TABLE [dbo].[PostsContainerTemplates] CHECK CONSTRAINT [FK_PostsContainerTemplates_ContainerTemplates]
GO
ALTER TABLE [dbo].[PostsContainerTemplates]  WITH NOCHECK ADD  CONSTRAINT [FK_PostsContainerTemplates_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostsContainerTemplates] CHECK CONSTRAINT [FK_PostsContainerTemplates_Posts]
GO
ALTER TABLE [dbo].[ProductBundleProducts]  WITH CHECK ADD  CONSTRAINT [FK_ProductBundleProducts_ProductBundles] FOREIGN KEY([BundleId])
REFERENCES [dbo].[ProductBundles] ([BundleId])
GO
ALTER TABLE [dbo].[ProductBundleProducts] CHECK CONSTRAINT [FK_ProductBundleProducts_ProductBundles]
GO
ALTER TABLE [dbo].[ProductBundleProducts]  WITH CHECK ADD  CONSTRAINT [FK_ProductBundleProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductBundleProducts] CHECK CONSTRAINT [FK_ProductBundleProducts_Products]
GO
ALTER TABLE [dbo].[ProductBundles]  WITH CHECK ADD  CONSTRAINT [FK_ProductBundles_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[ProductBundles] CHECK CONSTRAINT [FK_ProductBundles_Company]
GO
ALTER TABLE [dbo].[ProductBundles]  WITH CHECK ADD  CONSTRAINT [FK_ProductBundles_Merchants] FOREIGN KEY([CreatorMerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[ProductBundles] CHECK CONSTRAINT [FK_ProductBundles_Merchants]
GO
ALTER TABLE [dbo].[ProductMetaData]  WITH CHECK ADD  CONSTRAINT [FK_ProductMetaData_MetaKeys] FOREIGN KEY([MetaId])
REFERENCES [dbo].[MetaKeys] ([MetaId])
GO
ALTER TABLE [dbo].[ProductMetaData] CHECK CONSTRAINT [FK_ProductMetaData_MetaKeys]
GO
ALTER TABLE [dbo].[ProductMetaData]  WITH CHECK ADD  CONSTRAINT [FK_ProductMetaData_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMetaData] CHECK CONSTRAINT [FK_ProductMetaData_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Company]
GO
ALTER TABLE [dbo].[Templates]  WITH CHECK ADD  CONSTRAINT [FK_PostsContainerTemplates_Templates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Templates] ([TemplateId])
GO
ALTER TABLE [dbo].[Templates] CHECK CONSTRAINT [FK_PostsContainerTemplates_Templates]
GO
ALTER TABLE [dbo].[UserMetaData]  WITH CHECK ADD  CONSTRAINT [FK_UserMetaData_MetaKeys] FOREIGN KEY([MetaId])
REFERENCES [dbo].[MetaKeys] ([MetaId])
GO
ALTER TABLE [dbo].[UserMetaData] CHECK CONSTRAINT [FK_UserMetaData_MetaKeys]
GO
ALTER TABLE [dbo].[UserMetaData]  WITH CHECK ADD  CONSTRAINT [FK_UserMetaData_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserMetaData] CHECK CONSTRAINT [FK_UserMetaData_Users]
GO
ALTER TABLE [dbo].[UserSessions]  WITH CHECK ADD  CONSTRAINT [FK_UserSessions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserSessions] CHECK CONSTRAINT [FK_UserSessions_Users]
GO
ALTER TABLE [dbo].[UsersMerchantUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantUserGroups_MerchantUserGroups] FOREIGN KEY([UserId], [UserGroupId])
REFERENCES [dbo].[UsersMerchantUserGroups] ([UserId], [UserGroupId])
GO
ALTER TABLE [dbo].[UsersMerchantUserGroups] CHECK CONSTRAINT [FK_UsersMerchantUserGroups_MerchantUserGroups]
GO
ALTER TABLE [dbo].[UsersMerchantUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantUserGroups_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersMerchantUserGroups] CHECK CONSTRAINT [FK_UsersMerchantUserGroups_Users]
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 3/12/2021 5:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
--GetCategories 'anatomy'

CREATE Proc [dbo].[GetCategories]
 @CategoryName varchar(50)=''
AS
BEGIN
SET NOCOUNT ON
 
Select C.CategoryId,C.CategoryName,C.IsActive,CG.CategoryGroupId,CG.CategoryGroupName,CT.CategoryType from Categories C inner join CategoryGroups CG on C.CategoryGroupId=CG.CategoryGroupId
inner join CategoryTypes CT on C.CategoryType=CT.CategoryTypeId where C.IsActive=1 and Cg.IsActive=1 and CategoryName like '%'+@CategoryName+'%'
 
END
GO
