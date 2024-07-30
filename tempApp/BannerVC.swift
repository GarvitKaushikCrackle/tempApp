//
//  CardSelectionVC.swift
//  CardWorkoutProgrammatic
//
//  Created by Garvit Kaushik on 04/04/24.
//

import UIKit
import CrackleSDK

class BannerVC: UIViewController {
    let mainStackView = UIStackView()
    let adSpace = UIView()
    let bannerButton = CWButton(backgroundColor: .systemBlue, title: "banner")
    let largeBannerButton = CWButton(backgroundColor: .systemBlue, title: "large banner")
    let mrecButton = CWButton(backgroundColor: .systemBlue, title: "MREC")
    let leaderBoardButton = CWButton(backgroundColor: .systemBlue, title: "Leader")
    let adaptiveBannerButton = CWButton(backgroundColor: .systemBlue, title: "Adapt")
    let customBannerButton = CWButton(backgroundColor: .systemBlue, title: "Custom")
    let pauseButton = CWButton(backgroundColor: .systemRed, title: "Pause ref")
    let playButton = CWButton(backgroundColor: .systemGreen, title: "Resume ref")
    var crackleAdView: CrackleAdView!
    
    var buttons: [CWButton]!
    var buttonActions: [Selector]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        buttons = [bannerButton, largeBannerButton, mrecButton, leaderBoardButton, adaptiveBannerButton, customBannerButton, pauseButton, playButton, playButton]
        buttonActions = [#selector(loadBanner), #selector(loadLarge), #selector(loadMREC), #selector(loadLeader), #selector(loadAdaptive), #selector(loadCustom), #selector(pauseRef), #selector(playRef), #selector(playRef)]
        configureUI()
        crackleAdView = CrackleAdView(viewController: self)
        crackleAdView.setListener(crackleAdViewAdListener: MyAdListener())
    }
    
    func configureUI() {
        configureAdSpace()
        configureGrid()
    }
    
    func configureAdSpace() {
        view.addSubview(adSpace)
        adSpace.translatesAutoresizingMaskIntoConstraints = false
        adSpace.backgroundColor = .systemGray
        NSLayoutConstraint.activate([
            adSpace.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adSpace.heightAnchor.constraint(equalToConstant: 350),
            adSpace.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func configureGrid() {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10
        
        // Add 3 horizontal stack views
        for idx in 0..<3 {
            let rowStackView = createRowStackView(idx: idx)
            mainStackView.addArrangedSubview(rowStackView)
        }
        
        // Add the main stack view to the view controller's view
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        
        // Set constraints for the main stack view
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: adSpace.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: adSpace.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: adSpace.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // Helper function to create a horizontal stack view
    private func createRowStackView(idx: Int) -> UIStackView {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fillEqually
        rowStackView.spacing = 10
        
        // Add 3 UI elements to the row stack view
        for i in 0..<3 {
            let element = buttons[idx*3 + i]
            element.addTarget(self, action: buttonActions[idx*3 + i], for: .touchUpInside)
            rowStackView.addArrangedSubview(element)
        }
        
        return rowStackView
    }
      
    @objc func loadBanner() {
        crackleAdView.setAdSizes(adSizes: [AdSize.banner])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            crackleAdView.centerXAnchor.constraint(equalTo: adSpace.centerXAnchor),
            crackleAdView.topAnchor.constraint(equalTo: adSpace.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func loadLarge() {
        crackleAdView.setAdSizes(adSizes: [AdSize.large])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func loadMREC() {
        crackleAdView.setAdSizes(adSizes: [AdSize.rectangle])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func loadLeader() {
        crackleAdView.setAdSizes(adSizes: [AdSize.leaderboard])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func loadAdaptive() {
        crackleAdView.setAdSizes(adSizes: [AdSize.adaptive(width: 150)])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func loadCustom() {
        crackleAdView.setAdSizes(adSizes: [AdSize.custom(width: 100, height: 100)])
        crackleAdView.loadAd()
        adSpace.addSubview(crackleAdView)
        crackleAdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    @objc func pauseRef() {
        crackleAdView.pauseRefreshRate()
    }
    
    @objc func playRef() {
        crackleAdView.startRefreshRate(seconds: TimeInterval(30))
    }
}

extension BannerVC {
    class MyAdListener: CrackleAdViewAdListener {
        func onAdLoaded() {
            print("Ad loaded successfully.")
        }
        
        func onAdFailedToLoad(adsError: AdsError) {
            print("Ad failed to load.")
            print(adsError.message)
        }
        
        func onAdClicked() {
            print("Ad clicked.")
        }
    }
}

//        configureBannerButton()
//        configureLargeBannerButton()
//        configureMREC()
//        configureAdaptiveBannerButton()
//        configureCustomBannerButton()
//        configurePlayButton()

//    func configureBannerButton() {
//        view.addSubview(bannerButton)
//        bannerButton.addTarget(self, action: #selector(loadBanner), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            bannerButton.widthAnchor.constraint(equalToConstant: 260),
//            bannerButton.heightAnchor.constraint(equalToConstant: 40),
//            bannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bannerButton.topAnchor.constraint(equalTo: adSpace.bottomAnchor, constant: 30),
//        ])
//    }
//
//    func configureLargeBannerButton() {
//        view.addSubview(largeBannerButton)
//        largeBannerButton.addTarget(self, action: #selector(loadLarge), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            largeBannerButton.widthAnchor.constraint(equalToConstant: 260),
//            largeBannerButton.heightAnchor.constraint(equalToConstant: 40),
//            largeBannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            largeBannerButton.topAnchor.constraint(equalTo: bannerButton.bottomAnchor, constant: 30),
//        ])
//    }
//
//    func configureMREC() {
//        view.addSubview(mrecButton)
//        mrecButton.addTarget(self, action: #selector(loadMREC), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            mrecButton.widthAnchor.constraint(equalToConstant: 260),
//            mrecButton.heightAnchor.constraint(equalToConstant: 40),
//            mrecButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mrecButton.topAnchor.constraint(equalTo: largeBannerButton.bottomAnchor, constant: 30),
//        ])
//    }
//
//    func configureAdaptiveBannerButton() {
//
//    }
//
//    func configureCustomBannerButton() {
//
//    }
//
//    func configurePauseButton() {
//        view.addSubview(pauseButton)
//        pauseButton.addTarget(self, action: #selector(loadMREC), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            pauseButton.widthAnchor.constraint(equalToConstant: 260),
//            pauseButton.heightAnchor.constraint(equalToConstant: 40),
//            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pauseButton.topAnchor.constraint(equalTo: mrecButton.bottomAnchor, constant: 30),
//        ])
//    }
//
//    func configurePlayButton() {
//        view.addSubview(playButton)
//        playButton.addTarget(self, action: #selector(playRef), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            playButton.widthAnchor.constraint(equalToConstant: 260),
//            playButton.heightAnchor.constraint(equalToConstant: 40),
//            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            playButton.topAnchor.constraint(equalTo: mrecButton.bottomAnchor, constant: 30),
//        ])
//    }
//
//
//    func configureLeaderBoardButton() {
////        view.addSubview(leaderBoardButton)
////        leaderBoardButton.addTarget(self, action: #selector(loadLeaderBoard), for: .touchUpInside)
////        NSLayoutConstraint.activate([
////            leaderBoardButton.widthAnchor.constraint(equalToConstant: 260),
////            leaderBoardButton.heightAnchor.constraint(equalToConstant: 40),
////            leaderBoardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            leaderBoardButton.topAnchor.constraint(equalTo: mrecButton.bottomAnchor, constant: 30),
////        ])
//    }
//
