import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Example",
    settings: .mainAppSettings,
    targets: [
        .mainTarget,
    ],
    schemes: [.mainScheme]
)
