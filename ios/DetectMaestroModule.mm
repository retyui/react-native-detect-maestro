#import "DetectMaestroModule.h"

/**
* When using Swift classes in ObjC implementation, the classes must be imported
* from generated Objective-C Interface Header
*
* @see https://developer.apple.com/documentation/swift/importing-swift-into-objective-c#Import-Code-Within-an-App-Target
*/
#import "DetectMaestro-Swift.h"

#if RCT_NEW_ARCH_ENABLED
/**
* Import header file with codegenerated protocols based on the JS specification
*
* The name of the header matches the name provided in codegenConfig's `name` field in package.json
*/
#import "DetectMaestro.h"

/**
* Each turbo module implements codegenerated spec protocol
*/
@interface DetectMaestroModule () <NativeDetectMaestroModuleSpec>
@end
#endif

/**
* Declare the ObjC implementation for that native module class
*/
@implementation DetectMaestroModule {
    DetectMaestroModuleImpl *moduleImpl;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        moduleImpl = [DetectMaestroModuleImpl new];
    }
    return self;
}

/**
* Return the name of the module - it should match the name provided in JS specification
*/
RCT_EXPORT_MODULE(DetectMaestroModule)

/**
* Declare if module should be initialized on the main queue
*/
+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

// Exported methods are overridden - based on the spec class
RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(NSNumber *, isMaestro)
{
    return @([moduleImpl isMaestro]);
}


#if RCT_NEW_ARCH_ENABLED
// Implement RCTTurboModule protocol
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
    return std::make_shared<facebook::react::NativeDetectMaestroModuleSpecJSI>(params);
}
#endif

@end
