const Sequelize = require('sequelize');

class Admin extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            name: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            unit_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            serial_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
                unique: true
            },
            password: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            permission: {
                type: Sequelize.INTEGER.UNSIGNED,
                allowNull: false,
            },
        }, {
            sequelize,
            timestamps: false,
            underscored: false,
            modelName: 'admin',
            tableName: 'admins',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {}
}

module.exports = Admin;