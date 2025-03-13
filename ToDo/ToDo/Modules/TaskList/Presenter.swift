//
//  Presenter.swift
//  ToDo
//
//  Created by Денис Ефименков on 13.03.2025.
//

import Foundation

protocol TaskListPresenterProtocol {
    func viewDidLoad()
    func didSelectTask(_ task: Task)
    func deleteTask(_ task: Task)
    func searchTask(by text: String)
    func didFetchTasks(_ tasks: [Task])
    func didDeleteTask(_ task: Task)
    func didTapAddButton()
    func updateTastStatus(_ task: Task, isCompleted: Bool)
}

class TaskListPresenter: TaskListPresenterProtocol {
    
    var interactor: TaskListInteractorProtocol!
    var router: TaskListRouterProtocol!
    weak var view: TaskListViewProtocol!
    
    func deleteTask(_ task: Task) {
        <#code#>
    }
    
    func searchTask(by text: String) {
        <#code#>
    }
    
    func didFetchTasks(_ tasks: [Task]) {
        <#code#>
    }
    
    func didDeleteTask(_ task: Task) {
        <#code#>
    }
    
    func didTapAddButton() {
        <#code#>
    }
    
    func updateTastStatus(_ task: Task, isCompleted: Bool) {
        <#code#>
    }
    

    
    func viewDidLoad() {
        interactor.fetchTasks()
    }
    
    func didSelectTask(_ task: Task) {
        router.navigateToTaskDetail(task)
    }
}
