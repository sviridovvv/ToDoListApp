//
//  IOrderedTaskManager.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 18.02.2023.
//

/// Декратор для менеджера задач, добавлена сортировка задач
final class OrderedTaskManager: ITaskManager {
	var taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Получить все задания
	public func getAllTasks() -> [Task] {
		taskManager.getAllTasks()
	}
	
	/// Показать все заверешенные задачи
	public func getComletedTasks() -> [Task] {
		sorted(tasks: taskManager.getComletedTasks())
	}
	
	/// Показать все незаверешнные задачи
	public func getUncompletedTasks() -> [Task] {
		sorted(tasks: taskManager.getUncompletedTasks())
	}
	
	/// Добавить задачу
	public func addTask(task: Task) {
		taskManager.addTask(task: task)
	}
	
	/// Добавить массив задач
	public func addTasks(tasks: [Task]) {
		taskManager.addTasks(tasks: tasks)
	}
	
	/// Удалить задачу
	public func deleteTask(task: Task) {
		taskManager.deleteTask(task: task)
	}
	
	private func sorted(tasks: [Task]) -> [Task] {
		tasks.sorted {
			if let task0 = $0 as? ImportantTask,
			   let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue > task1.priority.rawValue
			}
			
			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}
			
			if $0 is RegularTask, $01 is ImportantTask {
				return false
			}
			
			return true
		}
	}
}
