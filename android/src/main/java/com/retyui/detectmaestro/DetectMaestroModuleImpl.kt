package com.retyui.detectmaestro

import com.facebook.react.bridge.ReactApplicationContext
import java.io.IOException
import java.net.Socket

class DetectMaestroModuleImpl(private val reactContext: ReactApplicationContext) {
    fun isMaestro(): Boolean {
        return try {
            Socket("localhost", 7001).use { true }
        } catch(ignored: IOException) {
            false
        }
    }

    companion object {
        const val NAME = "DetectMaestroModule"
    }
}