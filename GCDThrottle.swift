//
//  GCDThrottle.swift
//  GCDThrottle
//
//  Created by zhangli on 2018/6/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation
import Dispatch

/// 处理重复任务，在一定时间内只保留最后一次的任务，将之前的没有执行完毕的任务取消
///

class GCDThrottle {
    
    static var lastOperation : DispatchWorkItem?
    
    static func throttle(_ time : TimeInterval,task : @escaping() -> ()) -> Void {
        if let operation = GCDThrottle.lastOperation {
            operation.cancel()
            GCDThrottle.lastOperation = nil
        }
        let closure : (() -> Void)? = task
        if let oper = closure {
            GCDThrottle.lastOperation = DispatchWorkItem.init(block: oper)
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t) {
                GCDThrottle.lastOperation?.perform()
                GCDThrottle.lastOperation = nil
            }
        }
    }
}
