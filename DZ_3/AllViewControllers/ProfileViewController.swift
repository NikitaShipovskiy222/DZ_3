//
//  ViewController.swift
//  DZ_3
//
//  Created by Nikita Shipovskiy on 03/04/2024.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject{
    func setAboutMe(aboutMe: String)
}

class ProfileViewController: UIViewController {

    

    private lazy var imageCenter: UIImageView = {
        $0.image = .img1
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        return $0
    }(UIImageView(frame: CGRect(x: 165, y: 95, width: view.frame.width - 330, height: 75)))
    
    private lazy var yourName: UILabel = {
        $0.text = "Name"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 140, y: 193, width: view.frame.width - 319, height: 19)))
    
    private lazy var yourSurname: UILabel = {
        $0.text = "Surname"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel(frame: CGRect(x: 190, y: 193, width: view.frame.width - 319, height: 19)))
    
    private lazy var aboutMeLabel: UILabel = {
        $0.text = "About Me"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return $0
    }(UILabel(frame: CGRect(x: 42, y: 245, width: view.frame.width - 300, height: 19)))

    
    private lazy var aboutMeText: UILabel = {
        $0.backgroundColor = UIColor(named: "ViewColor")
        $0.numberOfLines = 0
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.textAlignment = .center
        return $0
    }((UILabel(frame: CGRect(x: 30, y: 273, width: view.frame.width - 60, height: 158))))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Name Surname"
        view.addSubview(imageCenter)
        view.addSubview(yourName)
        view.addSubview(yourSurname)
        view.addSubview(aboutMeLabel)
        view.addSubview(aboutMeText)
        
        
    }


}

extension ProfileViewController: ProfileViewControllerDelegate{
    func setAboutMe(aboutMe: String) {
        self.aboutMeText.text = aboutMe
    }
    
    

    
    
}

#Preview() {
    ProfileViewController()
}
