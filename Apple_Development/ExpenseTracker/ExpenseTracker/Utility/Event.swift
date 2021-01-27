//
//  Event.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 27/01/21.
//

import Foundation

public class Event<T> {

  public typealias EventHandler = (T) -> ()

  public var eventHandlers = [Invocable]()

  public func raise(data: T)
  {
    for handler in self.eventHandlers
    {
        handler.invoke(data: data)
    }
  }

  public func addHandler<U: AnyObject>(target: U,
                                       handler: @escaping (U) -> EventHandler) -> Disposable {
    let wrapper = EventHandlerWrapper(target: target,
                         handler: handler, event: self)
    eventHandlers.append(wrapper)
    return wrapper
  }
}

private class EventHandlerWrapper<T: AnyObject, U>
                                  : Invocable, Disposable {
  weak var target: T?
  let handler: (T) -> (U) -> ()
  let event: Event<U>

    init(target: T?, handler: @escaping (T) -> (U) -> (), event: Event<U>) {
    self.target = target
    self.handler = handler
    self.event = event;
  }

  func invoke(data: Any) -> () {
    if let t = target {
      handler(t)(data as! U)
    }
  }

  func dispose() {
    event.eventHandlers =
       event.eventHandlers.filter { $0 !== self }
  }
}

public protocol Disposable {
  func dispose()
}

public protocol Invocable: class {
  func invoke(data: Any)
}

struct Consumer {
    var name: String
    var handler: (Any) -> Void
}

class EventEmitter {
    
    static var consumers: [Consumer] = [];
    
    static func publish(name: String, args: Any) {
        for consumer in self.consumers {
            if(consumer.name == name) {
                consumer.handler(args);
            }
        }
    }
    
    static func subscribe(name: String, handler: @escaping (Any) -> Void) {
        self.consumers.append(
            Consumer(name: name, handler: handler)
        )
    }
    
}
