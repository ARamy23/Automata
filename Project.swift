import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Example",
    options: .options(disableSynthesizedResourceAccessors: true),
    settings: .mainAppSettings,
    targets: [
        .mainTarget,
    ],
    schemes: [.mainScheme]
)
