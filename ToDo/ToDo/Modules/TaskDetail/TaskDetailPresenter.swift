//
//  TaskDetailPresenter.swift
//  ToDo
//
//  Created by Денис Ефименков on 13.03.2025.
//

import Foundation

protocol TaskDetailPresenterProtocol {
    func viewDidLoad()
    func saveTask(title: String, description: String, isCompleted: Bool)
    func didFetchTask(_ task: TaskList)
    func didSaveTask(_ task: TaskList)
}

class TaskDetailPresenter: TaskDetailPresenterProtocol {
    weak var view: TaskDetailViewProtocol!
    var interactor: TaskDetailInteractorProtocol!
    var router: TaskDetailRouterProtocol!
    
    func viewDidLoad() {
        interactor.fetchTask()
    }
    
    func saveTask(title: String, description: String, isCompleted: Bool) {
        interactor.saveTask(title: title, description: description, isCompleted: isCompleted)
    }
    
    func didFetchTask(_ task: TaskList) {
        view.showTask(task)
    }
    
    func didSaveTask(_ task: TaskList) {
        router.navigateBack()
    }
}
