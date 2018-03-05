//
//  Question.swift
//  Quiz
//
//  Created by Yako Kobayashi on 2017/12/27.
//  Copyright © 2017年 Yako Kobayashi. All rights reserved.
//

import Foundation

//三択クイズ　問題クラス
class Question {
    var question:String = "" //問題文
    var answer:Int = -1 //正解の番号
    var choices: [String] = [] //選択肢　文字列配列
    
    //初期化
    init(question: String, answer: Int, choice1: String, choice2: String, choice3: String) {
        self.question = question
        self.answer = answer
        self.choices.append(choice1)
        self.choices.append(choice2)
        self.choices.append(choice3)
    }
    
    //正解か確認
    func isCorrect(answer :Int) ->Bool {
        if(answer == self.answer) {
            return true
        }
        return false
    }
}
