// import { ENUM } from "sequelize/types"

const db = require("../models")

const CategoryType= {
    Post : 1,
    Page : 2,
    Product : 3,
    Deck : 4,
};

// const ResourceType =  {
//         Primary : 1, //Any Product URL which is opened needs to have the Primary ResourceType as its type
//         FeaturedImage : 2,
//         PDF : 3,
//         Excel : 4,
//         Word : 5
//     }

//     const ProductType
//     {
//         SCORMPackage : 1,
//         //DigitalProduct = 2,
//         //PhysicalSubscription = 3,
//         //DigitalSubscription = 4,
//         //Courses = 5,
//         //Deck = 6,
//         //External = 7,
//         //Video = 8
//     }