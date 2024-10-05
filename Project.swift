import ProjectDescription

let project = Project(
    name: "Example",
    packages: [
        .package(path: "Packages/Keys"),
        .package(path: "Packages/KeysInterfaces"),
    ],
    settings: .settings(configurations: [
        .debug(name: .debug, xcconfig: .relativeToRoot("Configurations/Debug.xcconfig")),
        .debug(name: "Alpha", xcconfig: .relativeToRoot("Configurations/Alpha.xcconfig")),
        .release(name: "Beta", xcconfig: .relativeToRoot("Configurations/Beta.xcconfig")),
        .release(name: .release, xcconfig: .relativeToRoot("Configurations/Release.xcconfig"))
    ]),
    targets: [
        .target(
            name: "Example",
            destinations: .iOS,
            product: .app,
            bundleId: "com.yourcompany.Example",
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
                .package(product: "KeysInterfaces")
            ]
        )
    ]
)
