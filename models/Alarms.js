const { DataTypes } = require("sequelize");
const db = require("../db");

const Alarms = db.define(
  "Alarms",
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
    day_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    mone: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    alarm_index: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    alarm_description: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    inserted_at: {
      type: DataTypes.DATE,
      allowNull: true
    },
    qty: {
      type: DataTypes.DECIMAL(19, 4),
      allowNull: true
    },
    details: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    priority: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    status: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    status_description: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    decision_type: {
      type: DataTypes.INTEGER({ length: 11 }),
      allowNull: true
    },
    decision: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    decision_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    decision_details: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    follow_up: {
      type: DataTypes.DATE,
      allowNull: true
    },
    follow_up_details: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    neches: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    client_number: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    client_name: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    address: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    mail: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    phone: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    cellular: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    mail_doc: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    sms_doc: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    letter_doc: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    whatsapp_doc: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    code: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    details_out: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    extra_details_out: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    message_status: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    message_status_date: {
      type: DataTypes.DATE,
      allowNull: false
    }
  },
  {
    tableName: "alarms",
    createdAt: false,
    updatedAt: false
  }
);

module.exports = Alarms;
