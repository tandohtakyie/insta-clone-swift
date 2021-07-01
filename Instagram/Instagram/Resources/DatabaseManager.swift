//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Gabriel Takyi on 30/06/2021.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion : (Bool) -> Void){
        completion(true)
    }
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username": username]){ error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
    

}
