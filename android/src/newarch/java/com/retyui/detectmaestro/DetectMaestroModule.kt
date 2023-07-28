package com.retyui.detectmaestro

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = DetectMaestroModule.NAME)
class DetectMaestroModule(
        // Each native module class consumes react application context
        reactContext: ReactApplicationContext
) : NativeDetectMaestroModuleSpec(reactContext) {
    // Use shared module implementation and forward react application context
    private val moduleImpl = DetectMaestroModuleImpl(reactContext)

    // Return the name of the module - it should match the name provided in JS specification
    override fun getName() = NAME

    // Exported methods are overriden - based on the spec class
    override fun isMaestro() = moduleImpl.isMaestro()

    companion object {
        const val NAME = DetectMaestroModuleImpl.NAME
    }
}