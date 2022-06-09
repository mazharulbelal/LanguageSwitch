//
//  ViewController.swift
//  LanguageSwitch
//
//  Created by Belal on 8/6/22.
//

import UIKit
import Localize_Swift

class ViewController: UIViewController {
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setText()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    
    
    @objc func setText(){
        textLbl.text = "helloKey".localized()
    }
    
    
    
    
    // Remove the LCLLanguageChangeNotification on viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func onClickedCurrentLanguage(_ sender: Any) {
        statusLbl.text = Localize.currentLanguage()
    }
    
    @IBAction func onClickedAllLanguage(_ sender: Any) {
        statusLbl.text = Localize.availableLanguages().joined(separator: ", ")
    }
    
    @IBAction func onClickedChangeToBangla(_ sender: Any) {
        Localize.setCurrentLanguage("bn")
    }
    
    @IBAction func onClickedChangeToEnglish(_ sender: Any) {
        Localize.setCurrentLanguage("en")
    }
    
    
}

