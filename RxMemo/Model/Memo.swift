//
//  Memo.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation

/**
 # 메모 #
 - author: 김도희
 */
struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String // 메모 구분

    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }

    // update할 때, init
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
