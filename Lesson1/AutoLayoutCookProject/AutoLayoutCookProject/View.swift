//
//  View.swift
//  AutoLayoutCookProject
//
//  Created by Yernur on 12.04.2023.
//

import Foundation
//
//  ParallaxHeaderView.swift
//  ForteApp
//
//  Created by Astanakulov on 2/7/20.
//  Copyright © 2020 DAR Ecosystem. All rights reserved.
//
//
import UIKit
import SnapKit

protocol ForteExMainHeaderViewDelegate: AnyObject {
    func didScrollTrade(with id: Int)
    func didShowTradeAction()
}

final class ForteExMainHeaderView: UIView {
    // MARK: - Properties
    private var currencyPairTraidPOs: [String] = ["1", "2", "3"]
    weak var delegate: ForteExMainHeaderViewDelegate?
    private let purchase = "forte_ex_buy"
    private let sale = "forte_ex_sale"
    
    var selectedItemIndex: Int = 0 {
        didSet {
        }
    }
    
    
    // MARK: - Views
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "main-background")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private lazy var buyLabels = UILabel()
    private lazy var sellLabels = UILabel()
    let lineView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 2, height: 48)))
    
    private lazy var bottomStackView: UIStackView = {
        buyLabels.text = "Продажа"
        sellLabels.text = "Продажа"
        buyLabels.backgroundColor = .clear
        sellLabels.backgroundColor = .clear
        lineView.backgroundColor = .white
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CarouselLayout())
        collectionView.allowsSelection = false
        collectionView.isDirectionalLockEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(
            CarouselCollectionViewCell.self,
            forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseId
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: Values.carouselInset() + Values.carouselCellSize().width,
            bottom: 0,
            right: Values.carouselInset() + Values.carouselCellSize().width
        )
        return collectionView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, timeDoubleLabels])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ForteForex"
        label.font = .cignika(type: .bold, size: 34)
        return label
    }()
    
    private let timeDoubleLabels: UILabel = {
        let labels = UILabel()
        return labels
    }()
    
    private lazy var exchangeCurrencyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(showTradeAction), for: .touchUpInside)
        button.setTitle("Обменять валюту", for: .normal)
        button.setImage(UIImage(named: "success"), for: .normal)
        return button
    }()
    
    private lazy var tradesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(showTradeAction), for: .touchUpInside)
        button.setTitle("Обменятьвалюту", for: .normal)
        let image = UIImage(named: "success")
        button.setImage(image, for: .normal)
//        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.imageView?.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        return button
    }()
    
    private lazy var actionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exchangeCurrencyButton, tradesButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - Inits
    init(delegate: ForteExMainHeaderViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension ForteExMainHeaderView {
    func layoutUI() {
        configureBackgroundView()
        configureTopStackView()
        configureCollectionView()
        configureBottomStackView()
        configureActionsStackView()
    }
    
    func configureBackgroundView() {
        addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureActionsStackView() {
        addSubview(actionStackView)
        actionStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }
    }
    
    func configureBottomStackView() {
        addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
        }
        
        [buyLabels, sellLabels].forEach { bottomStackView.addArrangedSubview($0) }
//        buyLabels.snp.makeConstraints {
//            $0.top.leading.bottom.equalToSuperview()
//            $0.width.equalToSuperview().multipliedBy(0.49)
////        }
//        lineView.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
//        sellLabels.snp.makeConstraints {
//            $0.top.trailing.bottom.equalToSuperview()
//            $0.leading.equalTo(lineView.snp.trailing)
//        }
    }
    
    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            collectionView.delegate = self
            collectionView.dataSource = self
            
            addSubview(collectionView)
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(topStackView.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(104)
            }
        }
    }
    
    func configureTopStackView() {
        addSubview(topStackView)
        topStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview()
        }
    }
    
    func configureCloseTradeState() {
////        tradesButton.flowHeightConstraint?.constant = 76
//        if bottomStackView.superview != nil {
//            bottomStackView.removeFromSuperview()
//        }
//        tradesButton.snp.makeConstraints {
//            $0.top.equalTo(collectionView.snp.bottom).offset(24)
//        }
    }
    
    func configureOpenTradeState() {
//        if tradesButton.superview != nil {
//            tradesButton.removeFromSuperview()
//        }
//        configureBottomStackView()
//        configureActionsStackView()
////        tradesButton.flowHeightConstraint?.constant = 45
    }
    
    @objc private func showTradeAction () {
        delegate?.didShowTradeAction()
    }
}

