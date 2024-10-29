import ProjectDescription

public extension Settings {
    static let mainAppSettings = Settings.settings(
        base: [
            "MARKETING_VERSION": .string(ProjectConfigs.version),
            "CURRENT_PROJECT_VERSION": .string(ProjectConfigs.buildNumber),
            "VERSIONING_SYSTEM": "apple-generic",
            "DEVELOPMENT_TEAM": "969Y6REAB6",
            "TARGETED_DEVICE_FAMILY": "1",
            "SWIFT_STRICT_CONCURRENCY": "complete",
            "FRAMEWORK_SEARCH_PATHS": "$(inherited)",
            "STRIP_STYLE": "all",
            "COPY_PHASE_STRIP": "false",
        ],
        configurations: [
            .debug(
                name: .debug,
                xcconfig: .relativeToRoot("Configurations/Debug.xcconfig")
            ),
            .debug(
                name: "Alpha",
                xcconfig: .relativeToRoot("Configurations/Alpha.xcconfig")
            ),
            .release(
                name: "Beta",
                xcconfig: .relativeToRoot("Configurations/Beta.xcconfig")
            ),
            .release(
                name: .release,
                xcconfig: .relativeToRoot("Configurations/Release.xcconfig")
            ),
        ]
    )
}
