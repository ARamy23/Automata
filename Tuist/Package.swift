// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [
            "dskit-swiftui": .framework,
            "Keys": .staticLibrary,
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
        .package(path: "../Packages/Keys"),
        .package(path: "../Packages/KeysInterfaces")
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
