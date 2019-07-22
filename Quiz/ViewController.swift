//
//  ViewController.swift
//  Quiz
//
//  Created by Yako Kobayashi on 2017/12/27.
//  Copyright © 2017年 Yako Kobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelTitle: UILabel! //第xx問と表示
    @IBOutlet var tvQuestion: UITextView! //問題文表示
    
    @IBOutlet var buttonChoices01: UIButton! //選択肢1
    @IBOutlet var buttonChoices02: UIButton! //選択肢2
    @IBOutlet var buttonChoices03: UIButton! //選択肢3
    
    @IBOutlet var labelResult: UILabel! //正解不正解を表示
    
    var correctCount:Int = 0 //正解数
    var questionNumber:Int = 0 //今何問目か
    var questions: [Question] = [] //問題クラスを複数入れておく配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions.append(Question(question:"アリは虫ですか？", answer:1, choice1:"魚です", choice2:"虫です", choice3:"ゴリラです"))
        questions.append(Question(question:"愛は死にますか？", answer:2, choice1:"死にます", choice2:"死にません", choice3:"最後に勝ちます"))
        questions.append(Question(question:"「とうようちょう」を漢字で書くと？", answer:0, choice1:"東陽町", choice2:"当妖鳥", choice3:"東洋町"))
        labelResult.text = ""
        
        setQuestionToScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //問題を画面にセットする
    func setQuestionToScreen() {
        self.labelTitle.text = String(format: "第%d問目", self.questionNumber + 1)
        
        let q:Question = self.questions[self.questionNumber]
        
        tvQuestion.text = q.question
        
        buttonChoices01.setTitle(q.choices[0], for:UIControl.State.normal)
        buttonChoices02.setTitle(q.choices[1], for:UIControl.State.normal)
        buttonChoices03.setTitle(q.choices[2], for:UIControl.State.normal)
        
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        let q:Question = self.questions[self.questionNumber]
        
        if(q.isCorrect(answer:sender.tag)) {
            self.labelResult.text = "正解"
            self.correctCount = self.correctCount + 1
        }
        else {
            self.labelResult.text = "不正解"
        }
        self.questionNumber = questionNumber + 1
        
        if(self.questionNumber == questions.count) {
            
            UIUtility.showAlertWithOK(vc: self, title: "結果発表", message: String(format: "%d問正解でした！", self.correctCount) , handler:{
                //問題数と正解数を初期化して1問目をセットする
                (action: UIAlertAction!) -> Void in
                self.questionNumber = 0
                self.correctCount = 0
                self.labelResult.text = ""
                self.setQuestionToScreen()
            })
        }
        else {
            self.setQuestionToScreen()
        }
    }
    
    
    

}

