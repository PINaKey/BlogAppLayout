//
//  ViewController.swift
//  BlogApp
//
//  Created by Pinaki Bandyopadhyay on 01/05/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    //MARK: - Properties
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        scroll.delegate = self
        scroll.contentSize = CGSize(width: view.frame.width, height: 1000)
        return scroll
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "i.vikas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "5 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let timeOfReadLabel: UILabel = {
        let label = UILabel()
        label.text = "5 min read"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return button
    }()
    
    private let contentImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private let contentHeading: UILabel = {
        let label = UILabel()
        label.text = "Improve Build Efficiency"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let contentParagraph: UILabel = {
        let label = UILabel()
        label.text = "purus semper eget duis at tellus at urna condimentum mattis pellentesque id nibh tortor id aliquet lectus proin nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas sed tempus urna et pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas integer eget aliquet nibh praesent tristique magna sit amet purus gravida quis blandit turpis cursus in hac habitasse platea dictumst quisque sagittis purus"
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = view.safeAreaLayoutGuide
        scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
    }
    
    func configureUI() {
        
        view.addSubview(scrollView)
     
        scrollView.addSubview(profileImageView)
        profileImageViewConstraints()
        profileImageView.layer.cornerRadius = 50 / 2
        
        scrollView.addSubview(nameLabel)
        nameLabelConstraints()
        
        scrollView.addSubview(followButton)
        followButtonConstraints()
        followButton.layer.cornerRadius = 20 / 2
        
        let stack = UIStackView(arrangedSubviews: [dateLabel, timeOfReadLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .leading
        
        scrollView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        stack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20).isActive = true
       
        scrollView.addSubview(contentImageView)
        contentImageViewConstraints()
        
        scrollView.addSubview(contentHeading)
        contentHeadingConstraints()
        
        scrollView.addSubview(contentParagraph)
        contentParagraphConstraints()
    }
    
    //MARK: - Constraints
    
    func profileImageViewConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func nameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20).isActive = true
    }
    
    func followButtonConstraints() {
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        followButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func contentImageViewConstraints() {
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        contentImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func contentHeadingConstraints() {
        contentHeading.translatesAutoresizingMaskIntoConstraints = false
        contentHeading.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 20).isActive = true
        contentHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
    }
    
    func contentParagraphConstraints() {
        contentParagraph.translatesAutoresizingMaskIntoConstraints = false
        contentParagraph.topAnchor.constraint(equalTo: contentHeading.bottomAnchor, constant: 20).isActive = true
        contentParagraph.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        contentParagraph.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20).isActive = true
        contentParagraph.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

