'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('mnd', [
      {
        name: '노수인',
        age: 22,
        social_security_num: '000223-3464323',
        serial_num: '20-76077320',
        unit_num: '7093',
        position_num: '456',
        rank: '상병',
      },
      {
        name: '김시원',
        age: 21,
        social_security_num: '654321-7654321',
        serial_num: '20-12345678',
        unit_num: '3819',
        position_num: '456',
        rank: '상병',
      },
      {
        name: '이재승',
        age: 22,
        social_security_num: '000423-3123456',
        serial_num: '20-98765432',
        unit_num: '3819',
        position_num: '321' ,
        rank: '일병'
      },
      {
        name: '나일병',
        age: 21,
        social_security_num: '011024-324567',
        serial_num: '21-34563212',
        unit_num: '7093',
        position_num: '452',
        rank: '일병'
      },
      {
        name: '김이병',
        age: 22,
        social_security_num: '000721-3684932',
        serial_num: '21-14569321',
        unit_num: '5932',
        position_num: '563' ,
        rank: '이병'
      },
      {
        name: '심상병',
        age: 23,
        social_security_num: '991012-1833212',
        serial_num: '20-64332212',
        unit_num: '5321',
        position_num: '750' ,
        rank: '상병'
      },
      {
        name: '이병장',
        age: 23,
        social_security_num: '990829-1544321',
        serial_num: '19-75044321',
        unit_num: '1303',
        position_num: '756' ,
        rank: '병장'
      }
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
