//
//  PriorViewController.swift
//  TicTacThirdTry
//
//  Created by David Persson on 2023-09-14.
//

import UIKit

class PriorViewController: UIViewController {
    
    //Components
    
    @IBOutlet weak var tfONE: UITextField!
    
    @IBOutlet weak var tfTWO: UITextField!
    
    
    @IBOutlet weak var enterOne: UIButton!
    
    
    @IBOutlet weak var enterTwo: UIButton!
    
    
    @IBOutlet weak var nameCounter: UILabel!
    
    
    
    //Global variables
    
    var firstName: String = "Player 1"
    var otherName: String = "Player 2"
    var numberOfNames: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

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
