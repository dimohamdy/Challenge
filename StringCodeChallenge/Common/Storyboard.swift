//
//  Storyboard.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//
import UIKit

enum appStoryboard: String {
    case Main = "Main"
}

extension UIViewController {
    class func instantiateFromStoryboard<T>(_ stroybaord: appStoryboard = .Main) -> T {
        let storyboard = UIStoryboard(name: stroybaord.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
    }
}

extension UIStoryboard {
    class func instantiateInitialViewController(_ board: appStoryboard) -> UIViewController {
        let story = UIStoryboard(name: board.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}
