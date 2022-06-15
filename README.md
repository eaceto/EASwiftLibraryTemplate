# Swift Library Template

A template for creating libraries for iOS, macOS, watchOS, tvOS (and possibly Linux!) with Swift

1. [Getting Started](#getting-started)
2. [Run (one time) Setup Script](#run-one-time-setup-script)
3. [Documenting Source Code](#documenting-source-code)
4. [Pipeline](#pipeline)

## Getting Started

Getting started is as easy as [creating a GitHub project](https://github.com/eaceto/EASwiftLibraryTemplate/generate) using this template, and including **all branches**.

![Create your project using this template and including all branches](/Template/docs/create-using-template.png "Create your project using this template and including all branches")

### Setup your GitHub Page

GitHub Page is used to render source code and other automatically generated documentation. Automatically generated documentation includes:

  * Source Code Documentation
  * (Swift)Linter Report
  * Code Coverage Report

This docs are automatically generated when the **CD** workflow runs.

Please, take into consideration that your GitHub Page should point to **main** branch and **/docs** folders.

![Setting GitHub Pages correctly](/Template/docs/github-page-settings.png "Setting GitHub Pages correctly")

## Run *one time* Setup Script
*TBD*

## Documenting Source Code

Documentation is automatically generated using **Jazzy** or **DocC**, and published to GitHub Page. By default GitHub Page **index.md** refers to **Jazzy** documentation, but you can switch it to **DocC** easily. This change can be done in **definitions.json** file, where **docs_generator** accepts **jazzy** or **docc** as valid values.

```json
{
    "name": "EASwiftLibraryTemplate",
    "version": "0.0.3",
    "homepage": "https://github.com/eaceto/EASwiftLibraryTemplate",
    "git": "https://github.com/eaceto/EASwiftLibraryTemplate.git",
    "docs_generator": "jazzy"
}
```

In order to know more about Jazzy refer to its [GitHub Repository](https://github.com/realm/jazzy), and if you would like to use DocC please take a look at the [project documentation](https://developer.apple.com/documentation/docc).

## Pipeline

GitHub Actions are used in this template, not only for documentation but also for CI/CD tasks.

The action defined in **ci.yml** will **build** and **test** the library using Swift v5.5 and v5.6.

If you need to add/remove a version of Swift, or add **ubuntu** as a target platform, modify the Strategy declared in **ci.yml** 

```yml
    strategy:
      matrix:
        os: [macos-latest] ## Add 'ubuntu-latest' if required
        swift: ["5.5", "5.6"]
```

By default, all pipelines run on branch **main**. Modify the GitHub Actions in order to make it run on other branches. For example, CI can run on main and development branch by changing the following lines in .github/workflows/ci.yml:

From this:

```yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_dispatch:
```

To this:

```yml
name: CI

on:
  push:
    branches: [main, development]
  pull_request:
    branches: [main, development]
  workflow_dispatch:
```

