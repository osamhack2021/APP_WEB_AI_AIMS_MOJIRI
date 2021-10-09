'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('mnd', [
      {
        name: '노수인',
        age: 22,
        social_security_num: '123456-1234567',
        serial_num: '20-76077320',
        unit_num: 1234,
        position_num: 123,
      },
      {
        name: '김시원',
        age: 21,
        social_security_num: '654321-7654321',
        serial_num: '20-12345678',
        unit_num: 5678,
        position_num: 456,
      },
      {
        name: '이재승',
        age: 22,
        social_security_num: '987654-9876543',
        serial_num: '20-98765432',
        unit_num: 4321,
        position_num: 321,
      },
    ])
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
