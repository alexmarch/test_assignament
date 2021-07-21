const { DataTypes } = require("sequelize");
const db = require("../db");

const IndexSoftAlarms = db.define(
  "IndexSoftAlarms",
  {
    record_number: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    param_no: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: 'param_ no'
    },
    related_to: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    description: {
      type: DataTypes.STRING(50),
      allowNull: true,
      field: ' description'
    },
    from_date: {
      type: DataTypes.DATE,
      allowNull: true,
      field: ' from_date'
    },
    until_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    qty_type: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    qty_min: {
      type: DataTypes.DECIMAL(20, 6),
      allowNull: true
    },
    qty_max: {
      type: DataTypes.DECIMAL(20, 6),
      allowNull: true
    },
    compare_from: {
      type: DataTypes.DATE,
      allowNull: true
    },
    compare_until: {
      type: DataTypes.DATE,
      allowNull: true
    },
    alarm_index: {
      type: DataTypes.INTEGER(11),
      allowNull: true
    },
    is_active: {
      type: DataTypes.BLOB(50),
      allowNull: true
    },
    insert_only: {
      type: DataTypes.BLOB(50),
      allowNull: true,
      field: 'insert_only?'
    },
    sql_to_operate: {
      type: DataTypes.STRING(1000),
      allowNull: true
    },
    special_program: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    table_name: {
      type: DataTypes.STRING(50),
      allowNull: true
    }
  },
  {
    tableName: "index_soft_alarms_parameters",
    createdAt: false,
    updatedAt: false
  }
);

module.exports = IndexSoftAlarms;
