//
//  TableViewCellLabel.swift
//  Modul14.1
//
//  Created by Катерина Родионова on 18.12.2022.
//

import UIKit

class CellLabelAndImageView: UITableViewCell {
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
    }
    func configure(_ cell: Contry){
        image.image = cell.image
        label.text = cell.title
    }
    private func constraint(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
