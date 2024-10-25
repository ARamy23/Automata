// swift-tools-version: 5.10
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [
            "dskit-swiftui": .framework,
            "Keys": .framework,
            "KeysInterfaces": .framework
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .debug),
                .debug(name: "Alpha"),
                .release(name: "Beta"),
                .release(name: .release)
            ]
        )
    )
#endif

let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/imodeveloperlab/dskit-swiftui", from: "1.0.5"),
        .package(path: Path.relativeToRoot("Packages/Keys").pathString),
        .package(path: Path.relativeToRoot("Packages/KeysInterfaces").pathString)
    ]
)
