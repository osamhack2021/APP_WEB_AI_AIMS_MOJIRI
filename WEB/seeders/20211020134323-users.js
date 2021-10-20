'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('users', [
      {
        name: '노수인',
        serial_num: '20-76077320',
        unit_num: '7093',
        imei_num: '359512371598486',
        model_num: 'SM-A1303',
        camera_is: true,
        security_pledge: 'dada'
      },
      {
        name: '나일병',
        serial_num: '21-34563212',
        unit_num: '7093',
        imei_num: '569512435266546',
        model_num: 'SM-A5302',
        camera_is: true,
        security_pledge: 'dada'
      },
      {
        name: '김이병',
        serial_num: '21-14569321',
        unit_num: '5932',
        imei_num: '538322371594567',
        model_num: 'AN-A8532',
        camera_is: true,
        security_pledge: 'dada'
      },
      {
        name: '심상병',
        serial_num: '20-64332212',
        unit_num: '5321',
        imei_num: '981236543798486',
        model_num: 'SM-A1303',
        camera_is: true,
        security_pledge: 'dada'
      },
      {
        name: '이병장',
        serial_num: '19-75044321',
        unit_num: '1303',
        imei_num: '513443673454234',
        model_num: 'TN-3234',
        camera_is: true,
        security_pledge: 'dada'
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

