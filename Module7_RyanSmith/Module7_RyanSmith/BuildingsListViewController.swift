//
//  BuildingListViewController.swift
//  Module7_RyanSmith
//
//  Created by Ryan Smith on 2/16/26.
//

import UIKit

final class BuildingsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    private var buildings = BuildingData.buildings
    private var selectedBuilding: Building?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Auburn Buildings"

        
        view.backgroundColor = .black
        tableView.backgroundColor = .black

        tableView.dataSource = self
        tableView.delegate = self

        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toBuildingDetail",
              let dest = segue.destination as? BuildingDetailViewController,
              let b = selectedBuilding else { return }
        dest.building = b
    }

    private func promptEdit(at index: Int) {
        let b = buildings[index]

        let alert = UIAlertController(title: "Edit Name",
                                      message: "Change the building name:",
                                      preferredStyle: .alert)
        alert.addTextField { tf in
            tf.text = b.name
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        alert.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let self,
                  let newName = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                  !newName.isEmpty else { return }

            self.buildings[index] = Building(name: newName,
                                             type: b.type,
                                             area: b.area,
                                             funFact: b.funFact,
                                             details: b.details)
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        })

        present(alert, animated: true)
    }
}

extension BuildingsListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buildings.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let b = buildings[indexPath.row]

        // High contrast
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 2

        cell.textLabel?.text = "\(b.name)\n\(b.type) • \(b.area)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBuilding = buildings[indexPath.row]
        performSegue(withIdentifier: "toBuildingDetail", sender: self)
    }

    // Swipe actions: Delete + Edit
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {

        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, done in
            guard let self else { return }
            self.buildings.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            done(true)
        }

        let edit = UIContextualAction(style: .normal, title: "Edit") { [weak self] _, _, done in
            self?.promptEdit(at: indexPath.row)
            done(true)
        }

        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}
