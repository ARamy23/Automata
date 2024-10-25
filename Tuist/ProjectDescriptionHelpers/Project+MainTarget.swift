import ProjectDescription

public extension Target {
    static let mainTarget = Target.target(
        name: "Example",
        destinations: .iOS,
        product: .app,
        bundleId: ProjectConfigs.bundleId,
        deploymentTargets: .iOS(ProjectConfigs.iOSLevel),
        infoPlist: .extendingDefault(with: [
            "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
            "CFBundleShortVersionString": "$(MARKETING_VERSION)"
        ]),
        sources: [
            "Example/Sources/**",
        ],
        resources: [
            "Example/Resources/**",
        ],
        scripts: .mainAppScripts,
        dependencies: .mainAppDependencies,
        settings: .mainAppSettings
    )
}
