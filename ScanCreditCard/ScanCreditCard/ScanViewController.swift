//
//  ScanViewController.swift
//  ScanCreditCard
//
//  Created by makoto on 2025/01/28.
//

import UIKit

protocol ScanViewControllerDelegate: AnyObject {

    func scanViewController(_ scanViewController: ScanViewController, didScanCardNumber number: String)
}

final class ScanViewController: UIViewController {

    weak var delegate: ScanViewControllerDelegate?

    @IBOutlet private weak var cardIOView: CardIOView! {
        didSet {
            cardIOView.hideCardIOLogo = true
            cardIOView.useCardIOLogo = true
            cardIOView.guideColor = .white
            cardIOView.scanInstructions = ""
            cardIOView.languageOrLocale = "ja"
            cardIOView.allowFreelyRotatingCardGuide = false
            cardIOView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ScanViewController: CardIOViewDelegate {

    func cardIOView(_ cardIOView: CardIOView!, didScanCard cardInfo: CardIOCreditCardInfo!) {
        delegate?.scanViewController(self, didScanCardNumber: cardInfo.cardNumber)
    }
}
