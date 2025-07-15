// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "OBCore",
	platforms: [.macOS(.v13), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
	products: [
		.library(name: "OBCore", targets: ["OBCore"])
	],

	dependencies: [
		.package(url: "https://github.com/nschum/SwiftHamcrest/", branch: "no-macro")
	],
	targets: [
		.target(
			name: "OBCore",
			path: "Main",
			sources: [
				"Source"
			]),
		.testTarget(
			name: "OBCoreTests",
			dependencies: [
				"OBCore",
				.product(name: "Hamcrest", package: "SwiftHamcrest"),
				.product(name: "HamcrestSwiftTesting", package: "SwiftHamcrest")
			],
			path: "Main",
			sources: [
				"Test"
			])
	]
)
