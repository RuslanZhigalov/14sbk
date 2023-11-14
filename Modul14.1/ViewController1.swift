//
//  ViewController.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
class ViewController1: UIViewController {
    var money = 0
    let defaults = UserDefaults.standard
    var datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    let identificatorCellLabelAndImage = "CellLabelAndImage"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var textViewCurrentMoney: UILabel = {
        let text = UILabel()
        text.text = "Текущий баланс"
        text.textAlignment = .left
        text.textColor = .black
        text.backgroundColor = .white
        return text
    }()
    private lazy var buttonAddMoney: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить доход", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        return button
    }()
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var viewShow: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.opacity = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewShowButtons: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var textViewAllMoney: UILabel = {
        let text = UILabel()
        text.text = String(money)
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        text.textAlignment = .right
        text.backgroundColor = .white
        return text
    }()
    private lazy var textViewMoney: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        text.text = "Доходы"
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        text.textColor = .black
        text.backgroundColor = .white
        return text
    }()
    var moneyArr: [Money] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CellLabelAndImage.self, forCellReuseIdentifier: identificatorCellLabelAndImage)
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        view.backgroundColor = .white
        setupConstraints()
    }
    @objc func addMoney (){
        view.addSubview(textField)
        view.addSubview(viewShow)
        view.addSubview(viewShowButtons)
        textField.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textField.placeholder = "Cумма"
        textField.borderStyle = .roundedRect
        textField.keyboardAppearance = .light
        textField.clearButtonMode = .always
        textField.backgroundColor = .white
        textField.frame = CGRect(x: 0, y: 0, width: 304, height: 13)
        textField.becomeFirstResponder()
        viewShow.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewShow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewShow.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewShow.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 0).isActive = true
        viewShowButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290).isActive = true
        viewShowButtons.heightAnchor.constraint(equalToConstant: 64).isActive = true
        viewShowButtons.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textField.bottomAnchor.constraint(equalTo: viewShowButtons.topAnchor, constant: 0).isActive = true
        let btns = btns()
        viewShowButtons.addSubview(btns)
        viewShowButtons.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.rightAnchor.constraint(equalTo: viewShowButtons.rightAnchor, constant: -16).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 48).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 30).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: viewShowButtons.bottomAnchor, constant: -10).isActive = true
        btns.bottomAnchor.constraint(equalTo: viewShowButtons.bottomAnchor,constant: -10 ).isActive = true
        btns.leftAnchor.constraint(equalTo: viewShowButtons.leftAnchor, constant: 16).isActive = true
        btns.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 30).isActive = true
        btns.addTarget(self, action: #selector(addMoneyShow), for: .touchUpInside)
    }
    @objc func addMoneyShow (){
        textField.removeFromSuperview()
        viewShow.removeFromSuperview()
        viewShowButtons.removeFromSuperview()
        guard let txt = Int(textField.text ?? "0") else{return}
        moneyArr.append(Money(stringTitle: "", title: txt, date: datePicker.date))
        money += txt
        textViewAllMoney.text = String(money)
        UserProfileCache.save(moneyArr)
        defaults.set(money, forKey: "Money")
        tableView.reloadData()
    }
    func setupViews() {
        datePicker.datePickerMode = .date
        moneyArr = UserProfileCache.get()
        money = defaults.integer(forKey: "Money")
        view.addSubview(textViewCurrentMoney)
        view.addSubview(textViewAllMoney)
        view.addSubview(textViewMoney)
        view.addSubview(tableView)
        view.addSubview(buttonAddMoney)
        buttonAddMoney.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
    }
    func btns() -> UIButton {
        let button = UIButton()
        button.setTitle("Добавить доход", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }
    func setupConstraints() {
        buttonAddMoney.translatesAutoresizingMaskIntoConstraints = false
        buttonAddMoney.heightAnchor.constraint(equalToConstant: 48).isActive = true
        buttonAddMoney.widthAnchor.constraint(equalToConstant: 344).isActive = true
        buttonAddMoney.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108).isActive = true
        buttonAddMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        textViewCurrentMoney.translatesAutoresizingMaskIntoConstraints = false
        textViewCurrentMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        textViewCurrentMoney.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textViewCurrentMoney.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 16).isActive = true
        textViewCurrentMoney.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        textViewMoney.translatesAutoresizingMaskIntoConstraints = false
        textViewMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        textViewMoney.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        textViewMoney.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textViewMoney.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
        textViewAllMoney.translatesAutoresizingMaskIntoConstraints = false
        textViewAllMoney.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        textViewAllMoney.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textViewAllMoney.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        textViewAllMoney.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
    }
}
extension ViewController1: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moneyArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identificatorCellLabelAndImage) as? CellLabelAndImage
        let viewModel = moneyArr[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}

