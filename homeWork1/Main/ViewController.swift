//
//  ViewController.swift
//  homeWork1
//
//  Created by admin on 04.09.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    } // подписаться на уведомдения
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture  )
    }
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
    }
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObservers(){
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
   
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    @objc private func handleKeybordWillShow(){
       self.scrollView.contentInset.bottom += 120
    }
    
    @objc private func handleKeybordWillHide(){
       self.scrollView.contentInset.bottom = 0
    }
    
    
    private func tabBar() {
        let tabControler = Constans.tabBar.tabBar.instantiateInitialViewController()
        self.present(tabControler!, animated: true)
    }
    
    
    private func showUserScene() {
        let viewControler = Constans.Storyboard.debugMenu.instantiateInitialViewController()
        if let viewControler = viewControler as? DebugViewController {
            self.present(viewControler, animated: true)
        }
   }
    
    private func showAllert() {
        let allertController = UIAlertController(title: "Ошибка", message: "Введены неверные данные админа", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel)
        
        allertController.addAction(action)
        self.present(allertController, animated: true)
        
        
    }
    
    @IBAction private func onBattonPressed(_ sender: Any) {
        
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
    
        if login == "admin" && password == "admin" {
            //новый экран
            //print("успешная авторизация")
            self.showUserScene()
        } else if  (login == "user" && password == "user") {
            self.tabBar()
        } else {
            //аллерт
            //print("факап")
            self.showAllert()
        }
        
        
    }
   
}

