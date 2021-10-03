// 국방부 DB 예상도
// 군인들 개인 정보가 존재한다고 가정

const Sequelize = require('sequelize');

class Soldier extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            name: {
                type: Sequelize.STRING(100),
                allowNull: false,
            },
            age: {
                type: Sequelize.INTEGER(20),
                allowNull: false,
            },
            social_security_num: {
                type: Sequelize.STRING(100),
                allowNull: false,
            },
            serial_num: {
                type: Sequelize.INTEGER(20),
                allowNull: false,
            },
            unit_num: {
                type: Sequelize.INTEGER(20),
                allowNull: false,
            },
            position_num: {
                type: Sequelize.INTEGER(20),
                allowNull: false,
            },
            permission: {
                type: Sequelize.INTEGER(20),
                allowNull: false,
            }
        }, {
            sequelize,
            timestamps: false,
            underscored: false,
            modelName: 'Soldier',
            tableName: 'mnd',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }
    
    static associate(db) {}
};

module.exports = Soldier;