const jwt = require("jsonwebtoken");
const { SECRET_KEY } = require("../config");

const createToken = (user) => {
  const payload = { id: user.id, email: user.email, role: user.role };
  return jwt.sign(payload, SECRET_KEY);
};

module.exports = createToken;
