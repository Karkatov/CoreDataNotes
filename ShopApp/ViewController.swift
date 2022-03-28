//
//  ViewController.swift
//  ShopApp
//
//  Created by Duxxless on 27.03.2022.
//

import UIKit

protocol ViewControllerDelegate {
    func updateTitle(text: String)
}

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    let tableVC = TableTableViewController()
    
    @IBOutlet weak var fistTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func sendInfo(_ sender: UIButton) {
        let text = fistTF.text!
        delegate?.updateTitle(text: text)
        navigationController?.popViewController(animated: true)
    }
}

