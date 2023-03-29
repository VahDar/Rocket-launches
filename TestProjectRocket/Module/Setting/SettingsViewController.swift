//
//  SettingsViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 29.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    private var tableView = UITableView()
    private lazy var dataSource = makeDataSource()
    var presenter: SettingsPresenter! {
        didSet {
            presenter.present = present
  
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        configureLayout()
        configureTableView()
    }
}

private extension SettingsViewController {
    func present(settings: [Setting]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, Setting>()
        snapshot.appendSections([""])
        snapshot.appendItems(settings, toSection: "")
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureTableView() {
        
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<String, Setting> {
        .init(tableView: tableView) { [weak self] tableView, indexPath, setting in
            guard let self,
                let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: setting, settingChanged: self.presenter.change)
            return cell
        }
    }
}


private extension SettingsViewController {
    func addSubview() {
        [tableView].forEach(view.addSubview)
    }
    
    func configureLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
