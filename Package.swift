// swift-tools-version: 6.0
/**
 * Swift Package Manager support (React Native 0.87+).
 *
 * Hand-maintained ("self-managed") manifest: React Native's SPM autolinker
 * uses a checked-in Package.swift as-is instead of scaffolding one from the
 * podspec. CocoaPods keeps using DetectMaestro.podspec, so apps that install
 * pods are unaffected.
 *
 * SPM cannot compile Swift and Objective-C(++) in one target, so the sources
 * are split into two targets:
 *   - DetectMaestroImpl (Swift)  — DetectMaestroModuleImpl.swift, Foundation only
 *   - DetectMaestro     (ObjC++) — the RN module, depends on DetectMaestroImpl
 * The dependency only goes ObjC -> Swift, so there is no cycle.
 *
 * Autolinker contracts:
 * 1. The package and its library product are named `DetectMaestro`
 *    (pinned by `swiftpmConfig.name` in package.json).
 * 2. The `.package(path:)` references are fixed relative paths: the autolinker
 *    exposes this package via `<appRoot>/build/generated/autolinking/libs/DetectMaestro`,
 *    so `build/xcframeworks` and `build/generated/ios` are always at this depth.
 */

import PackageDescription

let package = Package(
    name: "DetectMaestro",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "DetectMaestro", targets: ["DetectMaestro"]),
    ],
    dependencies: [
        .package(name: "ReactNative", path: "../../../../xcframeworks"),
        .package(name: "React-GeneratedCode", path: "../../../ios"),
    ],
    targets: [
        .target(
            name: "DetectMaestroImpl",
            path: "ios",
            sources: ["DetectMaestroModuleImpl.swift"]
        ),
        .target(
            name: "DetectMaestro",
            dependencies: [
                "DetectMaestroImpl",
                .product(name: "ReactHeaders", package: "ReactNative"),
                .product(name: "ReactNativeHeaders", package: "ReactNative"),
                .product(name: "ReactNativeDependenciesHeaders", package: "ReactNative"),
                .product(name: "ReactAppHeaders", package: "React-GeneratedCode"),
            ],
            path: "ios",
            sources: ["DetectMaestroModule.mm"],
            publicHeadersPath: ".",
            cxxSettings: [
                // SPM builds are New Architecture only.
                .define("RCT_NEW_ARCH_ENABLED", to: "1"),
                // Must match the prebuilt React.framework's config-gated C++ ABI.
                .define("DEBUG", .when(configuration: .debug)),
                .define("NDEBUG", .when(configuration: .release)),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx20
)
