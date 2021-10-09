const Sequelize = require('sequelize');

class Pledge extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            owner_num: {
                type: Sequelize.INTEGER,
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
            modelName: 'pledge',
            tableName: 'pledges',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {}
};

module.exports = Device;