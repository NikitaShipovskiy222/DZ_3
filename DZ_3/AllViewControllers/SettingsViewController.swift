//
//  SettingsViewController.swift
//  DZ_3
//
//  Created by Nikita Shipovskiy on 03/04/2024.
//

import UIKit



class SettingsViewController: UIViewController {
    
    //MARK: - Delegate
    weak var delegate: MainViewControllerDelegate?
    weak var delegateAbout: ProfileViewControllerDelegate?
    
    //MARK: - Make Label
    private lazy var nameLabel: UILabel = {
        $0.text = "Name"
        return $0
    }(UILabel(frame: CGRect(x: 42, y: 97, width: view.frame.width - 340, height: 19)))
    
    private lazy var secondNameLabel: UILabel = {
        $0.text = "Surname"
        return $0
    }(UILabel(frame: CGRect(x: 42, y: 194, width: view.frame.width - 320, height: 19)))
    
    private lazy var descriptionLabel: UILabel = {
        $0.text = "Description"
        return $0
    }(UILabel(frame: CGRect(x: 42, y: 291, width: view.frame.width - 310, height: 19)))
    
    
    //MARK: - Make TextFiled
    private lazy var nameTextFiled = makeTextFiled(originaY: 121, height: 51)
    private lazy var surnameTextFiled = makeTextFiled(originaY: 218, height: 51)
    private lazy var descriptionTextFiled = makeTextFiled(originaY: 315, height: 144)
    
    
    private lazy var saveButton: UIButton = {
        $0.setTitle("Save", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(frame: CGRect(x: 30, y: 750, width: view.frame.width - 60, height: 60), primaryAction: saveAction))
    
    
    lazy var saveAction = UIAction { [weak self] _ in
        self?.delegate?.setName(name: self?.nameTextFiled.text ?? "")
        self?.delegate?.setSurname(surname: self?.surnameTextFiled.text ?? "")
        
        self?.delegateAbout?.setAboutMe(aboutMe: self?.descriptionTextFiled.text ?? "")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Setting"
        
        view.addSubview(nameTextFiled)
        view.addSubview(surnameTextFiled)
        view.addSubview(descriptionTextFiled)
        
        
        view.addSubview(nameLabel)
        view.addSubview(secondNameLabel)
        view.addSubview(descriptionLabel)
        
        view.addSubview(saveButton)
        
        SettingsLabel(label: nameLabel)
        SettingsLabel(label: secondNameLabel)
        SettingsLabel(label: descriptionLabel)
    

    }
    
    //MARK: - Make func for TextFiled
    func makeTextFiled(originaX: CGFloat = 30, originaY: CGFloat, height: CGFloat) -> UITextField {
        let textFiled = UITextField(frame: CGRect(x: 30, y: originaY, width: view.frame.width - 60, height: height))
        textFiled.backgroundColor = UIColor(named: "ViewColor")
        textFiled.layer.cornerRadius = 10
        textFiled.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 1))
        textFiled.leftViewMode = .always
        return textFiled
    }
    
    //MARK: - Make func for Label
    private func SettingsLabel(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
    }

}


#Preview() {
    SettingsViewController()
}
