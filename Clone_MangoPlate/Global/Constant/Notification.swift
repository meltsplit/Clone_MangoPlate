//
//  NotificationCenter.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/10.
//

import Foundation

extension Notification.Name {
    static let searchTitle = Notification.Name("searchTitle")
    static let updateSearchBook = Notification.Name("updateSearchBook")
    
    
    static let disappearFloatingButton = Notification.Name("disappearFloatingButton")
    static let resetStopWatch = Notification.Name("resetStopWatch")
    static let updateHabitRoom = Notification.Name("updateHabitRoom")
    static let leaveRoom = Notification.Name("leaveRoom")
    static let feedReport = Notification.Name("feedReport")
    static let updateHome = Notification.Name("updateHome")
    static let startHabitRoom = Notification.Name("startHabitRoom")
    static let sceneWillEnterForeground = Notification.Name("sceneWillEnterForeground")
    static let sceneDidEnterBackground = Notification.Name("sceneDidEnterBackground")
}
