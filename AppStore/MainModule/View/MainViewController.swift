//
//  MainViewController.swift
//  AppStore
//
//  Created by Эмир Кармышев on 19.10.22.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay

class MainViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = MainViewModel()
    
    private lazy var givingShine: UIImageView = {
        let view = UIImageView(image: UIImage(named: "shine"))
        return view
    }()
    
    private lazy var orderTableView: UITableView = {
        let view = UITableView()
        view.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        view.layer.borderColor = UIColor.gray.cgColor
        view.rowHeight = 83
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableData()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.didGetOrderList()
        orderTableView.reloadData()
    }
    
    private func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(givingShine)
        view.addSubview(orderTableView)
        
        givingShine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(22)
        }
        
        orderTableView.snp.makeConstraints { make in
            make.top.equalTo(givingShine.snp.bottom).offset(19)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-42)
        }
    }
        private func bindTableData() {
            orderTableView.delegate = self
            orderTableView.dataSource = self
        }
    }
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = orderTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        tableViewCell.firstTitleLabel.text = "\(viewModel.list.value[indexPath.row].name ?? "gg")"
        tableViewCell.secondTitleLabel.text = "\(viewModel.list.value[indexPath.row].fromWhere ?? "afas") - \(viewModel.list.value[indexPath.row].toWhere ?? "asdaf")"
        return tableViewCell
    }
    
    
}
