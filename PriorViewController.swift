//
//  PriorViewController.swift
//  TicTacThirdTry
//
//  Created by David Persson on 2023-09-14.
//

import UIKit

class PriorViewController: UIViewController {
    
    //Components
    
    @IBOutlet weak var lblOne: UILabel!
    @IBOutlet weak var tfONE: UITextField!
    
    @IBOutlet weak var lblTwo: UILabel!
    @IBOutlet weak var tfTWO: UITextField!
    
    
    @IBOutlet weak var enterOne: UIButton!
    
    
    @IBOutlet weak var enterTwo: UIButton!
    
    
    @IBOutlet weak var nameCounter: UILabel!
    
    
    
    //Global variables
    
    var firstName: String = "Player 1"
    var otherName: String = "Player 2"
    var nameOne: Int = 0
    var nameTwo: Int = 0
    var numberOfNames: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfNames = nameOne + nameTwo
        nameCounter.text = "X Names Selected"
        // Do any additional setup after loading the view.
    }
    
    
    
    //Actions
    
    @IBAction func playerPressOne(_ sender: UIButton) {
        if(tfONE.text == ""){
            lblOne.text = "Player 1 it is then"
            firstName = "Player 1"
            nameOne = 0
        }
        else{
            firstName = tfONE.text!
            lblOne.text = firstName
            nameOne = 1
        }
        numberOfNames = nameOne + nameTwo
        nameCounter.text = String(numberOfNames) + " Names Selected"
    }
    
    
    
    
    @IBAction func playerPressTwo(_ sender: UIButton) {
        if(tfTWO.text == ""){
            lblTwo.text = "Player 2 it is then"
            otherName = "Player 2"
            nameTwo = 0
        }
        else{
            otherName = tfTWO.text!
            lblTwo.text = otherName
            nameTwo = 1
        }
        numberOfNames = nameOne + nameTwo
        nameCounter.text = String(numberOfNames) + " Names Selected"
    }
    
    
    
    
    @IBAction func towardsTheGame(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameSession", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toGameSession"){
            let firstDestination = segue.destination as! ViewController
            //Sending over the players names
            firstDestination.firstPlayer = firstName
            
            firstDestination.otherPlayer = otherName
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