// MARK: - Collection view dataSource, delegate
extension ForteExMainHeaderView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currencyPairTraidPOs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselCollectionViewCell.reuseId,
            for: indexPath) as? CarouselCollectionViewCell
        else {
            return CarouselCollectionViewCell(frame: .zero)
        }

        cell.backgroundColor = .red
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = getCenterItemIndexPath() else { return }
        
        selectedItemIndex = indexPath.row
        collectionView.reloadData()
    }
    
    // MARK: - Get indexPath of center item in collection view
    private func getCenterItemIndexPath() -> IndexPath? {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return nil }
        return indexPath
    }
}

// MARK: - Collection view flow layout
extension ForteExMainHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.collectionLayoutSize
    }
}

private extension ForteExMainHeaderView {
    enum Constants {
        static let collectionLayoutSize = CGSize(width: 96, height: 108)
    }
}
//
//  CarouselLayout.swift
//  ForteExchange
//
//  Created by Бекдаулет Касымов on 9/17/19.
//  Copyright © 2019 ONE Technologies. All rights reserved.
//

import UIKit

class CarouselLayout: UICollectionViewLayout {
    
    // MARK: - Fields
    override var collectionViewContentSize: CGSize {
        let leftmostEdge = cachedItemsAttributes.values.map { $0.frame.minX }.min() ?? 0
        let rightmostEdge = cachedItemsAttributes.values.map { $0.frame.maxX }.max() ?? 0
        return CGSize(width: rightmostEdge - leftmostEdge, height: itemSize.height)
    }
    
    private var cachedItemsAttributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    
    private var itemSize: CGSize {
        guard let collectionView = collectionView else { return .zero }
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
    
    private let spacing: CGFloat = Values.carouselInteritemOffset()
    
    private let spacingWhenFocused: CGFloat = 1.2 * Values.carouselInteritemOffset()
    
    private var continuousFocusedIndex: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let offset = collectionView.bounds.width / 2 + collectionView.contentOffset.x - itemSize.width / 2
        return offset / (itemSize.width + spacing)
    }
    
    // MARK: - Public methods
    override open func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else { return }
        updateInsets()
        guard cachedItemsAttributes.isEmpty else { return }
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        for item in 0..<itemsCount {
            let indexPath = IndexPath(item: item, section: 0)
            cachedItemsAttributes[indexPath] = createAttributesForItem(at: indexPath)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cachedItemsAttributes
            .map { $0.value }
            .filter { $0.frame.intersects(rect) }
            .map { self.shiftedAttributes(from: $0) }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset) }
        let collectionViewMidX: CGFloat = collectionView.bounds.size.width / 2
        guard let closestAttribute = findClosestAttributes(toXPosition: proposedContentOffset.x + collectionViewMidX)
            else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset) }
        return CGPoint(x: closestAttribute.center.x - collectionViewMidX, y: proposedContentOffset.y)
    }
    
    // MARK: - Invalidate layout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if newBounds.size != collectionView?.bounds.size { cachedItemsAttributes.removeAll() }
        return true
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        if context.invalidateDataSourceCounts { cachedItemsAttributes.removeAll() }
        super.invalidateLayout(with: context)
    }
    
    // MARK: - Items
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = cachedItemsAttributes[indexPath] else { fatalError("No attributes cached") }
        return shiftedAttributes(from: attributes)
    }
    
    // MARK: - Private methods
    private func createAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        guard let collectionView = collectionView else { return nil }
        attributes.frame.size = itemSize
        attributes.frame.origin.y = (collectionView.bounds.height - itemSize.height) / 2
        attributes.frame.origin.x = CGFloat(indexPath.item) * (itemSize.width + spacing)
        return attributes
    }
    
    private func shiftedAttributes(from attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let attributes = attributes.copy() as? UICollectionViewLayoutAttributes else { fatalError("Couldn't copy attributes") }
        let roundedFocusedIndex = round(continuousFocusedIndex)
        guard attributes.indexPath.item != Int(roundedFocusedIndex) else { return attributes }
        let shiftArea = (roundedFocusedIndex - 0.5)...(roundedFocusedIndex + 0.5)
        let distanceToClosestIdentityPoint = min(abs(continuousFocusedIndex - shiftArea.lowerBound), abs(continuousFocusedIndex - shiftArea.upperBound))
        let normalizedShiftFactor = distanceToClosestIdentityPoint * 2
        let translation = (spacingWhenFocused - spacing) * normalizedShiftFactor
        let translationDirection: CGFloat = attributes.indexPath.item < Int(roundedFocusedIndex) ? -1 : 1
        attributes.transform = CGAffineTransform(translationX: translationDirection * translation, y: 0)
        return attributes
    }
    
    // MARK: - Private methods
    private func findClosestAttributes(toXPosition xPosition: CGFloat) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        let searchRect = CGRect(
            x: xPosition - collectionView.bounds.width, y: collectionView.bounds.minY,
            width: collectionView.bounds.width * 2, height: collectionView.bounds.height
        )
        return layoutAttributesForElements(in: searchRect)?.min(by: { abs($0.center.x - xPosition) < abs($1.center.x - xPosition) })
    }
    
    private func updateInsets() {
        guard let collectionView = collectionView else { return }
        collectionView.contentInset.left = (collectionView.bounds.size.width - itemSize.width) / 2
        collectionView.contentInset.right = (collectionView.bounds.size.width - itemSize.width) / 2
    }
}
//
//  Values.swift
//  ForteApp
//
//  Created by Astanakulov on 2/7/20.
//  Copyright © 2020 DAR Ecosystem. All rights reserved.
//


