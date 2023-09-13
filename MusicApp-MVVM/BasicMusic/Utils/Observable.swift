//
//  Observable.swift
//  BasicMusic
//
//  Created by Allen H on 2023/05/12.
//

import Foundation

class Observable<T> {
    
    // 값이 변할때마다 "나중에호출될수있는함수"(클로저/함수) 호출
    var value: T {
        didSet {
            completionHandler?(value)
        }
    }
    
    // "데이터값"이 변할때 =====> 함수호출 ⭐️⭐️⭐️
    var completionHandler: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        self.completionHandler = completion
    }

}
