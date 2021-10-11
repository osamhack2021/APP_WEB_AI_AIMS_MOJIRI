const Sequelize = require('sequelize');

class Device extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            owner_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            model_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            imei_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            camera_active: {
                type: Sequelize.BOOLEAN,
                allowNull: false,
            },
        }, {
            sequelize,
            timestamps: true,
            modelName: 'Device',
            tableName: 'devices',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {}
};

module.exports = Device;