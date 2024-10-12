import ProjectDescription

let project = Project(
    name: "Example",
    packages: [
        .package(path: "Packages/Keys"),
        .package(path: "Packages/KeysInterfaces"),
    ],
    settings: .settings(
        configurations: [
            .debug(name: .debug),
            .debug(name: "Alpha"),
            .release(name: "Beta"),
            .release(name: .release)
    ]),
    targets: [
        .target(
            name: "Example",
            destinations: .iOS,
            product: .app,
            bundleId: "com.automata.automata.example",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .external(name: "DSKit"),
                .package(product: "Keys"),
                .external(name: "KeysInterfaces")
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "969Y6REAB6",
                    "VERSIONING_SYSTEM": "apple-generic",
                    "INFOPLIST_FILE": "CAFU/Core/Resources/Info.plist",
                    "TARGETED_DEVICE_FAMILY": "1",
                    "SWIFT_STRICT_CONCURRENCY": "complete",
                    "FRAMEWORK_SEARCH_PATHS": "$(inherited)",
                    "STRIP_STYLE": "all",
                    "COPY_PHASE_STRIP": "false"
                ],
                configurations: [
                    .debug(name: .debug, settings: .debug),
                    .debug(name: "Alpha", settings: .alpha),
                    .release(name: "Beta", settings: .beta),
                    .release(name: .release, settings: .release)
            ])
        )
    ]
)

extension SettingsDictionary {
    static let debug: SettingsDictionary = [
        "APP_ICON": .string("AppIcon-debug"),
        "APP_DISPLAY_NAME": .string("Ex-debug"),
        "BUNDLE_DISPLAY_NAME": .string("Ex-debug"),
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": .string("DEBUG"),
        "OTHER_LDFLAGS": "-Xlinker -interposable -ObjC",
        "GCC_PREPROCESSOR_DEFINITIONS": .string("$(inherited) DEBUG=1"),
        "ASSETCATALOG_COMPILER_APPICON_NAME": .string("AppIcon-debug"),
        "OTHER_SWIFT_FLAGS": .string("$(inherited) -D DEBUG"),
        "PRODUCT_BUNDLE_IDENTIFIER": .string("com.automata.automata.example.debug"),
        "CODE_SIGN_ENTITLEMENTS": .string("Entitlements/Debug.entitlements"),
        "CODE_SIGN_STYLE": .string("Manual"),
        "CODE_SIGN_IDENTITY": .string("Apple Development: Ahmed Ramy (NNFXLM5TC2)"),
        "PROVISIONING_PROFILE_SPECIFIER": "match Development com.automata.automata.example.debug"
    ]
    
    static let alpha: SettingsDictionary = [
        "APP_ICON": .string("AppIcon-alpha"),
        "APP_DISPLAY_NAME": .string("Ex-Alpha"),
        "BUNDLE_DISPLAY_NAME": .string("Ex-Alpha"),
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": .string("ALPHA"),
        "GCC_PREPROCESSOR_DEFINITIONS": .string("$(inherited) ALPHA=1"),
        "ASSETCATALOG_COMPILER_APPICON_NAME": .string("AppIcon-alpha"),
        "OTHER_SWIFT_FLAGS": .string("$(inherited) -D ALPHA"),
        "PRODUCT_BUNDLE_IDENTIFIER": .string("com.automata.automata.example.alpha"),
        "CODE_SIGN_ENTITLEMENTS": .string("Entitlements/Alpha.entitlements"),
        "CODE_SIGN_STYLE": .string("Manual"),
        "CODE_SIGN_IDENTITY": .string("Apple Development: Ahmed Ramy (NNFXLM5TC2)"),
        "PROVISIONING_PROFILE_SPECIFIER": "match Development com.automata.automata.example.alpha"
    ]
    
    static let beta: SettingsDictionary = [
        "APP_ICON": .string("AppIcon-beta"),
        "APP_DISPLAY_NAME": .string("Ex-beta"),
        "BUNDLE_DISPLAY_NAME": .string("Ex-beta"),
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": .string("BETA"),
        "GCC_PREPROCESSOR_DEFINITIONS": .string("$(inherited) BETA=1"),
        "ASSETCATALOG_COMPILER_APPICON_NAME": .string("AppIcon-beta"),
        "OTHER_SWIFT_FLAGS": .string("$(inherited) -D BETA"),
        "PRODUCT_BUNDLE_IDENTIFIER": .string("com.automata.automata.example.beta"),
        "CODE_SIGN_ENTITLEMENTS": .string("Entitlements/Beta.entitlements"),
        "CODE_SIGN_STYLE": .string("Manual"),
        "CODE_SIGN_IDENTITY": .string("Apple Development: Ahmed Ramy (NNFXLM5TC2)"),
        "PROVISIONING_PROFILE_SPECIFIER": "match Development com.automata.automata.example.beta"
    ]
    
    static let release: SettingsDictionary = [
        "APP_ICON": .string("AppIcon"),
        "ASSETCATALOG_COMPILER_APPICON_NAME": .string("AppIcon"),
        "APP_DISPLAY_NAME": .string("Example"),
        "BUNDLE_DISPLAY_NAME": .string("Example"),
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": .string("RELEASE"),
        "PRODUCT_BUNDLE_IDENTIFIER": .string("m.automata.automata.example"),
        "OTHER_LDFLAGS": .string("-ObjC"),
        "STRIP_STYLE": .string("debugging"),
        "CODE_SIGN_STYLE": .string("Manual"),
        "CODE_SIGN_IDENTITY": .string("Apple Development: Ahmed Ramy (NNFXLM5TC2)"),
        "CODE_SIGN_ENTITLEMENTS": .string("Entitlements/Release.entitlements"),
        "PROVISIONING_PROFILE_SPECIFIER": "match Development com.automata.automata.example"
    ]
}
