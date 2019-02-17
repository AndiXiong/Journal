//
//  DataManager.swift
//  Journal
//
//  Created by Andi Xiong on 2019-01-02.
//  Copyright © 2019 Andi Xiong. All rights reserved.
//

import Foundation

public class DataManager {
    
    //get document directory
    static fileprivate func getDocDirectory () -> URL {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to access directory")
        }
        return url
    }
    
    //save codable objects
    static func save <T:Encodable> (_ object: T, _ name: String) {
        let url = getDocDirectory().appendingPathComponent(name)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError("Object is not encodable")
        }
    }
    
    //load codable objects
    static func load <T:Decodable> (_ name: String, type: T.Type) -> T{
        let url = getDocDirectory().appendingPathComponent(name)
        if FileManager.default.fileExists(atPath: url.path) {
            fatalError("File trying to load does not exist")
        }
        guard let content = FileManager.default.contents(atPath: url.path) else {
            fatalError("Data unavailable at \(url.path)")
        }
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(type, from: content)
            return model
        } catch {
            fatalError("Data not decodable")
        }
        
        
    }
    
    //load data from file ??
    
    
    //load all files from a directory
    static func loadAll <T:Decodable> (_ type:T.Type) -> [T] {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: getDocDirectory().path)
            
            var modelObjects = [T]()
            
            for fileName in files {
                modelObjects.append(load(fileName, type: type))
            }
            
            return modelObjects
            
            
        }catch{
            fatalError("could not load any files")
        }
    }
    
    
    //delete a file
    static func delete (_ fileName: String) {
        let url = getDocDirectory()
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                fatalError(error.localizedDescription)
            }
        }

    }
    
}
