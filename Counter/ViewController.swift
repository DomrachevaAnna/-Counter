//
//  ViewController.swift
//  Counter
//
//  Created by Anna Domracheva on 07.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var history: UITextView!
    
    private var newScore: Int = 0

    @IBAction func clickButton(_ sender: Any) {
        newScore += 1
        score.text = "Значение счетчика: \(newScore)"
        history.text += "\n\(time()): значение изменено на +1"
        scrollTextViewToBottom()
    }
    @IBAction func downClickButton(_ sender: Any) {
        newScore -= 1
        if newScore < 0 {
            newScore = 0
            history.text += "\n\(time()): попытка уменьшить значение счетчика ниже 0"
        } else {
            history.text += "\n\(time()): значение изменено на -1"
        }
        score.text = "Значение счетчика: \(newScore)"
        scrollTextViewToBottom()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        newScore = 0
        score.text = "Значение счетчика: \(newScore)"
        history.text += "\n\(time()): значение сброшено"
        scrollTextViewToBottom()
    }
    
    private func time() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    private func scrollTextViewToBottom() {
        guard history.text.count > 0 else { return }
        let location = history.text.count - 1
        let bottom = NSMakeRange(location, 1)
        history.scrollRangeToVisible(bottom)
    }
}

