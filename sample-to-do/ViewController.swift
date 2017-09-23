//
//  ViewController.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewToDoButtonTapped(_ sender: AnyObject) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewToDoViewController") as? AddNewToDoViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ToDoTableViewCell")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as? ToDoTableViewCell else {
            return UITableViewCell()
        }
        cell.toDoLabel.text = viewModel.toDos[indexPath.row].name
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.toDos.count
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         return
    }
    
    
}
