#import "DetectMaestroModule.h"

/**
* When using Swift classes in ObjC implementation, the classes must be imported
* from generated Objective-C Interface Header
*
* @see https://developer.apple.com/documentation/swift/importing-swift-into-objective-c#Import-Code-Within-an-App-Target
*/
#if __has_include("DetectMaestro-Swift.h")
// CocoaPods: Swift and ObjC sources share one module
#import "DetectMaestro-Swift.h"
#else
// Swift Package Manager: Swift sources live in a separate target
// (`DetectMaestroImpl`) and its generated header is not importable from ObjC++,
// so declare the `@objc(DetectMaestroModuleImpl)` interface directly.
@interface DetectMaestroModuleImpl : NSObject
- (NSInteger)isMaestro;
@end
#endif

#if RCT_NEW_ARCH_ENABLED
/**
* Import header file with codegenerated protocols based on the JS specification
*
* The name of the header matches the name provided in codegenConfig's `name` field in package.json
*/
#if __has_include(<ReactCodegen/DetectMaestro/DetectMaestro.h>)
// Swift Package Manager exposes codegen headers through ReactAppHeaders
#import <ReactCodegen/DetectMaestro/DetectMaestro.h>
#else
#import "DetectMaestro.h"
#endif

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
