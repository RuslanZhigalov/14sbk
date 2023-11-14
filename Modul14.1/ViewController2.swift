//
//  ViewController2.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
import SwiftUI

class ViewController2: UIViewController {
    var moneyArr = UserProfileCache.get()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    func setupView() {
        let savingViewController = UIHostingController(rootView: SavingCharts(data1: moneyArr ?? []))
        guard let savingView = savingViewController.view else { return }
        view.addSubview(savingView)
        savingView.translatesAutoresizingMaskIntoConstraints = false
        savingView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        savingView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height / 2) - 75).isActive = true
        savingView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: -100).isActive = true
        savingView.heightAnchor.constraint(equalToConstant: 300).isActive = false
        
    }
}
