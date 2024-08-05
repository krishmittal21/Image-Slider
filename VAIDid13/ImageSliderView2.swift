//
//  ImageSliderView2.swift
//  VAIDid13
//
//  Created by Krish Mittal on 05/08/24.
//

import UIKit

class ImageSliderView2: UIView {
    private var sliderPosition: CGFloat = 0
    private let beforeImage: UIImageView
    private let afterImage: UIImageView
    private let sliderLine: UIView
    private let sliderHandle: UIView
    
    override init(frame: CGRect) {
        beforeImage = UIImageView(image: UIImage(named: "before"))
        afterImage = UIImageView(image: UIImage(named: "after"))
        sliderLine = UIView()
        sliderHandle = UIView()
        
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        beforeImage.contentMode = .scaleAspectFit
        afterImage.contentMode = .scaleAspectFit
        
        sliderLine.backgroundColor = .white
        
        sliderHandle.backgroundColor = .white
        sliderHandle.layer.cornerRadius = 15
        
        addSubview(beforeImage)
        addSubview(afterImage)
        addSubview(sliderLine)
        addSubview(sliderHandle)
    }
    
    private func setupConstraints() {
        beforeImage.translatesAutoresizingMaskIntoConstraints = false
        afterImage.translatesAutoresizingMaskIntoConstraints = false
        sliderLine.translatesAutoresizingMaskIntoConstraints = false
        sliderHandle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            beforeImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            beforeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            beforeImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            beforeImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            afterImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            afterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            afterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            afterImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sliderLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            sliderLine.topAnchor.constraint(equalTo: topAnchor),
            sliderLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            sliderLine.widthAnchor.constraint(equalToConstant: 4),
            
            sliderHandle.centerXAnchor.constraint(equalTo: sliderLine.centerXAnchor),
            sliderHandle.centerYAnchor.constraint(equalTo: centerYAnchor),
            sliderHandle.widthAnchor.constraint(equalToConstant: 30),
            sliderHandle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let newPosition = sliderPosition + translation.x
        sliderPosition = min(max(newPosition, -bounds.width / 2), bounds.width / 2)
        
        updateSliderPosition()
        gesture.setTranslation(.zero, in: self)
    }
    
    private func updateSliderPosition() {
        sliderLine.transform = CGAffineTransform(translationX: sliderPosition, y: 0)
        sliderHandle.transform = CGAffineTransform(translationX: sliderPosition, y: 0)
        
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: bounds.width / 2 + sliderPosition, y: 0, width: bounds.width / 2 - sliderPosition, height: bounds.height)
        maskLayer.backgroundColor = UIColor.black.cgColor
        afterImage.layer.mask = maskLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSliderPosition()
    }
}

#Preview {
    ImageSliderView2()
}