class Screen {
    class func width() -> CGFloat { return UIScreen.main.bounds.width }
    class func height() -> CGFloat { return UIScreen.main.bounds.height }
}

class Values {
    // MARK: - Carousel scales
    class func carouselInset() -> CGFloat { return 24 / 373 * Screen.width() }
    
    class func carouselInteritemOffset() -> CGFloat { return 8 / 373 * Screen.width() }
    
    class func carouselCellSize() -> CGSize {
        let value: CGFloat = 104 / 373 * Screen.width()
        return CGSize(width: value, height: value)
    }
    
    class func carouselCellImageSize() -> CGSize {
        return CGSize(width: carouselCellSize().width * 0.442, height: carouselCellSize().width * 0.442)
    }
    
    class func carouselCellCornerRadius() -> CGFloat { return 7 }

    // MARK: - Offsets
    class func offset() -> CGFloat { return UIScreen.main.bounds.width * 0.042 }
    
    class func smallOffset() -> CGFloat { return UIScreen.main.bounds.width * 0.037 }

    class func largeOffset() -> CGFloat { return UIScreen.main.bounds.width * 0.084 }
    
    class func smallheightOffset() -> CGFloat { return Screen.height() * 0.012 }
    
    class func mediumHeightOffset() -> CGFloat { return Screen.height() * 0.06 }

    // MARK: - rectangle button
    class func mediumHightForRectangleItem() -> CGFloat { return 45 }
}
//
//  ExchangeCollectionViewCell.swift
//  ForteExchange
//
//  Created by Бекдаулет Касымов on 9/10/19.
//  Copyright © 2019 ONE Technologies. All rights reserved.
//


final class CarouselCollectionViewCell: UICollectionViewCell {
    // MARK: - Views
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        imageView.contentMode = UIImageView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private let secondaryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.contentMode = UIImageView.ContentMode.scaleAspectFit
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        clipsToBounds = true
        backgroundColor = .white
        layer.cornerRadius = 16.0
        
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
        mainImageView.image = nil
        secondaryImageView.image = nil
    }
}

// MARK: - layout UI
extension CarouselCollectionViewCell {
    private func layoutUI() {
        insertSubview(secondaryImageView, at: 0)
        secondaryImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(Values.carouselCellImageSize().width / 2 - 8)
            $0.top.equalToSuperview().offset(12)
            $0.height.equalTo(46)
        }
        
        insertSubview(mainImageView, at: 1)
        mainImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-Values.carouselCellImageSize().width / 2 + 8)
            $0.top.equalToSuperview().offset(12)
            $0.height.equalTo(46)
        }
        
        addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainImageView.snp.bottom).offset(12)
        }
    }
}
// MARK: - reusable identifier
extension CarouselCollectionViewCell {
    class var reuseId: String { return String(describing: self) }
}
