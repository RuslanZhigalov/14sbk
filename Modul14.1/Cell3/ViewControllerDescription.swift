//
//  ViewControllerDescription.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit
class ViewControllerDescription: UIViewController {
    let nameTextDescription: String
    init(nameTextDescription: String) {
        self.nameTextDescription = nameTextDescription
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let defaults = UserDefaults.standard
    let identificatorCellLabelAndImage = "CellLabelVcDescription"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var buttonAddMoney: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        return button
    }()
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var textField2: UITextField = {
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
    private lazy var textViewShedule: UIButton = {
        let button = UIButton()
        button.setTitle("График платежей", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        return button
    }()
    var moneyArr: [String: [Money]] = [:]
    var moneyArrDownload: [Money] = []
    var money = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CellDescription.self, forCellReuseIdentifier: identificatorCellLabelAndImage)
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        view.backgroundColor = .white
        setupConstraints()
    }
    @objc func addMoney (){
        view.addSubview(textField)
        view.addSubview(textField2)
        view.addSubview(viewShow)
        view.addSubview(viewShowButtons)
        textField2.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textField2.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textField.placeholder = "Наименование"
        textField2.placeholder = "Сумма"
        textField2.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardAppearance = .light
        textField.clearButtonMode = .always
        textField.backgroundColor = .white
        textField.becomeFirstResponder()
        viewShow.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewShow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewShow.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewShow.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 0).isActive = true
        viewShowButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        viewShowButtons.heightAnchor.constraint(equalToConstant: 150).isActive = true
        viewShowButtons.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textField2.bottomAnchor.constraint(equalTo: viewShowButtons.topAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: textField2.topAnchor, constant: 0).isActive = true
        let btns = btns()
        viewShowButtons.addSubview(btns)
        btns.topAnchor.constraint(equalTo: viewShowButtons.topAnchor,constant: 10 ).isActive = true
        btns.leftAnchor.constraint(equalTo: viewShowButtons.leftAnchor, constant: 16).isActive = true
        btns.rightAnchor.constraint(equalTo: viewShowButtons.rightAnchor, constant: -16).isActive = true
        btns.addTarget(self, action: #selector(addMoneyShow), for: .touchUpInside)
    }
    @objc func addMoneyShow (){
        textField.removeFromSuperview()
        viewShow.removeFromSuperview()
        textField2.removeFromSuperview()
        viewShowButtons.removeFromSuperview()
        guard let text = textField2.text else{return}
        guard textField.text != "" else{return}
        money -= Int(text) ?? 0
        moneyArrDownload.append(Money(stringTitle: textField.text!, title: Int(text) ?? 0, date: Date()))
        moneyArr[nameTextDescription] = moneyArrDownload
        
        defaults.set(money, forKey: "Money")
        UserProfileDeleteCache.save(moneyArr)
        tableView.reloadData()
    }
    func setupViews() {
        moneyArr = UserProfileDeleteCache.get()
        money = defaults.integer(forKey: "Money")
        moneyArrDownload = moneyArr[nameTextDescription] ?? []
        view.addSubview(textViewShedule)
        view.addSubview(tableView)
        view.addSubview(buttonAddMoney)
        textViewShedule.addTarget(self, action: #selector(addShedule), for: .touchUpInside)
        buttonAddMoney.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
    }
    @objc func addShedule (){
        let vc2 = ViewController2()
        vc2.moneyArr = moneyArrDownload
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func btns() -> UIButton {
        let button = UIButton()
        button.setTitle("Добавить категорию", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }
    
    func setupConstraints() {
        buttonAddMoney.translatesAutoresizingMaskIntoConstraints = false
        buttonAddMoney.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonAddMoney.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonAddMoney.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108).isActive = true
        buttonAddMoney.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        textViewShedule.translatesAutoresizingMaskIntoConstraints = false
        textViewShedule.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        textViewShedule.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        textViewShedule.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textViewShedule.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
    }
}
extension ViewControllerDescription: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moneyArrDownload.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identificatorCellLabelAndImage) as? CellDescription
        
        let viewModel = moneyArrDownload[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}
