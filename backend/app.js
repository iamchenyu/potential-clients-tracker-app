const express = require("express");
var cookieParser = require("cookie-parser");
const { NotFoundError } = require("./ExpressError");
const clientsRoutes = require("./routes/clients");
const usersRoutes = require("./routes/users");
const authRoutes = require("./routes/auth");
const statusRoutes = require("./routes/statuses");
const { authenticateJWT } = require("./middleware/auth");
const { COOKIE_SECRET } = require("./config");

const app = express();

app.use(cookieParser(COOKIE_SECRET));
app.use(express.json());
app.use(authenticateJWT);

app.use("/clients", clientsRoutes);
app.use("/users", usersRoutes);
app.use("/auth", authRoutes);
app.use("/status", statusRoutes);

app.use((req, res, next) => {
  return next(new NotFoundError("Page not found"));
});

app.use((err, req, res, next) => {
  const status = err.status || 500;
  const message = err.message;
  console.error(err.stack);

  return res.status(status).json({ error: { message, status } });
});

module.exports = app;
