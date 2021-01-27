//
//  DynamicValue.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 15/01/21.
//

import Foundation
/*
typealias CompletionHandler = (() -> Void)
class DynamicValue<T> {

    var value : T {
        didSet {
            self.notify()
        }
    }

    private var observers = [String: CompletionHandler]()

    init(_ value: T) {
        self.value = value
    }

    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }

    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }

    private func notify() {
        observers.forEach({ $0.value() })
    }

    deinit {
        observers.removeAll()
    }
    
    
}

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

struct CurrencyViewModel
{

    weak var dataSource : GenericDataSource<ExpenseByMonthModel>?

    init(dataSource : GenericDataSource<ExpenseByMonthModel>?) {
        self.dataSource = dataSource
    }

    func fetchCurrencies() {
        
        
        CurrencyService.shared.fetchConverter { result in

            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    // reload data
                    self.dataSource?.data.value = converter.rates

                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    break
                }
            }
        }
    }
}
 */
