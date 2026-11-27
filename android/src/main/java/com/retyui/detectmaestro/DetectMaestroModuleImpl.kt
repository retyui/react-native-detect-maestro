package com.retyui.detectmaestro

import com.facebook.react.bridge.ReactApplicationContext
import java.io.IOException
import java.net.Socket

class DetectMaestroModuleImpl(private val reactContext: ReactApplicationContext) {
    fun isMaestro(): Boolean {
        return hasLaunchArgument() || isDriverPortOpen()
    }

    // Maestro 2.x: `launchApp: { arguments: { isMaestro: true } }` adds an extra to the launch intent
    private fun hasLaunchArgument(): Boolean {
        val value = reactContext.currentActivity?.intent?.extras?.get(LAUNCH_ARGUMENT)
        return value?.toString() == "true"
    }

    // Maestro 1.x: the Android driver listens on port 7001 (deprecated; in 2.x the port is random)
    private fun isDriverPortOpen(): Boolean {
        return try {
            Socket("localhost", 7001).use { true }
        } catch (ignored: IOException) {
            false
        }
    }

    companion object {
        const val NAME = "DetectMaestroModule"
        const val LAUNCH_ARGUMENT = "isMaestro"
    }
}
