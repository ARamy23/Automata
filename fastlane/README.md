fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios prepare_build_for_distribution

```sh
[bundle exec] fastlane ios prepare_build_for_distribution
```



### ios setup_environment

```sh
[bundle exec] fastlane ios setup_environment
```

Sets up Environment Variables

### ios configure_release_environment_variables

```sh
[bundle exec] fastlane ios configure_release_environment_variables
```



### ios generate_project

```sh
[bundle exec] fastlane ios generate_project
```

Generates Project + Secrets + Makes sure Mise & Tuist are corectly configured

### ios prepare_ci_certs_profiles

```sh
[bundle exec] fastlane ios prepare_ci_certs_profiles
```

Prepare .env file for GitHub Actions CI by extracting certificates and profiles directly from match repo

### ios ci_import_certs_profiles_locally

```sh
[bundle exec] fastlane ios ci_import_certs_profiles_locally
```

Setup Apple certificate and provisioning profile for CI/CD

### ios prepare_auth_for_match

```sh
[bundle exec] fastlane ios prepare_auth_for_match
```



### ios onboard

```sh
[bundle exec] fastlane ios onboard
```

Onboard a new member to the project

### ios create_service_account_access

```sh
[bundle exec] fastlane ios create_service_account_access
```

Creates Service Account Access for demo purposes

### ios prepare_delivery_environment

```sh
[bundle exec] fastlane ios prepare_delivery_environment
```

Prepare deliver lanes environment for seamless delivery

### ios bump_build_number

```sh
[bundle exec] fastlane ios bump_build_number
```



### ios distribute_to_testflight

```sh
[bundle exec] fastlane ios distribute_to_testflight
```



### ios distribute_to_appstore

```sh
[bundle exec] fastlane ios distribute_to_appstore
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
