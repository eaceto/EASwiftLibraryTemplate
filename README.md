# Swift Library Template

A template for creating libraries for iOS, macOS, watchOS, tvOS (and possibly Linux!) with Swift

1. [Getting Started](#getting-started)
2. [Run (one time) Setup Script](#run-one-time-setup-script)
3. [Documenting Source Code](#documenting-source-code)
4. [Pipeline](#pipeline)

## Getting Started

Getting started is as easy as [creating a GitHub project](https://github.com/eaceto/EASwiftLibraryTemplate/generate) using this template, and including **all branches**.

Two branches should be present on your recently created project: **main** and **gh-pages**.

![Create your project using this template and including all branches](/Template/docs/create-using-template.png "Create your project using this template and including all branches")

### Setup your GitHub Page

GitHub Page is used to render source code and other automatically generated documentation. In order to let the **docs pipeline** run correctly, your GitHub Page should point to branch **gh-pages** and the folder to **/docs**.

![Setting GitHub Pages correctly](/Template/docs/github-page-settings.png "Setting GitHub Pages correctly")

## Run *one time* Setup Script

## Documenting Source Code

Documentation is automatically generated using **Jazzy** or **DocC**, and published to GitHub Page. 

In order to know more about Jazzy refer to its [GitHub Repository](https://github.com/realm/jazzy), and if you would like to use DocC please take a look at the [project documentation](https://developer.apple.com/documentation/docc).

Like Jazzy, DocC only exposes symbos with public scope. But, extensions that belongs to symbols outside the target, will not appear in DocC but yes on Jazzy. You choose.

### Example doc using DocC

Below is the documentation of the method **mask(string:with:)** using DoC
![DocC generated doc](/Template/docs/docc-example.png "DocC generated doc")

### Example doc using Jazzy

Below is the documentation of the method **mask(string:with:)** using Jazzy
![Jazzy generated doc](/Template/docs/jazzy-example.png "Jazzy generated doc")

By default GitHub Page **index.md** refers to **Jazzy** documentation, but you can switch it to **DocC** easily.

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

