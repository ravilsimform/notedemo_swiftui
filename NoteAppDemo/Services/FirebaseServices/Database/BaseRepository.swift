//
//  BaseRepository.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/03/23.
//

import Foundation

protocol BaseRepository {

    associatedtype T

    func create(record: T) async throws
//    func getAll() -> [T]?
//    func get(byIdentifier id: UUID) -> T?
//    func update(record: T) -> Bool
//    func delete(byIdentifier id: UUID) -> Bool
}
