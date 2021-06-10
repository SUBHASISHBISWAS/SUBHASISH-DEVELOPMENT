const express = require("express");
const Post = require("./models/post");
const mongoose = require("mongoose");

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
  res.setHeader("Access-Control-Allow-Methods", "GET,POST,PATCH,DELETE,OPTION");
  next();
});

app.post("/api/posts", (req, res, next) => {
  const post = new Post({
    title: req.body.title,
    content: req.body.content,
  });
  post.save().then((createdPost) => {
    res
      .status(201)
      .json({ message: "Post Added Successfully", postId: createdPost._id });
  });
});

app.get("/api/posts", (req, res, next) => {
  console.log("Hello From Server");

  Post.find().then((documents) => {
    console.log(documents);
    return res
      .status(200)
      .json({ message: "Read From database", posts: documents });
  });

  //next();
});

app.delete("/api/posts/:id", (req, res, next) => {
  Post.deleteOne({ _id: req.params.id })
    .then((result) => {
      console.log(result);
    })
    .catch(() => {
      console.log("Not Deleted");
    });
  console.log(req.params.id);
  res.status(200).json();
});

module.exports = app;
