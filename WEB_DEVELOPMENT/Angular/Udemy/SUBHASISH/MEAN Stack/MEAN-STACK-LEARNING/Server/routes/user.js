const express = require("express");
const user = require("../models/user");
const bcrypt = require("bcrypt");

const router = express.Router();

router.post("/signup", (req, res, next) => {
  bcrypt.hash(req.body.password, 10).then((hash) => {
    const user = new user({
      email: req.body.email,
      password: hash,
    });
    user
      .save()
      .then((result) => {
        res.status(201).json({ message: "user Created", result: result });
      })
      .catch((result) => {
        res.status(500).json({ error: err });
      });
  });
});
module.exports = router;
