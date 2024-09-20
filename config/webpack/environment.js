const { environment } = require("@rails/webpacker");

environment.config.node = {
  __dirname: false,
  __filename: false,
  global: false,
};

module.exports = environment;
