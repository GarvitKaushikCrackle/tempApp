//
//  CardSelectionVC.swift
//  CardWorkoutProgrammatic
//
//  Created by Garvit Kaushik on 04/04/24.
//

import UIKit
import CoreSDK
import AppLovinSDK

class CardSelectionVC: UIViewController {
    let nativeButton = CWButton(backgroundColor: .systemRed, title: "native")
    let bannerButton = CWButton(backgroundColor: .systemRed, title: "banner")
    let largeBannerButton = CWButton(backgroundColor: .systemRed, title: "large banner")
    let mrecButton = CWButton(backgroundColor: .systemRed, title: "MREC")
//    let leaderBoardButton = CWButton(backgroundColor: .systemRed, title: "start 30s refresh")
    let intButton = CWButton(backgroundColor: .systemBlue, title: "Interstitial")
    let rewButton = CWButton(backgroundColor: .systemBlue, title: "Rewarded")
    let natButton = CWButton(backgroundColor: .systemGreen, title: "Native")
    
    let adSpace = UIView()
    var crackleAdView: CrackleAdView? = nil
    var crackleAdLoader: CrackleAdLoader? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CoreSDK.shared.initialize(listener: crackleInitializationCompleteListener(viewController: self))
        CoreSDK.shared.startLoadingAds(viewController: self, placementName: [])
        configureUI()
        crackleAdView = CrackleAdView(rootViewController: self)
        crackleAdLoader = CrackleAdLoader.Builder(viewController: self, adUnitId: "").build()
//        CrackleInterstitialAd.shared.setListener(crackleAdListener: )
//        CrackleInterstitialAd.shared.setFrequencyCapping(numberOfAds: 2, timeIntervalInSec: TimeInterval(30*60))
//        startTimer()
//        CrackleInterstitialAd.shared.loadAd()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
//            CrackleInterstitialAd.shared.showAd(viewController: self)
//        })
    }
    
    func configureUI() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//            self.configureAds()
//        }
        configureAdSpace()
//        configureTextBox()
        configureNativeButton()
        configureBannerButton()
        configureLargeBannerButton()
        configureMREC()
