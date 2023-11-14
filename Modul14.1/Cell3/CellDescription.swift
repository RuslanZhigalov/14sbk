//
//  CellDescription.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
class CellDescription: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var label3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        strConstr()
    }
    func strConstr(){
        
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        label.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
        label.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 3).isActive = true
        label2.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 0).isActive = true
        label2.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 3).isActive = true
        label2.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
        label3.leftAnchor.constraint(equalTo: label2.rightAnchor, constant: 0).isActive = true
        
        label3.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
    }
    func configure(_ cell: Money){
        label.text = cell.stringTitle
        label2.text = cell.date.description
        label3.text = cell.title.formatted()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
