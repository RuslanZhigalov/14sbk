//
//  ViewController3.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//
import UIKit

class ViewController3: UIViewController {
    let defaults = UserDefaults.standard
    let identificatorCellLabelAndImage = "CellLabelVC3"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var buttonAddMoney: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить категорию расход", for: .normal)
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
    private lazy var textViewMoney: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        text.text = "Расходы"
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        text.textColor = .black
        text.backgroundColor = .white
        return text
    }()
    var moneyArr: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CellLabelVC3.self, forCellReuseIdentifier: identificatorCellLabelAndImage)
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
        textField.placeholder = "Категория"
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
        viewShowButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true
        viewShowButtons.heightAnchor.constraint(equalToConstant: 64).isActive = true
        viewShowButtons.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        textField.bottomAnchor.constraint(equalTo: viewShowButtons.topAnchor, constant: 0).isActive = true
        let btns = btns()
        viewShowButtons.addSubview(btns)
        btns.bottomAnchor.constraint(equalTo: viewShowButtons.bottomAnchor,constant: -10 ).isActive = true
        btns.leftAnchor.constraint(equalTo: viewShowButtons.leftAnchor, constant: 16).isActive = true
        btns.rightAnchor.constraint(equalTo: viewShowButtons.rightAnchor, constant: -16).isActive = true
        btns.addTarget(self, action: #selector(addMoneyShow), for: .touchUpInside)
    }
    @objc func addMoneyShow (){
        textField.removeFromSuperview()
        viewShow.removeFromSuperview()
        viewShowButtons.removeFromSuperview()
        guard textField.text != "" else{return}
        moneyArr.append(textField.text!)
        defaults.set(moneyArr, forKey: "MoneyVC3")
        tableView.reloadData()
    }
    func setupViews() {
        moneyArr = defaults.array(forKey: "MoneyVC3") ?? []
        view.addSubview(textViewMoney)
        view.addSubview(tableView)
        view.addSubview(buttonAddMoney)
        buttonAddMoney.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
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
        buttonAddMoney.heightAnchor.constraint(equalToConstant: 48).isActive = true
        buttonAddMoney.widthAnchor.constraint(equalToConstant: 344).isActive = true
        buttonAddMoney.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108).isActive = true
        buttonAddMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        textViewMoney.translatesAutoresizingMaskIntoConstraints = false
        textViewMoney.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        textViewMoney.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        textViewMoney.heightAnchor.constraint(equalToConstant: 64).isActive = true
        textViewMoney.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
    }
}
extension ViewController3: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moneyArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identificatorCellLabelAndImage) as? CellLabelVC3
        let viewModel = moneyArr[indexPath.row]
        cell?.configure(viewModel as! String)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc1 = ViewControllerDescription(nameTextDescription: moneyArr[indexPath.row] as! String)
        navigationController?.pushViewController(vc1, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}

