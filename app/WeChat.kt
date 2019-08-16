package PKGNAME

import android.util.Log
import org.apache.cordova.CallbackContext
import org.apache.cordova.CordovaPlugin
import org.json.JSONArray

class WeChat: CordovaPlugin() {
    override fun execute(action: String?, args: JSONArray?, callbackContext: CallbackContext?): Boolean {
        //return super.execute(action, args, callbackContext)

        if (action.equals("start")){
            Log.d("WeChat","start go")
            return true
        }

        if (action.equals("greet")){
            val jobj = args?.getJSONObject(0)
            Log.d("WeChat",jobj?.getString("name"))
            return true
        }

        return false
    }
}
