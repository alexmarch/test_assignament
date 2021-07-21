const express = require("express");
const db = require("../db");
const app = express();
const { Alarms, SoftAlarms, IndexSoftAlarms } = require("../models");

const limit = 20; // Limit select records count by default

db.authenticate()
  .then(() => {
    console.log("Connection has been established successfully.");
  })
  .catch(error => console.error("Unable to connect to the database:", error));

app.use(express.json());

app.get("/", (req, res) => {
  res.json({ version: "0.1" });
});

// Get index soft alarms params list
app.get("/rules", async (req, res) => {
  res.json({ list: await IndexSoftAlarms.findAll({ limit }) });
});

// Update rule
app.post("/rule", async (req, res) => {
  const model = await IndexSoftAlarms.findByPk(req.body.record_number);
  if (model) {
    await model.update(req.body);
  }
  res.json({ model });
});

// Get soft alarms
app.get("/soft_alarms", async (req, res) => {
  res.json({ list: await SoftAlarms.findAll({ limit }) });
});

// Get alarms list
app.get("/alarms", async (req, res) => {
  res.json({ list: await Alarms.findAll({ limit }) });
});

module.exports = app;
