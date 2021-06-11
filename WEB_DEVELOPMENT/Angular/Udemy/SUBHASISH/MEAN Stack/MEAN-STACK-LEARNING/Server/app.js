const express = require("express");
const mongoose = require("mongoose");

const postRoutes = require("./routes/post");

mongoose
  .connect(
    "mongodb+srv://subhasish:dqxNO4byagbnzUEW@mumbaicluster.0a4mb.mongodb.net/BlogsDb?retryWrites=true&w=majority",
    { useNewUrlParser: true, useUnifiedTopology: true }
  )
  .then(() => {
    console.log("MongoDb connect with Express Server");
  })
  .catch((ex) => {
    console.log("Connection Failed");
    console.log(ex);
  });

const app = express();

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

// CORS header
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET,POST,PUT,PATCH,DELETE,OPTION"
  );
  next();
});

app.use("/api/posts", postRoutes);

module.exports = app;
