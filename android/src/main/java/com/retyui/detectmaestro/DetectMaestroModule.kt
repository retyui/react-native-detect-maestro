package com.retyui.detectmaestro

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = DetectMaestroModule.NAME)
class DetectMaestroModule(reactContext: ReactApplicationContext) :
    NativeDetectMaestroModuleSpec(reactContext) {
    private val moduleImpl = DetectMaestroModuleImpl(reactContext)

    override fun getName() = NAME

    override fun isMaestro() = moduleImpl.isMaestro()

    companion object {
        const val NAME = DetectMaestroModuleImpl.NAME
    }
}
