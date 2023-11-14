//
//  VC3Cell.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 28.05.2023.
//
import UIKit
class CellLabelVC3: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var label2: UIButton = {
        let label = UIButton()
        label.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(label2)
        strConstr()
    }
    func strConstr(){
        label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        label2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        label2.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: label2.leftAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
    }
    func configure(_ cell: String){
        label.text = cell
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
