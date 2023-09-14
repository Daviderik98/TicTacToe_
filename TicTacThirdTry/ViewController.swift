//
//  ViewController.swift
//  TicTacThirdTry
//
//  Created by David Persson on 2023-09-10.
//

import UIKit

class ViewController: UIViewController {
    
    //Components
    
    @IBOutlet weak var gameOverseer: UILabel!
    @IBOutlet weak var forSeparateTest: UILabel!
    
   
    @IBOutlet weak var firstGamer: UILabel!
    
    
    
    @IBOutlet weak var otherGamer: UILabel!
    
    
    
    
    
    //SPECIAL Button Components
    
    
    @IBOutlet weak var btnFirst: UIButton!
    
    
    @IBOutlet weak var btnSecond: UIButton!
    
    
    @IBOutlet weak var btnThird: UIButton!
    
    
    @IBOutlet weak var btnFour: UIButton!
    
    
    @IBOutlet weak var btnFive: UIButton!
    
    
    @IBOutlet weak var btnSix: UIButton!
    
    
    @IBOutlet weak var btnSeven: UIButton!
    
    
    @IBOutlet weak var btnEight: UIButton!
    
    
    @IBOutlet weak var btnNine: UIButton!
    
        
    
    //Global Varialbes
    
    //This will be set between 1 and 2. When 1 has had its turn, switch to 2.
    var currentPlayer: Int = 1
    
    //Names of both Players, will be open for choice
    var firstPlayer: String = ""
    var otherPlayer: String = ""
    
    //Increase at 3-in-a-row
    var firstThreeRow: Int = 0
    var otherThreeRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Game-Logic Functions
    
    func checkPlayers(btn_OnClick: UIButton){
        //Check which Player has their turn. Then call on of two functions which will print out either X or O
        switch(currentPlayer){
        case 1:
            onTurnOne(buttonOne: btn_OnClick)
        case 2:
            onTurnTwo(buttonTwo: btn_OnClick)
            
        default : currentPlayer = 1
        }
        firstThreeRow = checkThreeRowOne()
        otherThreeRow = checkThreeRowTwo()
        
        if(firstThreeRow > 0){
            gameOverseer.text = "WE HAVE THE POWER"
        }
        
        if(otherThreeRow > 0){
            gameOverseer.text = "FORCE STRONG HERE"
        }
    }
    
    
    func onTurnOne(buttonOne: UIButton){
        if(firstThreeRow == 0 && otherThreeRow == 0){
            if(buttonOne.currentTitle != "X" && buttonOne.currentTitle != "O"){
                buttonOne.setTitle("X", for: .normal)
                currentPlayer = 2
                
            }
            else{
                forSeparateTest.text = String(currentPlayer) + "YOU CANT CLICK THERE"
            }
            //Check if a clicked field already contains X or O. If not then it gets X
            gameOverseer.text = "Player 2, your turn."
        }
        
        
        
        //Many if-statements checking if there is a three-in-a-row with X and in that case increasing variable firstThreeRow
        
    }
    
    
    func onTurnTwo(buttonTwo: UIButton){
        if(firstThreeRow == 0 && otherThreeRow == 0){
            if(buttonTwo.currentTitle != "X" && buttonTwo.currentTitle != "O"){
                buttonTwo.setTitle("O", for: .normal)
                currentPlayer = 1
            }
            else{
                forSeparateTest.text = String(currentPlayer) + "NO CLICKING ON THAT"
            }
            //Check if a clicked field already contains X or O. If not then it gets O
            gameOverseer.text = "Player 1, your turn."
        }
    }
    
    
    
    func checkThreeRowOne() -> Int{
        var scoreOne: Int = 0
        if(btnFirst.currentTitle == "X" && btnSecond.currentTitle == "X" && btnThird.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnFirst.currentTitle == "X" && btnFour.currentTitle == "X" && btnSeven.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnFirst.currentTitle == "X" && btnFive.currentTitle == "X" && btnNine.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnSecond.currentTitle == "X" && btnFive.currentTitle == "X" && btnEight.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnThird.currentTitle == "X" && btnSix.currentTitle == "X" && btnNine.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnFour.currentTitle == "X" && btnFive.currentTitle == "X" && btnSix.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnSeven.currentTitle == "X" && btnEight.currentTitle == "X" && btnNine.currentTitle == "X"){
            scoreOne += 1
        }
        if(btnSeven.currentTitle == "X" && btnFive.currentTitle == "X" && btnThird.currentTitle == "X"){
            scoreOne += 1
        }
        return scoreOne
    }
    
    
    func checkThreeRowTwo() -> Int{
        var scoreTwo: Int = 0
        if(btnFirst.currentTitle == "O" && btnSecond.currentTitle == "O" && btnThird.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnFirst.currentTitle == "O" && btnFour.currentTitle == "O" && btnSeven.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnFirst.currentTitle == "O" && btnFive.currentTitle == "O" && btnNine.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnSecond.currentTitle == "O" && btnFive.currentTitle == "O" && btnEight.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnThird.currentTitle == "O" && btnSix.currentTitle == "O" && btnNine.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnFour.currentTitle == "O" && btnFive.currentTitle == "O" && btnSix.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnSeven.currentTitle == "O" && btnEight.currentTitle == "O" && btnNine.currentTitle == "O"){
            scoreTwo += 1
        }
        if(btnSeven.currentTitle == "O" && btnFive.currentTitle == "O" && btnThird.currentTitle == "O"){
            scoreTwo += 1
        }
        return scoreTwo
    }
    
    
    
    
    
    
    
    
    
    
    

    
    
    //SPECIAL Button Actions
    
    @IBAction func pressOne(_ sender: Any) {
        checkPlayers(btn_OnClick: btnFirst)
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        checkPlayers(btn_OnClick: btnSecond)
    }
    
    @IBAction func pressThree(_ sender: Any) {
        checkPlayers(btn_OnClick: btnThird)
    }
    
    
    @IBAction func pressFour(_ sender: Any) {
        checkPlayers(btn_OnClick: btnFour)
    }
    
    
    @IBAction func pressFive(_ sender: Any) {
        checkPlayers(btn_OnClick: btnFive)
    }
    
    
    @IBAction func pressSix(_ sender: Any) {
        checkPlayers(btn_OnClick: btnSix)
    }
    
    @IBAction func pressSeven(_ sender: Any) {
        checkPlayers(btn_OnClick: btnSeven)
    }
    
    @IBAction func pressEight(_ sender: Any) {
        checkPlayers(btn_OnClick: btnEight)
    }
    
    
    @IBAction func pressNine(_ sender: Any) {
        checkPlayers(btn_OnClick: btnNine)
    }
    
    
    
    
}

