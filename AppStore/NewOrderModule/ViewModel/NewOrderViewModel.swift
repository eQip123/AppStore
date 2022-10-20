//
//  NewOrderViewModel.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 20/10/22.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa

class NewOrderViewModel {
    let name = BehaviorRelay<String>(value: "")
    let fromWhere = BehaviorRelay<String>(value: "")
    let toWhere = BehaviorRelay<String>(value: "")
    let width = BehaviorRelay<String>(value: "")
    let height = BehaviorRelay<String>(value: "")
    let weight = BehaviorRelay<String>(value: "")
    let comment = BehaviorRelay<String>(value: "")
    
    let disposeBag = DisposeBag()
    let model = NewOrderModel()
    
    func saveOrder() {
        model.add(name: name.value, fromWhere: fromWhere.value, toWhere: toWhere.value, width: width.value, height: height.value, weight: weight.value, comment: comment.value)
    }
}
