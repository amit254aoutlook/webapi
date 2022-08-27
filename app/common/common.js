const commonfunc={}
commonfunc.getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: categories } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems / limit);
  
    return { totalItems, categories, totalPages, currentPage };
};

commonfunc.getPagination = (page, size) => {
    const limit = size ? +size : 5;
    const offset = page ? page * limit : 0;
  
    return { limit, offset };
};

module.exports = commonfunc;