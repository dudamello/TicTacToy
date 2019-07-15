//
//  ViewController.swift
//  TicTacToy
//
//  Created by Eduarda Mello on 09/11/18.
//  Copyright © 2018 Eduarda Mello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bu1: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buSelectEvent(_ sender: Any) {
        let buSelect = sender as! UIButton
        playGame(buSelect: buSelect)
    }
    var ActivePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buSelect:UIButton){
        if ActivePlayer == 1{
            buSelect.setTitle("X", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 160/255, green: 129/255, blue: 255/255, alpha: 0.5)
            player1.append(buSelect.tag)
            ActivePlayer = 2
            //print(player1)
            AutoPlay()
        }else{
            buSelect.setTitle("O", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 0.5)
            player2.append(buSelect.tag)
            ActivePlayer = 1
            //print(player2)
            
        }
        buSelect.isEnabled = false
        findWinner()
    }
    func findWinner(){
        var winner = -1
        //linha 1
        if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
            winner = 1
        }

        if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
                winner = 2
        }
        //linha 2
        if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
            winner = 1
        }
        
        if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
            winner = 2
        }
        //linha 3
        if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
            winner = 1
        }
        
        if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
            winner = 2
        }
        
        //coluna 1
        if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
            winner = 1
        }
        
        if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
            winner = 2
        }
        //coluna 2
        if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
            winner = 1
        }
        
        if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
            winner = 2
        }
        //coluna 3
        if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
            winner = 1
        }
        
        if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
            winner = 2
        }
        
        if winner != -1 {
            var msg = ""
            if winner == 1{
                msg = "Player 1 is the winner"
            }else{
                msg = "Player 2 is the winner"
            }
            //print(msg)
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertController.Style.alert )
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func AutoPlay(){
        //scan empty cells
        var emptyCells = [Int]()
        for index in 1...9 {
            if !(player1.contains(index) || player2.contains(index)){
                emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var buSelect:UIButton?
        switch cellID {
        case 1:
            buSelect = bu1
        case 2:
            buSelect = bu2
        case 3:
            buSelect = bu3
        case 4:
            buSelect = bu4
        case 5:
            buSelect = bu5
        case 6:
            buSelect = bu6
        case 7:
            buSelect = bu7
        case 8:
            buSelect = bu8
        case 9:
            buSelect = bu9
        default:
            buSelect = bu1
        }
        playGame(buSelect: buSelect!)
    }
}

