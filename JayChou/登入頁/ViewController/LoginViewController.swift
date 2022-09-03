//
//  LoginViewController.swift
//  JayChouMusicApp
//
//  Created by 黃柏嘉 on 2022/8/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var sliderImageCollection: UICollectionView!
    @IBOutlet weak var shadowView: UIView!
    
    
    private let collectionCellIdentifier = "sliderCell"
    
    internal let viewModel = LoginViewModel()
    
    private var scrollIndex = 0
    
    private var timer:Timer?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginView()
        initCollection()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(executeAutoScroll), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        timer = nil
    }
    
    private func initLoginView(){
        let backViewGradientLayer = CAGradientLayer()
        backViewGradientLayer.frame = shadowView.frame
        backViewGradientLayer.colors = [UIColor.themeBlack.cgColor,UIColor.clear.cgColor]
        backViewGradientLayer.locations = [0,0.1]
        
        shadowView.layer.addSublayer(backViewGradientLayer)
    }
    
    private func initCollection(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = sliderImageCollection.bounds.size
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        
        sliderImageCollection.collectionViewLayout = collectionViewLayout
        
        sliderImageCollection.dataSource = self
        sliderImageCollection.delegate = self
        
        sliderImageCollection.register(UINib(nibName: "\(SliderCell.self)", bundle: nil), forCellWithReuseIdentifier: collectionCellIdentifier)
    }
 
    @objc private func executeAutoScroll(){
        scrollIndex += 1
        
        if scrollIndex == viewModel.sliderImages.count{
            scrollIndex = 0
            sliderImageCollection.scrollToItem(at: IndexPath(row: scrollIndex, section: 0), at: .centeredHorizontally, animated: false)
            executeAutoScroll()
        }
        sliderImageCollection.scrollToItem(at: IndexPath(row: scrollIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
   
}

extension LoginViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as? SliderCell else { return UICollectionViewCell() }
        
        cell.configureCell(viewModel.sliderImages[indexPath.row])
        
        return cell
    }
}
