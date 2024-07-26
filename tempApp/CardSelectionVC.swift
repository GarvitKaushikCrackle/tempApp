//
//  CardSelectionVC.swift
//  CardWorkoutProgrammatic
//
//  Created by Garvit Kaushik on 04/04/24.
//

import UIKit
import CrackleSDK

class CardSelectionVC: UIViewController {
    let bannerButton = CWButton(backgroundColor: .systemRed, title: "banner")
    let intButton = CWButton(backgroundColor: .systemBlue, title: "Interstitial")
    let rewButton = CWButton(backgroundColor: .systemBlue, title: "Rewarded")
    let rewIntButton = CWButton(backgroundColor: .systemBlue, title: "Rewarded Int")
    let natButton = CWButton(backgroundColor: .systemGreen, title: "Native")
    
    let adSpace = UIView()
    
    var crackleAdLoader: CrackleAdLoader!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CrackleSDK.shared.initialize(viewController: self){}
//        CoreSDK.shared.startLoadingAds(viewController: self, placementName: [])
        
//        crackleAdLoader = CrackleAdLoader.Builder(viewController: self, adUnitId: "").forNativeAd(callback: {crackleNativeAd in
//            let nativeAdView = Bundle.main.loadNibNamed("CustomNativeAdView", owner: nil, options: nil)?.first as! CrackleNativeAdView
//            (nativeAdView.headlineView as? UILabel)?.text = "Garvit Kaushik"
//            (nativeAdView.bodyView as? UILabel)?.text = crackleNativeAd.body
//            (nativeAdView.callToActionView as? UIButton)?.setTitle(crackleNativeAd.callToAction, for: .normal)
//            (nativeAdView.iconView as? UIImageView)?.image = crackleNativeAd.iconDrawable
//            (nativeAdView.storeView as? UILabel)?.text = crackleNativeAd.store
////            (nativeAdView.priceView as? UILabel)?.text = crackleNativeAd.price
//            (nativeAdView.advertiserView as? UILabel)?.text = crackleNativeAd.advertiser
//            nativeAdView.callToActionView?.isUserInteractionEnabled = false
//            nativeAdView.registerNativeAd(crackleNativeAd: crackleNativeAd)
//            nativeAdView.translatesAutoresizingMaskIntoConstraints = false
//
//            self.adSpace.addSubview(nativeAdView)
//            NSLayoutConstraint.activate([
//                nativeAdView.heightAnchor.constraint(equalToConstant: 50),
//                nativeAdView.widthAnchor.constraint(equalToConstant: 320),
//                nativeAdView.centerXAnchor.constraint(equalTo: self.adSpace.centerXAnchor)
//            ])
//        }).build()

        configureUI()
    }
    
    func configureUI() {
        configureAdSpace()
        configureBannerButton()
        configureIntButton()
        configureRewdButton()
        configureRewIntButton()
        configureNatButton()
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
    
    func configureIntButton() {
        view.addSubview(intButton)
        intButton.addTarget(self, action: #selector(loadInt), for: .touchUpInside)
        NSLayoutConstraint.activate([
            intButton.widthAnchor.constraint(equalToConstant: 260),
            intButton.heightAnchor.constraint(equalToConstant: 40),
            intButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            intButton.topAnchor.constraint(equalTo: bannerButton.bottomAnchor, constant: 30),
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
    
    func configureRewIntButton() {
        view.addSubview(rewIntButton)
        rewIntButton.addTarget(self, action: #selector(loadRewInt), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rewIntButton.widthAnchor.constraint(equalToConstant: 260),
            rewIntButton.heightAnchor.constraint(equalToConstant: 40),
            rewIntButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rewIntButton.topAnchor.constraint(equalTo: rewButton.bottomAnchor, constant: 30),
        ])
    }
    
    func configureNatButton() {
        view.addSubview(natButton)
        natButton.addTarget(self, action: #selector(loadNative), for: .touchUpInside)
        NSLayoutConstraint.activate([
            natButton.widthAnchor.constraint(equalToConstant: 260),
            natButton.heightAnchor.constraint(equalToConstant: 40),
            natButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            natButton.topAnchor.constraint(equalTo: rewIntButton.bottomAnchor, constant: 30),
        ])
    }
    
    @objc func loadBanner() {
        self.navigationController?.pushViewController(BannerVC(), animated: false)
    }
    
    @objc func loadInt() {
        print("load intersitaionlal called")
        if(CrackleInterstitialAd.shared.isReady()) {
            CrackleInterstitialAd.shared.showAd()
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
    
    @objc func loadRewInt() {
        print("load rewarded called")
        if(CrackleRewardedInterstitialAd.shared.isReady()) {
            CrackleRewardedInterstitialAd.shared.showAd(listener: crackleUserRewardListener() as! CrackleUserRewardListener)
        } else {
            CrackleRewardedInterstitialAd.shared.loadAd()
        }
    }
    
    @objc func loadNative() {
        crackleAdLoader?.loadAd()
    }
}

public func printCurrentTimeInMilliseconds() {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSS" // Hour:Minute:Second.Milliseconds
    let now = Date()
    let formattedTime = formatter.string(from: now)
    print("Current Time (HH:mm:ss.SSS): \(formattedTime)")
  }

extension CardSelectionVC {
    class crackleInitializationCompleteListener: CrackleInitializationCompleteListener {
        
        weak var viewController: UIViewController?
        
        init(viewController: UIViewController) {
            self.viewController = viewController
        }
        
        func onInitializationComplete() {
        }
    }
    
    class crackleUserRewardListener: CrackleUserRewardListener {
        func onUserRewarded(crackleReward: CrackleReward) {
            print(crackleReward.amount, crackleReward.type)
        }
    }
    
    class crackleAdListener: CrackleAdListener {
        func onAdLoaded() {
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
    }
}

class crackleAdListener: CrackleAdListener {
    func onAdLoaded() {
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

//        CrackleInterstitialAd.shared.setListener(crackleAdListener: )
//        CrackleInterstitialAd.shared.setFrequencyCapping(numberOfAds: 2, timeIntervalInSec: TimeInterval(30*60))
//        startTimer()
//        CrackleInterstitialAd.shared.loadAd()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
//            CrackleInterstitialAd.shared.showAd(viewController: self)
//        })
