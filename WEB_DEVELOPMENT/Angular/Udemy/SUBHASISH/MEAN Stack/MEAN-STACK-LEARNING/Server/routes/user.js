const express = require("express");
const user = require("../models/user");
const router = express.Router();

router.post("/signup", (req, res, next) => {
  const user = new user({
    email: req.body.email,
    password: req.body.password,
  });
});
module.exports = router;
