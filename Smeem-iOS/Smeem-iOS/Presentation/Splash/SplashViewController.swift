//
//  SplashViewController.swift
//  Smeem-iOS
//
//  Created by 황찬미 on 2023/05/06.
//

import UIKit

import SnapKit

final class SplashViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let SmeemLogoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let SmeemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "smeem"
        label.font = .h1
        label.textColor = .black
        return label
    }()
    
    private let SmeemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
                     일기로 시작하는 영어 아웃풋 훈련,
                     스밈입니다.
                     """
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .b4
        label.setTextWithLineHeight(lineHeight: 22)
       return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .b4
        button.setTitle("이미 계정이 있어요.", for: .normal)
        button.setTitleColor(.gray600, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let startButton: SmeemButton = {
        let button = SmeemButton()
        button.setTitle("시작하기", for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    @objc func loginButtonDidTap() {
        let bottomSheetVC = BottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: false) {
            bottomSheetVC.bottomSheetView.frame.origin.y = self.view.frame.height
            UIView.animate(withDuration: 0.3) {
                bottomSheetVC.bottomSheetView.frame.origin.y = self.view.frame.height-bottomSheetVC.defaultLoginHeight
            }
        }
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(SmeemLogoIcon, SmeemNameLabel, SmeemDescriptionLabel,
                         loginButton, startButton)
        
        SmeemLogoIcon.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(149)
            $0.leading.equalToSuperview().inset(26)
        }
        
        SmeemNameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(141)
            $0.leading.equalTo(SmeemLogoIcon.snp.trailing).offset(5)
        }
        
        SmeemDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(SmeemLogoIcon.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(26)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(78)
            $0.bottom.equalTo(startButton.snp.top).offset(-10)
            $0.height.equalTo(43)
        }
        
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(46)
            $0.height.equalTo(60)
        }
    }
}
