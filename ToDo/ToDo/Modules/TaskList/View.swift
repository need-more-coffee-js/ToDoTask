//
//  View.swift
//  ToDo
//
//  Created by Денис Ефименков on 13.03.2025.
//

import UIKit
import SnapKit

protocol TaskListViewProtocol: AnyObject {
    func showTask(_ task: [Todo])
    func removeTask(_ task: [Todo])
    func showError(_ message: Todo)
}

class TaskListView: UIViewController, TaskListViewProtocol {
    
    var presenter: TaskListPresenterProtocol!
    private var tasks: [Todo] = []
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search task"
        searchBar.delegate = self
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addButtonTapped() {
        presenter.didTapAddButton()
    }
    
    func showTask(_ task: [Todo]) {
        self.tasks = task
        tableView.reloadData()
    }
    
    func removeTask(_ task: [Todo]) {
        if let index = task.firstIndex(where: { $0.id == task.id }) {
            task.remove(at: index)
            tableView.reloadData()
        }
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
    }
}

extension TaskListView: UITableViewDataSource, UITabBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks[indexPath.row]
        
    }
}
