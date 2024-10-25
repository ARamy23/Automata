import ProjectDescription

public extension Array where Element == TargetDependency {
    static let mainAppPackages: [TargetDependency] = [
        .external(name: "DSKit"),
        .external(name: "Keys"),
        .external(name: "KeysInterfaces"),
    ]

    static let mainAppDependencies: [TargetDependency] = mainAppPackages
}
