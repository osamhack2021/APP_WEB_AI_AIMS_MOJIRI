module.exports = (sequelizeConfig, Sequelize) => {
    const User = sequelizeConfig.define(
        'user',
        {
            name: {
                type: Sequelize.STRING
            },
            serial_num: {
                type: Sequelize.INTEGER
            },
            unit_num: {
                type: Sequelize.INTEGER
            },
            permission: {
                type: Sequelize.INTEGER
            }
        }
    )

    return User;
}