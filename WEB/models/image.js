const Sequelize = require('sequelize');

class Image extends Sequelize.Model {
    static init(sequelize) {
        return super.init({
            origin_image: {
                type: Sequelize.TEXT('long'),
                allowNull: false,
            },
            edited_image: {
                type: Sequelize.TEXT('long'),
                allowNull: false
            }
        }, {
            sequelize,
            timestamps: true,
            underscored: false,
            modelName: 'Image',
            tableName: 'images',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci'
        });
    }

    static associate(db) {}
}

module.exports = Image;