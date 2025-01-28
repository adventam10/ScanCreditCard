//
//  ViewController.swift
//  ScanCreditCard
//
//  Created by makoto on 2025/01/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let scan = segue.destination as? ScanViewController {
            scan.delegate = self
        }
    }
}

extension ViewController: ScanViewControllerDelegate {

    func scanViewController(_ scanViewController: ScanViewController, didScanCardNumber number: String) {
        label.text = number
        scanViewController.dismiss(animated: true)
    }
}
