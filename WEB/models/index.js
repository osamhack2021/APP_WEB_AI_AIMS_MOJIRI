const Sequelize = require('sequelize');
const Soldier = require('./soldier.js');
const User = require('./user.js');
const Admin = require('./admin.js');

const env = process.env.NODE_ENV || 'development';
const config = require('../config/config')[env];
const db = {};

const sequelize = new Sequelize(config.database, config.username, config.password, config);

db.sequelize = sequelize;

db.Soldier = Soldier;
db.User = User;
db.Admin = Admin;

Soldier.init(sequelize);
User.init(sequelize);
Admin.init(sequelize);

Soldier.associate(db);
User.associate(db);
Admin.associate(db);

module.exports = db;