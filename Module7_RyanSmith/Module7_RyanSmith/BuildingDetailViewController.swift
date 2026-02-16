//
//  BuildingDetailViewController.swift
//  Module7_RyanSmith
//
//  Created by Ryan Smith on 2/16/26.
//

import UIKit

final class BuildingDetailViewController: UIViewController {

    var building: Building?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .orange
        [nameLabel, typeLabel, areaLabel, factLabel, detailsLabel].forEach {
            $0?.textColor = .blue
        }

        guard let b = building else { return }

        nameLabel.text = b.name
        typeLabel.text = "Type: \(b.type)"
        areaLabel.text = "Area: \(b.area)"
        factLabel.text = "Fun fact: \(b.funFact)"
        detailsLabel.text = b.details

        factLabel.numberOfLines = 0
        detailsLabel.numberOfLines = 0
    }
}
