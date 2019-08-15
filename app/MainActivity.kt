package com.example.myapp

import android.os.Bundle
import org.apache.cordova.CordovaActivity

class  MainActivity: CordovaActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val extras:Bundle? = intent.extras

        if (extras != null && extras.getBoolean("cdvStartInBackground",false)){
            moveTaskToBack( true )
        }

        //Set by <content src="index.html" /> in config.xml
        loadUrl(launchUrl)
    }

}

