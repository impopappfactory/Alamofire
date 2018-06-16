//
//  Scheduler.swift
//  Alamofire
//
//  Created by Ivan Misuno on 16-06-2018.
//  Copyright © 2018 Alamofire. All rights reserved.
//

// MARK: - Scheduler

public protocol SchedulerType {
    func schedule(_ closure: @escaping () -> ())
}

public class DispatchQueueScheduler: SchedulerType {
    private let queue: DispatchQueue

    public init(queue: DispatchQueue) {
        self.queue = queue
    }

    // MARK: - SchedulerType
    public func schedule(_ closure: @escaping () -> ()) {
        queue.async(execute: closure)
    }
}
