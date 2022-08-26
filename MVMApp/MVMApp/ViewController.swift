//
//  ViewController.swift
//  MVMApp
//
//  Created by usuario on 25/8/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var data = [
        Person(firstName: "Tano", lastName: "Olguin", gender: "male", age: 40, height: 144),
        Person(firstName: "Orly", lastName: "Ceres", gender: "female", age: 42, height: 120),
        Person(firstName: "Silver", lastName: "Montes de Oca", gender: "male", age: 45, height: 170),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath)
            as! CustomTableViewCell

        let model = data [indexPath.row]
        let viewModel = CellViewModel(firstName: model.firstName, lastName: model.lastName)

        cell.textLabel?.text = "\(viewModel.firstName) \(viewModel.lastName)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    struct Person {
        let firstName: String
        let lastName: String
        let gender: String
        let age: Int
        let height: Double
    }

struct CellViewModel {
    let firstName: String
    let lastName: String
}
