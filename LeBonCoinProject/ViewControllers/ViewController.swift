//
//  ViewController.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 12/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var loadingSpinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    func setSpinner(visible: Bool) {
        // Should always update  UI in the main thread
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.loadingSpinner.removeFromSuperview()
            guard let rootViewController = UIApplication.shared.delegate?.window??.rootViewController, visible else {
                return
            }
            rootViewController.view.addSubview(strongSelf.loadingSpinner)
            NSLayoutConstraint.activate([
                strongSelf.loadingSpinner.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor),
                strongSelf.loadingSpinner.centerYAnchor.constraint(equalTo: rootViewController.view.centerYAnchor)
            ])
            strongSelf.loadingSpinner.startAnimating()
        }
    }
    
    
    public func notifyUserError(message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.loadingSpinner.removeFromSuperview()
            let alert = strongSelf.defaultAlertInfo(message: message, closingText: "OK")
            strongSelf.view.tintColor = UIColor.orange
            strongSelf.present(alert, animated: true)
        }
    }
    
    private func defaultAlertInfo(title: String? = "", message: String, closingText: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: closingText, style: .cancel, handler: nil))
        return alert
    }
}


