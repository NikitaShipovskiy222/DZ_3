//
//  MainViewController.swift
//  DZ_3
//
//  Created by Nikita Shipovskiy on 03/04/2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func addPersoneData(name: String, surname: String, description: String)
}


class MainViewController: UIViewController {

    var userAbout: String = ""

    private lazy var profileView: UIView = {
        $0.backgroundColor = UIColor(named: "ViewColor")
        $0.layer.cornerRadius = 20
        return $0
    }(UIView(frame: CGRect(x: 30, y: 101, width: view.frame.width - 60, height: 110)))
    
    //
    private lazy var imageProfile: UIImageView = {
        $0.image = .img1
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        return $0
    }(UIImageView(frame: CGRect(x: 17, y: 18, width: 75, height: 75)))
    
    private lazy var loginNameLabel: UILabel = {
        $0.text = "Name "
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 104, y: 29, width: view.frame.width - 200, height: 19)))
    
    private lazy var loginSurnameLabel: UILabel = {
        $0.text = "Surname"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 155, y: 29, width: view.frame.width - 200, height: 19)))
    
    
     private lazy var editButton: UIButton = {
        $0.setTitle("Edit", for: .normal)
        $0.backgroundColor = .blue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
      }(UIButton(frame: CGRect(x: 104, y: 55, width: view.frame.width - 239, height: 30), primaryAction: actionEdit))
    

    lazy var actionEdit = UIAction { [weak self] _ in
        let secondVc = SettingsViewController()
        secondVc.delegate = self
        self?.navigationController?.pushViewController(secondVc, animated: true)
        
    }

    
    private lazy var nextVCButton: UIButton = {
        $0.setImage(.img2, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: 336, y: 47, width: view.frame.width - 470, height: 17), primaryAction: actionNextVC))
    
    
    lazy var actionNextVC = UIAction { [weak self] _ in
        let abouMeSreen = ProfileViewController()
        abouMeSreen.yourName.text = self?.loginNameLabel.text
        abouMeSreen.yourSurname.text = self?.loginSurnameLabel.text
        abouMeSreen.aboutMeText.text = self?.userAbout
        
        abouMeSreen.title = self?.loginNameLabel.text ?? ""
        
        
        self?.navigationController?.pushViewController(abouMeSreen, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        view.backgroundColor = .white
        view.addSubview(profileView)
        profileView.addSubview(imageProfile)
        profileView.addSubview(loginNameLabel)
        profileView.addSubview(editButton)
        profileView.addSubview(nextVCButton)
        profileView.addSubview(loginSurnameLabel)
        
    }
}

extension MainViewController: MainViewControllerDelegate {
    func addPersoneData(name: String, surname: String, description: String) {
        self.loginNameLabel.text = name
        self.loginSurnameLabel.text = surname
        self.userAbout = description
    }
}


#Preview() {
    MainViewController()
}
