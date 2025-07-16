//
// Created by René Pirringer on 15.7.2025
//

import Foundation


///
/// This extension has helpers for file URLS
///
extension URL {

	///
	/// @returns true if the URL is a file URL and the file exists
	///
	public func fileExists() -> Bool {
		return FileManager.default.fileExists(atPath: self.path)
	}

	///
	/// Create the path of the file URL with all the intermediate directories
	///
	public func createDirectories() throws {
		try FileManager.default.createDirectory(at: self, withIntermediateDirectories: true)
	}

	///
	/// Deletes the file or directory
	///
	public func delete() throws {
		try FileManager.default.removeItem(at: self)
	}

	///
	/// Deletes the file or directory if it exists
	///
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
