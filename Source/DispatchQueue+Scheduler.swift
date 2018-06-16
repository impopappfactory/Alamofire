//
//  DispatchQueue+Scheduler.swift
//  Alamofire
//
//  Created by Ivan Misuno on 16-06-2018.
//  Copyright © 2018 Alamofire. All rights reserved.
//

extension DispatchQueue {
    var scheduler: SchedulerType {
        return DispatchQueueScheduler(queue: self)
    }
}

public struct Scheduler {
    static var main: SchedulerType = { return DispatchQueueScheduler(queue: DispatchQueue.main) }()
    static var userInteractive: SchedulerType = { return DispatchQueueScheduler(queue: DispatchQueue.userInteractive) }()
    static var userInitiated: SchedulerType = { return DispatchQueueScheduler(queue: DispatchQueue.userInitiated) }()
    static var utility: SchedulerType = { return DispatchQueueScheduler(queue: DispatchQueue.utility) }()
    static var background: SchedulerType = { return DispatchQueueScheduler(queue: DispatchQueue.background) }()
}
