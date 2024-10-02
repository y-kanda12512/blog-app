const { environment } = require("@rails/webpacker");

// 不正なプロパティを削除して、サポートされているプロパティのみに設定
// environment.node = {
//   __dirname: true, // 必要に応じて true に設定
//   __filename: true, // 必要に応じて true に設定
//   global: true, // 必要に応じて true に設定
// };

module.exports = environment;
