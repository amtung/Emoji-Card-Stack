//
//  EmojiCardViewController.swift
//  EmojiCardStack
//
//  Created by Annie Tung on 12/20/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import UIKit

class EmojiCardViewController: UIViewController {
    
    lazy var emojiCardView: EmojiCard = {
        let emojiCard = EmojiCard(value: 1, suit: "one", frame: .zero)
        emojiCard.translatesAutoresizingMaskIntoConstraints = false
        return emojiCard
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let emptyView: UIView = UIView()
        self.view.addSubview(emptyView)
        emptyView.backgroundColor = .gray
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        emptyView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        self.view.addSubview(emojiCardView)
//        self.title = "Emoji Stack"
        emojiCardConstraints()
        setupDrawCardButton()
        setupShowStackButton()
        setupRemoveRandomButton()
        setupRemoveAllButton()
    }
    
    // MARK: - View Controller Constraints
    func emojiCardConstraints() {
        let _ = [
        emojiCardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
        emojiCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
        emojiCardView.leftAnchor.constraint(equalTo: view.leftAnchor),
        emojiCardView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].map { $0.isActive = true }
    }
    
    // MARK: - Buttons
    func setupDrawCardButton() {
        let drawCardButton: UIButton = UIButton(type: UIButtonType.system)
        self.view.addSubview(drawCardButton)
        drawCardButton.setTitle("Draw Card", for: .normal)
        drawCardButton.addTarget(self, action: #selector(didTapDrawCard(sender:)), for: .touchUpInside)
        drawCardButton.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
        drawCardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        drawCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ].map { $0.isActive = true }
    }
    
    func setupShowStackButton() {
        let showStackButton: UIButton = UIButton(type: UIButtonType.system)
        self.view.addSubview(showStackButton)
        showStackButton.setTitle("Show Stack", for: .normal)
        showStackButton.addTarget(self, action: #selector(didTapShowStack(sender:)), for: .touchUpInside)
        showStackButton.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            showStackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            showStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ].map { $0.isActive = true }
    }
    
    func setupRemoveRandomButton() {
        let removeRandomButton: UIButton = UIButton(type: UIButtonType.system)
        self.view.addSubview(removeRandomButton)
        removeRandomButton.setTitle("Remove Random", for: .normal)
        removeRandomButton.addTarget(self, action: #selector(didTapRemoveRandom(sender:)), for: .touchUpInside)
        removeRandomButton.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            removeRandomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            removeRandomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
            ].map { $0.isActive = true }
    }
    
    func setupRemoveAllButton() {
        let removeAllButton: UIButton = UIButton(type: UIButtonType.system)
        self.view.addSubview(removeAllButton)
        removeAllButton.setTitle("Remove All", for: .normal)
        removeAllButton.addTarget(self, action: #selector(didTapRemoveAll(sender:)), for: .touchUpInside)
        removeAllButton.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            removeAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            removeAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ].map { $0.isActive = true }
    }
    
    // MARK: - Button Actions
    func didTapDrawCard(sender: UIButton) {
        print("Draw card button tapped")
        let emojiCardVC = EmojiCardViewController()
        emojiCardVC.emojiCardView.backgroundColor = self.randomColorGenerator()
        
        self.navigationController?.pushViewController(emojiCardVC, animated: true)
//        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
    }
    
    func didTapShowStack(sender: UIButton) {
        print("Show Stack button tapped")
    }
    
    func didTapRemoveRandom(sender: UIButton) {
        print("Remove Random button tapped")
    }
    
    func didTapRemoveAll(sender: UIButton) {
        print("Remove All button tapped")
    }
    
    // MARK: - Methods
    func randomColorGenerator() -> UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    /*
    
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }
    
    override func viewDidAppear(_ animated: Bool) {
        <#code#>
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        <#code#>
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        <#code#>
    }
    
    override func viewDidLayoutSubviews() {
        <#code#>
    } */


}

