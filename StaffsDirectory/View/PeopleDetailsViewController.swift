//
//  PeopleDetailsViewController.swift
//  VMDirectoryAPP
//
// Created by Venkatesh on 08/07/2022.
//

import UIKit

final class PeopleDetailsViewController: UIViewController {
    
    @IBOutlet private weak var staffPotrait: UIImageView!
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet private weak var createdAtLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    
    var viewModel:PeopleDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        firstNameLabel.text = viewModel.people.firstName
        lastNameLabel.text = viewModel.people.lastName
        createdAtLabel.text = viewModel.people.joinedDate
        emailLabel.text = viewModel.people.email
        jobTitleLabel.text = viewModel.people.jobTitle

        setImageAvatar()
    }
    
    private func setImageAvatar() {
        ImageDownloader.shared.getImage(url: viewModel.people.avatar) { [weak self] data in
            DispatchQueue.main.async {
                self?.staffPotrait.image = UIImage(data: data)
            }
        }
    }
}

