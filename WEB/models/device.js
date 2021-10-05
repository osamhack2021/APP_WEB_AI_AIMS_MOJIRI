const Sequelize = require('sequelize');

class Device extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            model_num: {
                type: Sequelize.STRING(20),
                allowNull: false,
            },
            imei_num: {
                type: Sequelize.INTEGER.UNSIGNED,
                allowNull: false,
            },
            camera_active: {
                type: Sequelize.BOOLEAN,
                allowNull: false,
            },
            created_at: {
                type: Sequelize.DATE,
                allowNull: false,
                defaultValue: Sequelize.NOW,
            },
        }, {
            sequelize,
            timestamps: false,
            modelName: 'Device',
            tableName: 'devices',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {
        db.Device.belongsTo(db.User, { foreignKey: "owner_num", targetkey: "serial_num" });
    }
};

module.exports = Device;