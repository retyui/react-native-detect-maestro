package com.retyui.detectmaestro

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = DetectMaestroModule.NAME)
class DetectMaestroModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {
    private val moduleImpl = DetectMaestroModuleImpl(reactContext)

    override fun getName() = NAME

    @ReactMethod(isBlockingSynchronousMethod = true) fun isMaestro() = moduleImpl.isMaestro()

    companion object {
        const val NAME = DetectMaestroModuleImpl.NAME
    }
}
