//
//  ViewController.swift
//  test.zametki
//
//  Created by zalkarbek on 24/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var button = UIButton()
    
    var users: [Model] = [
    Model(imageModel: UIImage(named: "1")!, labelModel: "Plan")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.backgroundColor = .red
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(alertAdd), for: .touchUpInside)
        button.frame = CGRect(x: 320, y: 200, width: 100, height: 50)
    }

    @objc func alertAdd() {
        let alert = UIAlertController(title: "Plan", message: "Hello", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { text in
            textField = text
        }
        
        let save = UIAlertAction(title: "Save", style: .cancel) { [self] action in
            users.insert(Model.init(imageModel: UIImage(named: "1")!, labelModel: textField.text!), at: 0)
            tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { action in
            ()
        }
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.imageKquar.image = users[indexPath.row].imageModel
        cell.labelZametki.text = users[indexPath.row].labelModel
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
