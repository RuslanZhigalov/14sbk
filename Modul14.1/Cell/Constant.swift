//
//  Constant.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
enum Constant {
    enum Colors{
        static let greenPrimary = UIColor(named: "GreenPrimary")
        static let greenSecondaryPrimary = UIColor(named: "GreenSecondary")
    }
    enum Fonts{
        static let systemHeading = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let systemText = UIFont.systemFont(ofSize: 16)
    }
    enum Image{
        static let austria = UIImage(named: "Austria")
        static let belgium = UIImage(named: "Belgium")
        static let france = UIImage(named: "France")
        static let germany = UIImage(named: "Germany")
        static let greece = UIImage(named: "Greece")
    }
}
struct UserProfileCache {
    static let key = "userProfileCache"
    static func save(_ value: [Money]!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> [Money]! {
        var userData: [Money] = []
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try! PropertyListDecoder().decode([Money].self, from: data)
            return userData
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
struct UserProfileDeleteCache {
    static let key = "userProfileDeleteCache"
    static func save(_ value: [String: [Money]?]) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> [String: [Money]]! {
        var userData: [String: [Money]] = [:]
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try! PropertyListDecoder().decode([String: [Money]].self, from: data)
            return userData
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

