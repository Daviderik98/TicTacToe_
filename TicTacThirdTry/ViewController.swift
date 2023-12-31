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

    @IBOutlet weak var nrWinsFirst: UILabel!
    
    
    @IBOutlet weak var nrWinsOther: UILabel!
    
    
    
    
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
    
var victoriesFirst: Int = 0
var victoriesOther: Int = 0
    
    //This will be set between 1 and 2. When 1 has had its turn, switch to 2.
    var currentPlayer: Int = 1
    
    //Names of both Players, will be open for choice
    var firstPlayer: String = ""
    var otherPlayer: String = ""
    
    //Increase at 3-in-a-row
    var firstThreeRow: Int = 0
    var otherThreeRow: Int = 0
    
    var allTurns: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstGamer.text = firstPlayer
        otherGamer.text = otherPlayer
        gameOverseer.text = firstPlayer + " goes first"
        forSeparateTest.text = "Make your move"
    }
    
    
    
    
    //Segue-Prepare Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toLastScreen"){
            let lastDestination = segue.destination as! EndingViewController
            
            lastDestination.firstPlayerName = firstPlayer
            lastDestination.otherPlayerName = otherPlayer
             lastDestination.victoryCaseOne = firstThreeRow
            lastDestination.victoryCaseTwo = otherThreeRow
            
            onReset()
        }
        
    }

    //Game-Logic Functions
    
    func checkPlayers(btn_OnClick: UIButton){
        
        //Check which Player has their turn. Then call one of two functions which will print out either X or O. Afterwards check for a winner or a draw, and if so navigate to last screen
        
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
            victoriesFirst += 1
            nrWinsFirst.text = "Wins : " + String(victoriesFirst)
            allTurns = 9
        }
        
        if(otherThreeRow > 0){
            victoriesOther += 1
            nrWinsOther.text = "Wins : " + String(victoriesOther)
            allTurns = 9
        }
        
        if(allTurns == 9){
            performSegue(withIdentifier: "toLastScreen", sender: self)
            //onReset()
        }
    }
    
    
    func onTurnOne(buttonOne: UIButton){
        //Print out X in the clicked button if no current title
        if(firstThreeRow == 0 && otherThreeRow == 0){
            if(buttonOne.currentTitle != "X" && buttonOne.currentTitle != "O"){
                buttonOne.setTitle("X", for: .normal)
                allTurns += 1
                currentPlayer = 2
                gameOverseer.text = otherPlayer + ", your turn."
                forSeparateTest.text = String(allTurns)
            }
            else{
                firstGamer.text = "FAILURE ONE"
                forSeparateTest.text = firstPlayer + ", YOU CANT CLICK THERE"
            }
            //Check if a clicked field already contains X or O. If not then it gets X
            
        }
        
        
        
        //Many if-statements checking if there is a three-in-a-row with X and in that case increasing variable firstThreeRow
        
    }
    
    
    func onTurnTwo(buttonTwo: UIButton){
        //Print out O in the clicked button if no current title
        if(firstThreeRow == 0 && otherThreeRow == 0){
            if(buttonTwo.currentTitle != "X" && buttonTwo.currentTitle != "O"){
                buttonTwo.setTitle("O", for: .normal)
                allTurns += 1
                currentPlayer = 1
                gameOverseer.text = firstPlayer + ", your turn."
                forSeparateTest.text = String(allTurns)
            }
            else{
                forSeparateTest.text = otherPlayer + ", NO CLICKING ON THAT"
            }
            //Check if a clicked field already contains X or O. If not then it gets O
            
        }
    }
    
    

    func checkThreeRowOne() -> Int{
        //Checking for all possible 3-in-a-row as X
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
        //Checking for all possible 3-in-a-row as O
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
    
    func onReset(){
        //Reset the game to the starting point.
        btnFirst.setTitle("", for: .normal)
        btnSecond.setTitle("", for: .normal)
        btnThird.setTitle("", for: .normal)
        btnFour.setTitle("", for: .normal)
        btnFive.setTitle("", for: .normal)
        btnSix.setTitle("", for: .normal)
        btnSeven.setTitle("", for: .normal)
        btnEight.setTitle("", for: .normal)
        btnNine.setTitle("", for: .normal)
       
        gameOverseer.text = firstPlayer + "goes first"
        
        allTurns = 0
        firstThreeRow = 0
        otherThreeRow = 0
        currentPlayer = 1
        
        forSeparateTest.text = String(allTurns)
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

