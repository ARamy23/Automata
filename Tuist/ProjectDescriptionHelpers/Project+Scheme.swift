import ProjectDescription

public extension Scheme {
    static let mainScheme: Scheme = .scheme(
        name: "Example",
        shared: true,
        buildAction: .buildAction(targets: ["Example"])
    )
}
