//
//  ExperienceMapDetailView.swift
//  Experiences
//
//  Created by Marlon Raskin on 10/5/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class ExperienceMapDetailView: UIView {

    private lazy var dateFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateStyle = .short
        result.timeStyle = .short
        return result
    }()

    private let dateLabel = UILabel()

    var experience: ExperienceTemp? {
        didSet {
            updateSubviews()
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        dateLabel.setContentHuggingPriority(.defaultLow+1, for: .horizontal)

        let labelStackView = UIStackView(arrangedSubviews: [dateLabel])
        labelStackView.spacing = UIStackView.spacingUseSystem
        labelStackView.axis = .vertical

        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelStackView)
        labelStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        labelStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func updateSubviews() {
        guard let experience = experience else { return }
        dateLabel.text = dateFormatter.string(from: experience.timestamp)
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .secondaryLabel
    }
}
