//
//  CardSelectionVC.swift
//  CardWorkoutProgrammatic
//
//  Created by Garvit Kaushik on 04/04/24.
//

import UIKit
import Alamofire
import tempFramework

class CardSelectionVC: UIViewController {
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset!")
    let ruleButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!

    override func viewDidLoad() {
//        let log = Logger()
//        log.printLog()
//        log.printSorted()
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
//        let response = AF.request("https://httpbin.org/get", interceptor: .retryPolicy)
//                               // Automatic HTTP Basic Auth.
//                               .authenticate(username: "user", password: "pass")
//                               // Caching customization.
//                               .cacheResponse(using: .cache)
//                               // Redirect customization.
//                               .redirect(using: .follow)
//                               // Validate response code and Content-Type.
//                               .validate()
//                               // Produce a cURL command for the request.
//                               .cURLDescription { description in
//                                 print(description)
//                               }
        logger.sayHi()
        logger.sayGoogleBhiaKiJai()
        CoreSDK.shared.initialize()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
        configureAds()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "2C")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 300),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(ruleButton)
        ruleButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            ruleButton.widthAnchor.constraint(equalToConstant: 115),
            ruleButton.heightAnchor.constraint(equalToConstant: 50),
            ruleButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            ruleButton .topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }
    
    func configureAds() {
        // Initialize CrackleAdView
        let crackleAdView = CrackleAdView()
        crackleAdView.loadAd(rootViewController: self, adUnitId: "/23043175892/tech.crackle.DemoIOSApp/test_banner1_DemoIOSApp", crackleAdViewAdListener: MyAdListener())
        crackleAdView.loadAd(rootViewController: self, adUnitId: "/23043175892/tech.crackle.DemoIOSApp/test_banner1_DemoIOSApp", crackleAdViewAdListener: MyAdListener())
        // Add CrackleAdView to the parent view
        view.addSubview(crackleAdView)
        NSLayoutConstraint.activate([
            // Center the view horizontally in the main view
            crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Position the view at the bottom of the main view
            crackleAdView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20), // Adjust the constant as needed for padding
            // Set the fixed width of 320 points
            crackleAdView.widthAnchor.constraint(equalToConstant: 320),
            // Set the fixed height of 50 points
            crackleAdView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
}


class MyAdListener: CrackleAdViewAdListener {
    func onAdLoaded() {
        print("Ad loaded successfully.")
    }

    func onAdFailedToLoad() {
        print("Ad failed to load.")
    }

    func onAdClicked() {
        print("Ad clicked.")
    }
}

