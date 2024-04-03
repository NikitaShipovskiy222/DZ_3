//
//  MainViewController.swift
//  DZ_3
//
//  Created by Nikita Shipovskiy on 03/04/2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func setName(name: String)
    func setSurname(surname: String)
}

class MainViewController: UIViewController {



    private lazy var profileView: UIView = {
        $0.backgroundColor = UIColor(named: "ViewColor")
        $0.layer.cornerRadius = 20
        return $0
    }(UIView(frame: CGRect(x: 30, y: 101, width: view.frame.width - 60, height: 110)))
    
    private lazy var imageProfile: UIImageView = {
        $0.image = .img1
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        return $0
    }(UIImageView(frame: CGRect(x: 47, y: 119, width: view.frame.width - 320, height: 75)))
    
    private lazy var loginNameLabel: UILabel = {
        $0.text = "Name "
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 134, y: 130, width: view.frame.width - 200, height: 19)))
    
    private lazy var loginSurnameLabel: UILabel = {
        $0.text = "Surname"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 185, y: 130, width: view.frame.width - 200, height: 19)))
    
    
     private lazy var editButton: UIButton = {
        $0.setTitle("Edit", for: .normal)
        $0.backgroundColor = .blue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
      }(UIButton(frame: CGRect(x: 134, y: 156, width: view.frame.width - 239, height: 30), primaryAction: actionEdit))
    

    lazy var actionEdit = UIAction { [weak self] _ in
        let secondVc = SettingsViewController()
        secondVc.delegate = self
        self?.navigationController?.pushViewController(secondVc, animated: true)
        
    }

    
    private lazy var nextVCButton: UIButton = {
        $0.setImage(.img2, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: 366, y: 148, width: view.frame.width - 470, height: 17), primaryAction: actionNextVC))
    
    
    lazy var actionNextVC = UIAction { [weak self] _ in
        let abouMeSreen = ProfileViewController()
        self?.navigationController?.pushViewController(abouMeSreen, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        view.backgroundColor = .white
        view.addSubview(profileView)
        view.addSubview(imageProfile)
        view.addSubview(loginNameLabel)
        view.addSubview(editButton)
        view.addSubview(nextVCButton)
        view.addSubview(loginSurnameLabel)
        
    }
}

extension MainViewController: MainViewControllerDelegate {
    
    func setSurname(surname: String) {
        self.loginSurnameLabel.text = surname
    }
    
    func setName(name: String){
        self.loginNameLabel.text = name
    }
                 


}