//        configureLeaderBoardButton()
        configureIntButton()
        configureRewdButton()
    }
    
    func configureAdSpace() {
        view.addSubview(adSpace)
        adSpace.translatesAutoresizingMaskIntoConstraints = false
        adSpace.backgroundColor = .systemGray
        NSLayoutConstraint.activate([
            adSpace.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adSpace.heightAnchor.constraint(equalToConstant: 200),
            adSpace.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureTextBox() {
          
//          // Set the dimensions
//          textView.frame = CGRect(x: (self.view.frame.width - 320) / 2, y: (self.view.frame.height - 50) / 2, width: 320, height: 25)
//          
//          // Set the background color to white
//          textView.backgroundColor = .white
//          
//          // Set the text color to black
//          textView.textColor = .black
//          
//          // Set some sample text
//          textView.text = "This is a sample text"
//          
//          // Optionally, configure additional properties
//          textView.font = UIFont.systemFont(ofSize: 16)
//          textView.textAlignment = .center
//          textView.isEditable = false
//          
//          // Add the textView to the view hierarchy
//          self.view.addSubview(textView)
//        
//        NSLayoutConstraint.activate([
//            textView.leadingAnchor.constraint(equalTo: adSpace.leadingAnchor),
//            textView.trailingAnchor.constraint(equalTo: adSpace.trailingAnchor),
//            textView.heightAnchor.constraint(equalToConstant: 300),
//            textView.centerYAnchor.constraint(equalTo: adSpace.centerYAnchor, constant: -75)
//        ])
      }
    
    func configureNativeButton() {
//        view.addSubview(nativeButton)
//        nativeButton.addTarget(self, action: #selector(loadNative), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            nativeButton.widthAnchor.constraint(equalToConstant: 260),
//            nativeButton.heightAnchor.constraint(equalToConstant: 40),
//            nativeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nativeButton.topAnchor.constraint(equalTo: adSpace.bottomAnchor, constant: 30),
//        ])
    }
    
    func configureBannerButton() {
        view.addSubview(bannerButton)
        bannerButton.addTarget(self, action: #selector(loadBanner), for: .touchUpInside)
        NSLayoutConstraint.activate([
            bannerButton.widthAnchor.constraint(equalToConstant: 260),
            bannerButton.heightAnchor.constraint(equalToConstant: 40),
            bannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerButton.topAnchor.constraint(equalTo: adSpace.bottomAnchor, constant: 30),
        ])
    }
    
    func configureLargeBannerButton() {
        view.addSubview(largeBannerButton)
        largeBannerButton.addTarget(self, action: #selector(loadLarge), for: .touchUpInside)
        NSLayoutConstraint.activate([
            largeBannerButton.widthAnchor.constraint(equalToConstant: 260),
            largeBannerButton.heightAnchor.constraint(equalToConstant: 40),
            largeBannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeBannerButton.topAnchor.constraint(equalTo: bannerButton.bottomAnchor, constant: 30),
        ])
    }
    
    func configureMREC() {
        view.addSubview(mrecButton)
        mrecButton.addTarget(self, action: #selector(loadMREC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            mrecButton.widthAnchor.constraint(equalToConstant: 260),
            mrecButton.heightAnchor.constraint(equalToConstant: 40),
            mrecButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mrecButton.topAnchor.constraint(equalTo: largeBannerButton.bottomAnchor, constant: 30),
        ])
    }
    
    func configureLeaderBoardButton() {
//        view.addSubview(leaderBoardButton)
//        leaderBoardButton.addTarget(self, action: #selector(loadLeaderBoard), for: .touchUpInside)
//        NSLayoutConstraint.activate([
//            leaderBoardButton.widthAnchor.constraint(equalToConstant: 260),
//            leaderBoardButton.heightAnchor.constraint(equalToConstant: 40),
//            leaderBoardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            leaderBoardButton.topAnchor.constraint(equalTo: mrecButton.bottomAnchor, constant: 30),
//        ])
    }
    
    func configureIntButton() {
        view.addSubview(intButton)
        intButton.addTarget(self, action: #selector(loadInt), for: .touchUpInside)
        NSLayoutConstraint.activate([
            intButton.widthAnchor.constraint(equalToConstant: 260),
            intButton.heightAnchor.constraint(equalToConstant: 40),
            intButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            intButton.topAnchor.constraint(equalTo: mrecButton.bottomAnchor, constant: 30),
        ])
    }
    
    func configureRewdButton() {
        view.addSubview(rewButton)
        rewButton.addTarget(self, action: #selector(loadRew), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rewButton.widthAnchor.constraint(equalToConstant: 260),
            rewButton.heightAnchor.constraint(equalToConstant: 40),
            rewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rewButton.topAnchor.constraint(equalTo: intButton.bottomAnchor, constant: 30),
        ])
    }
    
    func configureNatButton() {
        view.addSubview(natButton)
        natButton.addTarget(self, action: #selector(loadNative), for: .touchUpInside)
        NSLayoutConstraint.activate([
            natButton.widthAnchor.constraint(equalToConstant: 260),
            natButton.heightAnchor.constraint(equalToConstant: 40),
            natButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            natButton.topAnchor.constraint(equalTo: rewButton.bottomAnchor, constant: 30),
        ])
    }
    
    @objc func loadNative() {
        crackleAdLoader.loadAd()
    }
    
    @objc func loadBanner() {
        if let crackleAdView = crackleAdView {
            do {
                try crackleAdView.setAdSizes(adSizes: [AdSize.banner])
                crackleAdView.setListener(crackleAdViewAdListener: MyAdListener())
                try crackleAdView.loadAd()
                adSpace.addSubview(crackleAdView)
                crackleAdView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    crackleAdView.centerXAnchor.constraint(equalTo: adSpace.centerXAnchor),
                    crackleAdView.topAnchor.constraint(equalTo: adSpace.safeAreaLayoutGuide.topAnchor),
                    crackleAdView.widthAnchor.constraint(equalToConstant: 320),
                    crackleAdView.heightAnchor.constraint(equalToConstant: 50)
                ])
            } catch {
                print("Error loading ad: \(error)")
            }
        } else {
            print("CrackleAdView is nil")
        }
    }
    
    @objc func loadLarge() {
        if let crackleAdView = crackleAdView {
            do {
                try crackleAdView.setAdSizes(adSizes: [AdSize.large])
                crackleAdView.setListener(crackleAdViewAdListener: MyAdListener())
                try crackleAdView.loadAd()
                adSpace.addSubview(crackleAdView)
                crackleAdView.translatesAutoresizingMaskIntoConstraints = false

                // Activate constraints
                NSLayoutConstraint.activate([
                    crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    crackleAdView.widthAnchor.constraint(equalToConstant: 320),
                    crackleAdView.heightAnchor.constraint(equalToConstant: 100)
                ])
            } catch {
                print("Error loading ad: \(error)")
            }
        } else {
            print("CrackleAdView is nil")
        }
    }
    @objc func loadMREC() {
        if let crackleAdView = crackleAdView {
            do {
                try crackleAdView.setAdSizes(adSizes: [AdSize.rectangle])
                crackleAdView.setListener(crackleAdViewAdListener: MyAdListener())
                try crackleAdView.loadAd()
                adSpace.addSubview(crackleAdView)
                crackleAdView.translatesAutoresizingMaskIntoConstraints = false

                // Activate constraints
                NSLayoutConstraint.activate([
                    crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    crackleAdView.widthAnchor.constraint(equalToConstant: 250),
                    crackleAdView.heightAnchor.constraint(equalToConstant: 250)
                ])
            } catch {
                print("Error loading ad: \(error)")
            }
        } else {
            print("CrackleAdView is nil")
        }
    }
    @objc func loadLeaderBoard() {
        crackleAdView?.startRefreshRate(seconds: TimeInterval(30))
    }
    
    
    @objc func loadInt() {
        print("load intersitaionlal called")
        if(CrackleInterstitialAd.shared.isReady()) {
            CrackleInterstitialAd.shared.showAd(viewController: self)
        } else {
            CrackleInterstitialAd.shared.loadAd()
        }
    }
    
    @objc func loadRew() {
        print("load rewarded called")
        if(CrackleRewardedAd.shared.isReady()) {
            CrackleRewardedAd.shared.showAd(listener: crackleUserRewardListener())
        } else {
            CrackleRewardedAd.shared.loadAd()
        }
    }
    
    func configureAds() {
        //        /6499/example/adaptive-banner
        //        /23043175892/tech.crackle.DemoIOSApp/test_banner1_DemoIOSApp
        //        /23043175892/P4u4pb/tech_crackle_tempApp/P4u4pb_IOS_48_BAN_250_300_1
//        if let crackleAdView = crackleAdView {
//            do {
//                try crackleAdView.setAdSizes(adSizes: [AdSize.banner])
//                crackleAdView.setListener(crackleAdViewAdListener: MyAdListener())
//                try crackleAdView.loadAd()
//                view.addSubview(crackleAdView)
//                crackleAdView.translatesAutoresizingMaskIntoConstraints = false
//
//                // Activate constraints
//                NSLayoutConstraint.activate([
//                    crackleAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    crackleAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                    crackleAdView.widthAnchor.constraint(equalToConstant: 728),
//                    crackleAdView.heightAnchor.constraint(equalToConstant: 90)
//                ])
//            } catch {
//                print("Error loading ad: \(error)")
//            }
//        } else {
//            print("CrackleAdView is nil")
//        }
    }
    
    private class mAAdViewAdDelegate: NSObject, MAAdViewAdDelegate{
        func didExpand(_ ad: MAAd) {
            
        }
        
        func didCollapse(_ ad: MAAd) {
            
        }
        
        func didLoad(_ ad: MAAd) {
            print("didLoad")
        }
        
        func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
            
        }
        
        func didDisplay(_ ad: MAAd) {
            
        }
        
        func didHide(_ ad: MAAd) {
            
        }
        
        func didClick(_ ad: MAAd) {
            
        }
        
        func didFail(toDisplay ad: MAAd, withError error: MAError) {
            
        }
    }
}

public func printCurrentTimeInMilliseconds() {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSS" // Hour:Minute:Second.Milliseconds
    let now = Date()
    let formattedTime = formatter.string(from: now)
    print("Current Time (HH:mm:ss.SSS): \(formattedTime)")
  }


class MyAdListener: CrackleAdViewAdListener {
    func onAdLoaded() {
        print("Ad loaded successfully.")
    }
    
    func onAdFailedToLoad(adsError: AdsError) {
        print("################# Ad failed to load.")
        print(adsError.message)
        print("load fail")
        printCurrentTimeInMilliseconds()
    }
    
    func onAdClicked() {
        print("Ad clicked.")
    }
}

class Toast {
    static func showToast(message: String, duration: Double = 5.0) {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }

        let toastLabel = UILabel(frame: CGRect(x: window.frame.size.width/2 - 150, y: window.frame.size.height - 100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        window.addSubview(toastLabel)
        
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

extension CardSelectionVC {
    class crackleInitializationCompleteListener: CrackleInitializationCompleteListener {
        
        weak var viewController: UIViewController?
        
        init(viewController: UIViewController) {
            self.viewController = viewController
//            GAM IS MAX
        }
        
        func onInitializationComplete() {
            Toast.showToast(message: "Initialization complete")
        }
    }
    
    class crackleUserRewardListener: CrackleUserRewardListener {
        func onUserRewarded(crackleReward: CrackleReward) {
            print(crackleReward.amount, crackleReward.type)
        }
    }
    
    class crackleAdListener: CrackleAdListener {
        func onAdLoaded() {
            Toast.showToast(message: "onAdLoaded Interstitial")
        }
        
        func onAdFailedToLoad(adsError: AdsError) {
            
        }
        
        func onAdFailedToShow(adsError: AdsError) {
            
        }
        
        func onAdDisplayed() {
            
        }
        
        func onAdDismissed() {
            
        }
        
        func onAdClicked() {
            
        }
        
//        weak var viewController: UIViewController?
//        
//        init(viewController: UIViewController) {
//            self.viewController = viewController
//        }
//        
//        func onInitializationComplete() {
//            print("Initialization complete")
//            DispatchQueue.main.async {
//                Toast.showToast(message: "Initialization complete")
//            }
//        }
    }
}


