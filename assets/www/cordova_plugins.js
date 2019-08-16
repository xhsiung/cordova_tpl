cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
   {
        "id":   "PKGNAME.WeChat",
        "file": "plugins/PKGNAME/wechat.js",
        "clobbers": [
            "wechat"
        ]
   }

  ];

  module.exports.metadata = {

  };
});
