//
//  CardSelectionVC.swift
//  CardWorkoutProgrammatic
//
//  Created by Garvit Kaushik on 04/04/24.
//

import UIKit
import CrackleSDK
import testSDKGarvit

class CardSelectionVC: UIViewController {
    let bannerButton = CWButton(backgroundColor: .systemRed, title: "banner")
    let intButton = CWButton(backgroundColor: .systemBlue, title: "Interstitial")
    let rewButton = CWButton(backgroundColor: .systemBlue, title: "Rewarded")
    let rewIntButton = CWButton(backgroundColor: .systemBlue, title: "Rewarded Int")
    let natButton = CWButton(backgroundColor: .systemGreen, title: "Native")
    
    let adSpace = UIView()
    
    var crackleAdLoader: CrackleAdLoader!
    var crackleAdListener: CrackleAdListener!

    override func viewDidLoad() {
        super.viewDidLoad()
        let testSDK1 = testSDK()
        testSDK1.logger_public()
        view.backgroundColor = .systemBackground
        CrackleSDK.shared.initialize(viewController: self){}
        crackleAdListener = CrackleAdListenerClass()
        CrackleInterstitialAd.setListener(crackleAdListener: crackleAdListener)
        CrackleRewardedAd.setListener(crackleAdListener: crackleAdListener)
        CrackleRewardedInterstitialAd.setListener(crackleAdListener: crackleAdListener)
        crackleAdLoader = CrackleAdLoader.Builder(viewController: self, adUnitId: "").forNativeAd(callback: {crackleNativeAd in
            let nativeAdView = Bundle.main.loadNibNamed("UnifiedNativeAdView", owner: nil, options: nil)?.first as! CrackleNativeAdView
            nativeAdView.registerNativeAd(crackleNativeAd: crackleNativeAd)
            (nativeAdView.headlineView as? UILabel)?.text = crackleNativeAd.headline
            (nativeAdView.bodyView as? UILabel)?.text = crackleNativeAd.body
            (nativeAdView.callToActionView as? UIButton)?.setTitle(crackleNativeAd.callToAction, for: .normal)
            (nativeAdView.iconView as? UIImageView)?.image = crackleNativeAd.iconDrawable
            (nativeAdView.storeView as? UILabel)?.text = crackleNativeAd.store
//            (nativeAdView.priceView as? UILabel)?.text = crackleNativeAd.price
//            (nativeAdView.advertiserView as? UILabel)?.text = crackleNativeAd.advertiser
            nativeAdView.callToActionView?.isUserInteractionEnabled = false
            nativeAdView.translatesAutoresizingMaskIntoConstraints = false
            self.adSpace.addSubview(nativeAdView)
            NSLayoutConstraint.activate([
                nativeAdView.centerXAnchor.constraint(equalTo: self.adSpace.centerXAnchor),
                nativeAdView.topAnchor.constraint(equalTo: self.adSpace.safeAreaLayoutGuide.topAnchor),
                nativeAdView.widthAnchor.constraint(equalToConstant: 320),
                nativeAdView.heightAnchor.constraint(equalToConstant: 50)
            ])
        }).build()
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
        if(CrackleInterstitialAd.isReady()) {
            CrackleInterstitialAd.showAd()
        } else {
            CrackleInterstitialAd.loadAd()
        }
    }
    
    @objc func loadRew() {
        if(CrackleRewardedAd.isReady()) {
            CrackleRewardedAd.showAd(crackleUserRewardListener: crackleUserRewardListener())
        } else {
            CrackleRewardedAd.loadAd()
        }
    }
    
    @objc func loadRewInt() {
        if(CrackleRewardedInterstitialAd.isReady()) {
            CrackleRewardedInterstitialAd.showAd(listener: crackleUserRewardListener())
        } else {
            CrackleRewardedInterstitialAd.loadAd()
        }
    }
    
    @objc func loadNative() {
        crackleAdLoader.loadAd()
    }
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
            Toast.show(message: "reward amount \(crackleReward.amount)")
        }
    }
    
    class CrackleAdListenerClass: CrackleAdListener {
        func onAdLoaded() {
            print("Full screen onAdLoaded")
        }
        
        func onAdFailedToLoad(adsError: AdsError) {
            print("Full screen onAdFailedToLoad")
            print(adsError.message)
        }
        
        func onAdFailedToShow(adsError: AdsError) {
            print("Full screen onAdFailedToShow")
            print(adsError.message)
        }
        
        func onAdDisplayed() {
            print("Full screen onAdDisplayed")
        }
        
        func onAdDismissed() {
            print("Full screen onAdDismissed")
        }
        
        func onAdClicked() {
            print("Full screen onAdClicked")
        }
    }
}
class Toast {
    static func show(message: String, duration: TimeInterval = 3.0) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLabel = UILabel(frame: CGRect(x: window.frame.size.width / 2 - 150, y: window.frame.size.height - 100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Regular", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        window.addSubview(toastLabel)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

