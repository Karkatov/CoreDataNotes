//
//  ViewController.swift
//  ShopApp
//
//  Created by Duxxless on 27.03.2022.
//

import UIKit

protocol SendTextDelegate {
    func sendText(text: String)
}

class ViewController: UIViewController {
    
    let button: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("Передать вперед👉🏻", for: .normal)
        myButton.backgroundColor = .systemMint
        myButton.tintColor = .white
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        myButton.layer.cornerRadius = 30
        return myButton
    }()
    let textfield: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 20
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        return tf
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        view.backgroundColor = .systemGray
        
        button.frame = CGRect(x: view.bounds.size.width / 2 - 130,
                              y: 500, width: 260, height: 70)
        button.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
        view.addSubview(button)
        
        textfield.frame = CGRect(x: 30, y: 200, width: view.bounds.size.width - 60, height: 40)
        view.addSubview(textfield)
    
    }
    
    // Кнопка вперед
    @objc func goToSecondVC() {
   
        let secondViewController = SecondViewController()
        // подписали контроллер на протокол
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController: SendTextDelegate {
    func sendText(text: String) {
        textfield.text = text
    }
}
