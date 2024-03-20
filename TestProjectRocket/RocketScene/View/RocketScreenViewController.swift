//
//  RocketScreenViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit
import SDWebImage
import Swinject

class RocketScreenViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: RocketScreenViewModelProtocol!
    var rocketCell: RocketViewCell!
    private var textColor: UIColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rocketCell = RocketViewCell()
        viewModel = Container.rocket.resolve(RocketScreenViewModelProtocol.self)
        setupActions()
        setupView()
        constraints()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentViewUI()
    }
    
    // MARK: - Views
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let gearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let launchesButton: UIButton = {
        let button = UIButton()
        button.setTitle("View Launches", for: .normal)
        button.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 0
        pc.tintColor = .white
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .white
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private let pageControlBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rocketImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var rocketNameLabel = label(text: "", textColor: .white, textAlignment: .left, UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstLaunchLabel = label(text: "First launch", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var launchLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var countryLabel = label(text: "Country", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var whatCountryLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var costLabel = label(text: "Launch cost", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var priceLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var firstStageLabel = label(text: "FIRST STAGE", textColor: .white, textAlignment: .left, UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var secondStageLabel = label(text: "SECOND STAGE", textColor: .white, textAlignment: .left, UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var numberOfEnginesLabel = label(text: "Number of engines", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var enginesLabel = label(text: "", textColor: .white, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var amountOfFuelinTonsLabel = label(text: "Amount of fuel in tons", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var amountOfFuelinLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var burnTimeInSecondsLabel = label(text: "Burn time in sec", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var burnTimeLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondNumberOfEnginesLabel = label(text: "Number of engines", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondNumberLabel = label(text: "", textColor: .white, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondAmountOfFuelinTonsLabel = label(text: "Amount of fuel in tons", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondAmountOfFuelinLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondBurnTimeInSecondsLabel = label(text: "Burn time in sec", textColor: textColor, textAlignment: .left, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var secondBurnTimeLabel = label(text: "", textColor: .white, textAlignment: .right, UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    // MARK: - Constraints and setupUI
    
    private func setupView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        view.backgroundColor = .black
        view.addSubview(scrollView)
        view.addSubview(pageControlBackgroundView)
        pageControlBackgroundView.addSubview(pageControl)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(contentView)
        rocketCell.translatesAutoresizingMaskIntoConstraints = false
        [rocketNameLabel, rocketCell, firstLaunchLabel, countryLabel, costLabel, firstStageLabel, numberOfEnginesLabel, amountOfFuelinTonsLabel, burnTimeInSecondsLabel, secondStageLabel, secondNumberOfEnginesLabel, secondAmountOfFuelinTonsLabel, secondBurnTimeInSecondsLabel, launchLabel, priceLabel, whatCountryLabel, enginesLabel, amountOfFuelinLabel, burnTimeLabel, secondNumberLabel, secondBurnTimeLabel, secondAmountOfFuelinLabel, gearButton, launchesButton
        ].forEach(contentView.addSubview)
    }
    
    private func constraints() {
        let labelsWithLeading = [firstLaunchLabel, firstStageLabel, countryLabel, costLabel, numberOfEnginesLabel, amountOfFuelinTonsLabel, burnTimeInSecondsLabel, secondStageLabel, secondNumberOfEnginesLabel, secondAmountOfFuelinTonsLabel, secondBurnTimeInSecondsLabel]
        
        let labelsWithTrailing = [launchLabel, whatCountryLabel, priceLabel, enginesLabel, amountOfFuelinLabel, burnTimeLabel, secondNumberLabel, secondAmountOfFuelinLabel, secondBurnTimeLabel]
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControlBackgroundView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(55)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(pageControlBackgroundView.snp.bottom).offset(-15)
            make.centerX.equalTo(pageControlBackgroundView.snp.centerX)
        }
        rocketImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(320)
            make.width.equalTo(scrollView.snp.width)
        }
        contentView.snp.makeConstraints { make in
            make.top.equalTo(rocketImageView.snp.bottom).offset(-55)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1000)
        }
        rocketNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(40)
        }
        gearButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.width.equalTo(20)
        }
        launchesButton.snp.makeConstraints { make in
            make.top.equalTo(secondBurnTimeInSecondsLabel.snp.bottom).offset(25)
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        rocketCell.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(110)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(110)
        }
        labelsWithLeading.forEach { label in
            label.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(40)
            }
        }
        labelsWithTrailing.forEach { label in
            label.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-40)
            }
        }
        firstLaunchLabel.snp.makeConstraints { make in
            make.top.equalTo(rocketCell.snp.bottom).offset(25)
        }
        launchLabel.snp.makeConstraints { make in
            make.top.equalTo(rocketCell.snp.bottom).offset(25)
        }
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLaunchLabel.snp.bottom).offset(25)
        }
        whatCountryLabel.snp.makeConstraints { make in
            make.top.equalTo(launchLabel.snp.bottom).offset(25)
        }
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(countryLabel.snp.bottom).offset(25)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(whatCountryLabel.snp.bottom).offset(25)
        }
        firstStageLabel.snp.makeConstraints { make in
            make.top.equalTo(costLabel.snp.bottom).offset(50)
        }
        numberOfEnginesLabel.snp.makeConstraints { make in
            make.top.equalTo(firstStageLabel.snp.bottom).offset(25)
        }
        enginesLabel.snp.makeConstraints { make in
            make.top.equalTo(firstStageLabel.snp.bottom).offset(25)
        }
        amountOfFuelinTonsLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfEnginesLabel.snp.bottom).offset(25)
        }
        amountOfFuelinLabel.snp.makeConstraints { make in
            make.top.equalTo(enginesLabel.snp.bottom).offset(25)
        }
        burnTimeInSecondsLabel.snp.makeConstraints { make in
            make.top.equalTo(amountOfFuelinTonsLabel.snp.bottom).offset(25)
        }
        burnTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(amountOfFuelinLabel.snp.bottom).offset(25)
        }
        secondStageLabel.snp.makeConstraints { make in
            make.top.equalTo(burnTimeInSecondsLabel.snp.bottom).offset(50)
        }
        secondNumberOfEnginesLabel.snp.makeConstraints { make in
            make.top.equalTo(secondStageLabel.snp.bottom).offset(25)
        }
        secondNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(secondStageLabel.snp.bottom).offset(25)
        }
        secondAmountOfFuelinTonsLabel.snp.makeConstraints { make in
            make.top.equalTo(secondNumberOfEnginesLabel.snp.bottom).offset(25)
        }
        secondAmountOfFuelinLabel.snp.makeConstraints { make in
            make.top.equalTo(secondNumberLabel.snp.bottom).offset(25)
        }
        secondBurnTimeInSecondsLabel.snp.makeConstraints { make in
            make.top.equalTo(secondAmountOfFuelinTonsLabel.snp.bottom).offset(25)
        }
        secondBurnTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(secondAmountOfFuelinLabel.snp.bottom).offset(25)
        }
    }
    
    private func contentViewUI() {
        let path = UIBezierPath(roundedRect: contentView.bounds,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 30.0, height: 30.0))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        contentView.layer.mask = maskLayer
    }
    
    private func setupUI(for currentPage: Int) {
        
        guard viewModel.rocketData.indices.contains(currentPage) else { return }
        let currentRocket = viewModel.rocketData[currentPage]
        rocketCell.configure(with: currentRocket)
        rocketNameLabel.text = currentRocket.name
        launchLabel.text = currentRocket.firstFlight
        whatCountryLabel.text = currentRocket.country
        enginesLabel.text = "\(currentRocket.firstStage.engines)"
        secondNumberLabel.text = "\(currentRocket.secondStage.engines)"
        amountOfFuelinLabel.text = "\(currentRocket.firstStage.fuelAmountTons) ton"
        secondAmountOfFuelinLabel.text = "\(currentRocket.secondStage.fuelAmountTons) ton"
        burnTimeLabel.text = "\(currentRocket.firstStage.burnTimeSEC ?? 0) sec"
        secondBurnTimeLabel.text = "\(currentRocket.secondStage.burnTimeSEC ?? 0) sec"
        let costInMillions = Double(currentRocket.costPerLaunch) / 1_000_000
        
        if floor(costInMillions) == costInMillions {
            priceLabel.text = "$\(Int(costInMillions))mln"
        } else {
            priceLabel.text = "$\(String(format: "%.1f", costInMillions))mln"
        }
        
        if !currentRocket.flickrImages.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(currentRocket.flickrImages.count)))
            let urlString = currentRocket.flickrImages[randomIndex]
            if let url = URL(string: urlString) {
                rocketImageView.sd_setImage(with: url)
            }
        }
    }
    
    private func fetchData() {
        Task {
            await viewModel.getRocketData()
            setupUI(for: 0)
            pageControl.numberOfPages = viewModel.rocketData.count
        }
    }
    
    //MARK: - Buttons and preset
    private func setupActions() {
        launchesButton.addTarget(self, action: #selector(launchesButtonTapped), for: .touchUpInside)
        gearButton.addTarget(self, action: #selector(gearButtonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
    }
    
    func openLaunchVC(serialNumber: Int) {
        guard viewModel.rocketData.indices.contains(serialNumber) else { return }
        let rocket = viewModel.rocketData[serialNumber]
        
        let launchVC = LaunchViewController()
        launchVC.rocketID = rocket.id
        launchVC.rocketName = rocket.name
        launchVC.title = rocket.name
        navigationController?.pushViewController(launchVC, animated: true)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        setupUI(for: sender.currentPage)
    }
    
    @objc func launchesButtonTapped() {
        openLaunchVC(serialNumber: pageControl.currentPage)
        
    }
    
    @objc private func gearButtonTapped() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = rocketCell
        let sheet = settingsVC.sheetPresentationController
        sheet?.detents = [.large()]
        sheet?.preferredCornerRadius = 25
        present(settingsVC, animated: true, completion: nil)
    }
    
    //MARK: - Preset for label
    private func label(text: String, textColor: UIColor, textAlignment: NSTextAlignment, _ uiFont: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = uiFont
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

