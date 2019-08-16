cordova.define("PKGNAME.WeChat", function(require, exports, module) {

    var WeChat = function() {
       this.channels = {
           myevent : cordova.addWindowEventHandler("myevent")
       };

       this.channels["myevent"].onHasSubscribersChange = WeChat.onHasSubscribersChange;
    };

    WeChat.onHasSubscribersChange = function() {
       console.log("onHasSubscribersChange");
       let obj={"task":"initial"};
       cordova.exec( wechat._status, wechat._error  , "WeChat" , "start" , [ obj ] ) ;
    };

    WeChat.prototype._status = function(info){
      console.log("_status");
      //emit Event
      cordova.fireWindowEvent("myevent", info );
    };

    WeChat.prototype._error = function(e) {
      console.log("_error");
      console.log(e);
    };

//    WeChat.prototype.start = function (arg0  successCallback, errorCallback) {
//            //對應javascript  cordova.exec(SuccessFn,  FailFn , Device , Fn , [ ]) //Fn即為發佈的function
//            cordova.exec(successCallback, errorCallback, "WeChat", "start", [arg0]);
//    }

    WeChat.prototype.start = function(){
        cordova.exec(wechat._status, wechat._error, "WeChat" , "start" , [] ) ;
    }

    WeChat.prototype.greet = function(arg0 , successCallback , errorCallback ){
         cordova.exec(successCallback, errorCallback, "WeChat", "greet", [arg0]);
    }

    var wechat = new WeChat();
    module.exports = wechat ;

});

