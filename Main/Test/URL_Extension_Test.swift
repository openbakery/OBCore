//
// Created by René Pirringer on 15.7.2025
//

import Foundation
import Hamcrest
import HamcrestSwiftTesting
import Testing
@testable import OBExtra

struct URL_Extension_Test {

	init() async throws {
		HamcrestSwiftTesting.enable()
	}

	@Test func file_does_not_exist() {
		let url = URL(fileURLWithPath: "/tmp/i_file_should_not_exist.txt")
		assertThat(url.fileExists(), equalTo(false))
	}

	@Test func create_directory() throws {
		let url = URL.temporaryDirectory.appendingPathComponent("URL_Extension_Test")
		defer {
			url.deleteIfExists()
		}

		// when
		try url.createDirectories()

		// then
		assertThat(url.fileExists(), equalTo(true))

		// when
		try url.delete()

		// then
		assertThat(url.fileExists(), equalTo(false))
	}

	@Test func url_is_directory() {
		let cachesURL = URL.cachesDirectory

		// then
		assertThat(cachesURL.isDirectory, equalTo(true))
	}

	@Test func file_url_is_not_directory() throws {
		let url = URL.temporaryDirectory.appendingPathComponent("test.txt")
		defer {
			url.deleteIfExists()
		}
		try "content".write(to: url, atomically: true, encoding: .utf8)

		// then
		assertThat(url.isDirectory, equalTo(false))

	}

}
