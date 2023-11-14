//
//  CellImageAndString.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
class CellLabelAndImage: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 16, y: 24, width: 304, height: 16)
        return label
    }()
    private lazy var label2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 24, width: 304, height: 16)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(label2)
    }
    func configure(_ cell: Money){
        label.text = String(cell.title)
        label2.text = cell.date.formatted()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
