
libraryName = "EASwiftLibraryTemplate"
libraryVersion = "0.0.1"
gitHome = "https://github.com/eaceto/EASwiftLibraryTemplate"
gitRemote = "https://github.com/eaceto/EASwiftLibraryTemplate.git"

Pod::Spec.new do |s|
    s.name	= libraryName
    s.version   = libraryVersion
    s.summary   = "A template for creating libraries for iOS, macOS, watchOS, tvOS (and possibly Linux!) with Swift"

    s.homepage  = gitHome
    s.license   = { :type => "MIT", :file => "LICENSE" }
    s.author    = { "Ezequiel (Kimi) Aceto" => "ezequiel.aceto@gmail.com" }

    s.source    = {
        :git => gitRemote,
        :tag => s.version.to_s
    }

    s.ios.deployment_target   = "13.0"
    s.macos.deployment_target = "10.12"
    s.watchos.deployment_target = "6.0"
    s.tvos.deployment_target = "13.0"

    s.swift_versions = ['5.5', '5.6']

    s.cocoapods_version = ">= 1.4.0"

    s.source_files = "Sources/" + libraryName + "/**/*"
end

