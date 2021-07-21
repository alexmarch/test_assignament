const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('test_assignament', 'root', 'password', {
  host: 'localhost',
  dialect: 'mariadb' /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
});

module.exports=sequelize;
