//
//  ViewController.swift
//  Health Care Near Me
//
//  Created by Romell Bolton on 4/30/17.
//  Copyright © 2017 Romell Bolton. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var picker: UIPickerView!

    let data = [
        StaticLocation.init(type: "Acupuncturist", ID: "52e81612bcbc57f1066b7a3b"),
        StaticLocation.init(type: "Alternative Healer", ID: "52e81612bcbc57f1066b7a3c"),
        StaticLocation.init(type: "Chiropractor", ID: "52e81612bcbc57f1066b7a3a"),
        StaticLocation.init(type: "Dentist's Office", ID: "4bf58dd8d48988d178941735"),
        StaticLocation.init(type: "Doctor's Office", ID: "4bf58dd8d48988d177941735"),
        StaticLocation.init(type: "Emergency Room", ID: "4bf58dd8d48988d194941735"),
        StaticLocation.init(type: "Eye Doctor", ID: "522e32fae4b09b556e370f19"),
        StaticLocation.init(type: "Hospital", ID: "4bf58dd8d48988d196941735"),
        StaticLocation.init(type: "Hospital Ward", ID: "58daa1558bbb0b01f18ec1f7"),
        StaticLocation.init(type: "Maternity Clinic", ID: "56aa371be4b08b9a8d5734ff"),
        StaticLocation.init(type: "Medical Center", ID: "4f4531b14b9074f6e4fb0103"),
        StaticLocation.init(type: "Medical Lab", ID: "52e81612bcbc57f1066b7a39"),
        StaticLocation.init(type: "Mental Health Office", ID: "58daa1558bbb0b01f18ec1d0"),
        StaticLocation.init(type: "Nutritionist", ID: "56aa371be4b08b9a8d57351d"),
        StaticLocation.init(type: "Physical Therapist", ID: "5744ccdfe4b0c0459246b4af"),
                 StaticLocation.init(type: "Rehab Center", ID: "56aa371be4b08b9a8d573526"),
                StaticLocation.init(type: "Urgent Care Center", ID: "4bf58dd8d48988d104941735"),

                ]
    

    var userSelection: MedicalLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barStyle = .black //
        picker.dataSource = self
        picker.delegate = self
        userSelection = MedicalLocation(rawValue: picker.selectedRow(inComponent: 0))
    }

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func transitionToSearch() {
        if let userSelection = userSelection {
            let vc = storyboard?.instantiateViewController(withIdentifier: LocationResultsViewController.storyboardIdentifier) as! LocationResultsViewController
            vc.searchItem = userSelection
            vc.navigationItem.title = userSelection.description
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}


extension HomePageViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - PickerViewDataSource Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // MARK: - PickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Note: It is okay to force unwrap here because we know it is a finite number of posibilities.
        userSelection = MedicalLocation(rawValue: row)!
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: data[row].type, attributes: [NSForegroundColorAttributeName:UIColor.white])
    }
}
