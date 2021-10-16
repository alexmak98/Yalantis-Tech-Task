//
//  ViewController.swift
//  Makovetskyi Tech Task
//
//  Created by Alex Makovetskiy on 06.10.2021.
//

import UIKit

class ViewController: UIViewController, SettingsDelegate {
    
    var hardcodedAnswers = ["just do it"]
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func getAnswerButtonPressed(_ sender: Any) {
        answerLabel.text = "and the answer is..."
        getResponse()
        //getPreparedAnswer()
    }
    
    /*func getPreparedAnswer() {
        answerLabel.text = hardcodedAnswers.randomElement()!
    }*/
    
    func getResponse() {
            
        let url = URL(string: "https://8ball.delegator.com/magic/JSON/Will%20I%20ever%20give%20you%20up%3F")
        
        guard url != nil else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            // check errors
            if error == nil && data != nil {
                
                //parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let json = try decoder.decode(Magic.self, from: data!)
                    self.answerLabel.text = json.magic?.answer!
                }
                catch {
                    self.answerLabel.text = self.hardcodedAnswers.randomElement()!
                    print("error in json parsing")
                }
            }
        }
        // make API call
        dataTask.resume()
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.text = "and the answer is..."
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getResponse()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            let destinationVC = segue.destination as! SettingsViewController
            destinationVC.delegate = self
        }
    }
    
}

