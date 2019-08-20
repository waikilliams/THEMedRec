//
//  HomeViewController.swift
//  THEMedRec
//
//  Created by Williams, Kai on 7/6/19.
//  Copyright © 2019 Williams, Kai. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeLabel: UILabel = {
        let label  = UILabel()
        label.backgroundColor = UIColor.black
        label.text = "MedRec"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Rockwell", size: 36.0)
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        
        return label
    }()
    
    lazy var scheduleBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 96, g: 96, b: 96)
        button.setTitle("Schedule", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(seg2Sched), for: .touchUpInside)
        return button
    }()
    
    lazy var patLstBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 96, g: 96, b: 96)
        button.setTitle("Patient List", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(seg2PatLs), for: .touchUpInside)
        return button
    }()
    
    lazy var messengerBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 96, g: 96, b: 96)
        button.setTitle("Messenger", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(seg2Messenger), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        view.addSubview(scheduleBtn)
        view.addSubview(patLstBtn)
        view.addSubview(messengerBtn)
        view.addSubview(homeLabel)
        
        setupScheduleBtn()
        setupPatLsBtn()
        setupMessengerBtn()
        setupHomeLabel()
        
    }
    
    func setupHomeLabel() {
        //profile image x, y, width, height constraints
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        homeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        homeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupScheduleBtn() {
        //profile image x, y, width, height constraints
        scheduleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scheduleBtn.bottomAnchor.constraint(equalTo: patLstBtn.topAnchor, constant: -35).isActive = true
        scheduleBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        scheduleBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupPatLsBtn() {
        //register button x, y, width, height constraints
        patLstBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        patLstBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        patLstBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        patLstBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupMessengerBtn() {
        //register button x, y, width, height constraints
        messengerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messengerBtn.topAnchor.constraint(equalTo: patLstBtn.bottomAnchor, constant: 35).isActive = true
        messengerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        messengerBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func seg2Sched() {
        
    }
    
    @objc func seg2PatLs() {
        
    }
    
    @objc func seg2Messenger() {
        performSegue(withIdentifier: "seg2Messages", sender: nil)
    }
}
