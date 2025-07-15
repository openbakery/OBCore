//
// Created by René Pirringer on 15.7.2025
//

import Foundation

extension URL {

	///
	/// @returns true if the URL is a file URL and the file exists
	///
	public func fileExists() -> Bool {
		return FileManager.default.fileExists(atPath: self.path)
	}

	public func createDirectories() throws {
		try FileManager.default.createDirectory(at: self, withIntermediateDirectories: true)
	}

	public func delete() throws {
		try FileManager.default.removeItem(at: self)
	}

	public func deleteIfExists() {
		do {
			if fileExists() {
				try FileManager.default.removeItem(at: self)
			}
		} catch {
			fatalError("cannot delete item \(self)")
		}
	}

	///
	/// @returns true if the URL is a file URL and a directory
	///
	var isDirectory: Bool {
		do {
			if let value = try resourceValues(forKeys: [.isDirectoryKey]).isDirectory {
				return value
			}
		} catch {
			// ignore
		}
		return false
	}

}
