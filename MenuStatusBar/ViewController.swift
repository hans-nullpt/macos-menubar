//
//  ViewController.swift
//  MenuStatusBar
//
//  Created by Ivan Nur Ilham Syah on 22/10/24.
//

import Cocoa

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.wantsLayer = true
    view.layer?.backgroundColor = .white
    
    let label = NSTextField()
    view.addSubview(label)
    label.stringValue = "Hai"
    label.isEditable = false
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
  }

}

