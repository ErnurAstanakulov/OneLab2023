//
//  InstrumentView.swift
//  SimpleMVC
//
//  Created by Yernur on 05.04.2023.
//

import UIKit

final class InstrumentView: UIView {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stackView = UIStackView()
    private let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        backgroundColor = .white
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byCharWrapping

        [imageView, titleLabel, descriptionLabel].forEach { stackView.addArrangedSubview($0) }
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
    }
    
    func fullData(with instrument: Instrument) {
        titleLabel.text = instrument.title
        descriptionLabel.text = instrument.description
        imageView.image = UIImage(named: instrument.imageName)
    }
}
