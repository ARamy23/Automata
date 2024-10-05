import ProjectDescription

let project = Project(
    name: "Example",
    targets: [
        .target(
            name: "Example",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Example",
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
                .external(name: "DSKit")
            ]
        ),
        .target(
            name: "ExampleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ExampleTests",
            infoPlist: .default,
            sources: ["Example/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Example")]
        ),
    ]
)
