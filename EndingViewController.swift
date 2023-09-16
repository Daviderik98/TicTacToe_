//
//  EndingViewController.swift
//  TicTacThirdTry
//
//  Created by David Persson on 2023-09-14.
//

import UIKit

class EndingViewController: UIViewController {
    
    
    @IBOutlet weak var endingLbl: UILabel!
    
    
    //Global Varialbes
    
    var firstPlayerName: String = ""
    var otherPlayerName: String = ""
    var winnerName: String = ""
    
    var victoryCaseOne: Int!
    var victoryCaseTwo: Int!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(victoryCaseOne! > 0){
            endingLbl.text = firstPlayerName + " Wins the game!"
        }
        
        if(victoryCaseTwo! > 0){
            endingLbl.text = otherPlayerName + " Wins the game!"
        }
        
        // Do any additional setup after loading the view.
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
