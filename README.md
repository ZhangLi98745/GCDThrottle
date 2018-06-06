# GCDThrottle
![License](https://img.shields.io/badge/license-MIT-blue.svg)

# 目的
使用一个时间阈值来限制方法调用频率，可以用在搜索时候的文本变化过滤

# 用法

```swift
import Foundation
import Dispatch

@implementation ViewController

    @IBAction func textValueChanged(_ sender: UITextField) {
        GCDThrottle.throttle(0.5/* time */) {
            //do something
        }
    }

```
----