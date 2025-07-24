// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "OBExtra",
	platforms: [.macOS(.v13), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
	products: [
		.library(name: "OBExtra", targets: ["OBExtra"])
	],

	dependencies: [
		.package(url: "https://github.com/nschum/SwiftHamcrest/", branch: "no-macro")
	],
	targets: [
		.target(
			name: "OBExtra",
			path: "Main/Source",
		),
		.testTarget(
			name: "OBExtraTests",
			dependencies: [
				"OBExtra",
				.product(name: "Hamcrest", package: "SwiftHamcrest"),
				.product(name: "HamcrestSwiftTesting", package: "SwiftHamcrest")
			],
			path: "Main/Test",
		)
	]
)
