//
//  ViewController.swift
//  GoogleAdmob-Swift4
//
//  Created by MAC on 08/03/18.
//  Copyright © 2018 vishal. All rights reserved.
//

import UIKit
import GoogleMobileAds
class ViewController: UIViewController , GADBannerViewDelegate , GADRewardBasedVideoAdDelegate{
    
   
    
    var interstitial: GADInterstitial!
    var rewardBaseAds:GADRewardBasedVideoAd!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    // App ID
    // ca-app-pub-9757359219487544~5385230180
    // Unit ID
    // ca-app-pub-9757359219487544/1290497534
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bannerView.adUnitID = "ca-app-pub-9757359219487544/1290497534"
//        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-9757359219487544/2969233119"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-9757359219487544/7747615747")
        let request = GADRequest()
        interstitial.load(request)
        
        
        rewardBaseAds = GADRewardBasedVideoAd.sharedInstance()
        rewardBaseAds.delegate = self
        rewardBaseAds.load(GADRequest(), withAdUnitID: "ca-app-pub-9757359219487544/5448755463")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.isHidden = false
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before dismissing a full screen view.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just after dismissing a full screen view.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before the application will background or terminate because the user clicked on an
    // ad that will launch another application (such as the App Store).
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Interstitial ADS
    @IBAction func InterstitialButtonClick(_ sender: UIButton) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    // Reward
    @IBAction func rewardVideoButtonClick(_ sender: Any) {
        if rewardBaseAds.isReady {
            rewardBaseAds.present(fromRootViewController: self)
        }
    }
    
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }
    

}

