//
//  SchedulePickupViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/11/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class SchedulePickupViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var schedulePickupButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Private Methods
    private func setupViews() {
        self.hideKeyboardWhenViewTapped()
        schedulePickupButton.layer.cornerRadius = 8
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectPropertyModalSegue" {
            guard let selectPropertyVC = segue.destination as? SelectPropertyViewController else { return }
            selectPropertyVC.delegate = self
        }
    }
    
    // MARK: - IBActions
    @IBAction func schedulePickupButtonTapped(_ sender: Any) {
    }
}

extension SchedulePickupViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Pickup Details"
        case 1:
            return "Package Contents"
        case 2:
            return "Notes"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            // Select Property
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectPropertyCell", for: indexPath) as? PickupPropertyTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            // Select Date
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectDateCell", for: indexPath) as? PickupDateTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.section == 0 && indexPath.row == 2 {
            // Select Time
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTimeCell", for: indexPath) as? PickupTimeTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            // Add Weight
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickupWeightCell", for: indexPath) as? PickupWeightTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.section == 1 && indexPath.row == 1 {
            // Select Contents
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickupContentsCell", for: indexPath) as? PickupContentsTableViewCell else { return UITableViewCell() }
            
            return cell
        } else {
            // Add Notes
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickupNotesCell", for: indexPath) as? PickupNotesTableViewCell else { return UITableViewCell() }
            
            return cell
        }
    }
}

extension SchedulePickupViewController: DeselectTableViewCellOnDismissDelegate {
    func deselectTableViewCell() {
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            // Clear selected cell when the user returns from selecting a property
            self.tableView.deselectRow(at: selectionIndexPath, animated: true)
        }
    }
}