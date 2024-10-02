const path = require("path");

module.exports = {
  mode: "development", // 'development' または 'production' に設定
  entry: "./src/index.js", // エントリーポイントのパス
  output: {
    path: path.resolve(__dirname, "dist"), // 出力先のディレクトリ
    filename: "bundle.js", // 出力ファイル名
  },
  module: {
    rules: [
      {
        test: /\.js$/, // JavaScriptファイルに対する設定
        exclude: /node_modules/,
        use: {
          loader: "babel-loader", // Babelを使ってJSをトランスパイル
        },
      },
      // 他のローダーの設定が必要な場合はここに追加
    ],
  },
  resolve: {
    extensions: [".js"], // インポートするファイルの拡張子
  },
};
