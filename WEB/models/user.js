const Sequelize = require('sequelize');

class User extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            name: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            serial_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            unit_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            imei_num: {
                type: Sequelize.STRING(20),
                allowNull: false
            },
            model_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            camera_is: {
                type: Sequelize.BOOLEAN,
                allowNull: false,
            },
            security_pledge: {
                type: Sequelize.TEXT('long'),
                allowNull: false,
            },
        }, {
            sequelize,
            timestamps: false,
            underscored: false,
            modelName: 'User',
            tableName: 'users',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {}
}

module.exports = User;
