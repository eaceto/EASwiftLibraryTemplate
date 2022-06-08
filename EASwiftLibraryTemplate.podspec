require 'json'

definitionsFile = File.read('./definitions.json')
definitions = JSON.parse(definitionsFile)

libraryName = definitions["name"]
libraryVersion = definitions["version"]
gitHome = definitions["homepage"]
gitRemote = definitions["git"]

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
    s.macos.deployment_target = "10.15"
    s.tvos.deployment_target = "13.0"
    s.watchos.deployment_target = "6.0"    

    s.swift_versions = ['5.5', '5.6']

    s.cocoapods_version = ">= 1.9.0"

    s.source_files = "Sources/#{libraryName}/**/*"
    
    # Add if your library uses embedded resources
    # s.resource_bundles = {
    #     "#{libraryName}_#{libraryName}" => {
    #         "Sources/#{libraryName}/Resources/**/*"
    #     }
    # }
end

