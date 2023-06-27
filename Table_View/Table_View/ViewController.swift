//
//  ViewController.swift
//  Table_View
//
//  Created by Mac on 27/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var studentTableView: UITableView!
    var studentInformation : [Student] = [
        Student(name: "Rohan", lastName: "Akolkar", mobileNumber: 88830666862, image: "Rohan"),
        Student(name: "Shubham", lastName: "Markad", mobileNumber: 9359036207, image: "shubham"),
        Student(name: "Sachin", lastName: "Pathak", mobileNumber: 9168496814, image: "Sachin"),
        Student(name: "Yuvaraj", lastName: "Pawar", mobileNumber: 7218893725, image: "Yuvaraj"),
        Student(name: "Aniket", lastName: "Karale", mobileNumber:9325773016, image: "Aniket"),
        Student(name : "Ravindra", lastName: "Nimbalkar", mobileNumber: 7350724498, image: "Ravi")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableViewCellRegistration()
    }
   
    func studentTableViewCellRegistration(){
        let uiNibName = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNibName, forCellReuseIdentifier: "StudentTableViewCell")
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Student Information"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       200.0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            studentTableView.beginUpdates()
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            studentInformation.remove(at: indexPath.row)
            studentTableView.endUpdates()
        }
    }
}
extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentInformation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath)as!StudentTableViewCell
        
        studentTableViewCell.studentNameLabel.text = studentInformation[indexPath.row].name
        studentTableViewCell.studentLastNameLabel.text = studentInformation[indexPath.row].lastName
        studentTableViewCell.studentMobileNumberLabel.text = String(studentInformation[indexPath.row].mobileNumber)
        studentTableViewCell.studetImageView.image = UIImage(named: studentInformation[indexPath.row].image)
        studentTableViewCell.layer.borderColor = UIColor.black.cgColor
        studentTableViewCell.layer.borderWidth = 5
        studentTableViewCell.layer.cornerRadius = 20
        return studentTableViewCell
    }
}

