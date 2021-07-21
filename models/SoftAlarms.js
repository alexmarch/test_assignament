const { DataTypes } = require("sequelize");
const db = require("../db");

const SoftAlarms = db.define(
  "SoftAlarms",
  {
    record_number: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    related_to: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    mone: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    from_date: {
      type: DataTypes.DATE,
      allowNull: true
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
      allowNull: true,
      field: 'min_qty'
    },
    qty_max: {
      type: DataTypes.DECIMAL(20, 6),
      allowNull: true,
      field: 'max_qty'
    },
    param_number: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    per_cent: {
      type: DataTypes.DECIMAL(20,6),
      allowNull: true
    },
    param_name: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    alarm_index: {
      type: DataTypes.INTEGER(11)
    },
    description: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    neches: {
      type: DataTypes.BIGINT({ length: 20 }),
      allowNull: true
    },
    customer_name: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    address: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    rule: {
      type: DataTypes.INTEGER(11),
      allowNull: true
    },
    is_active: {
      type: DataTypes.BLOB(50),
      allowNull: true
    }
  },
  {
    tableName: "soft_alarms",
    createdAt: false,
    updatedAt: false
  }
);

module.exports = SoftAlarms;
