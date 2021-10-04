const Sequelize = require('sequelize');
const User = require('./user.js');
const Device = require('./device.js');
const Soldier = require('./soldier.js');

const env = process.env.NODE_ENV || 'development';
const config = require('../config/config')[env];
const db = {};

const sequelize = new Sequelize(config.database, config.username, config.password, config);

db.sequelize = sequelize;

db.User = User;
db.Device = Device;
db.Soldier = Soldier;

User.init(sequelize);
Device.init(sequelize);
Soldier.init(sequelize);

User.associate(db);
Device.associate(db);
Soldier.associate(db);

module.exports = db;