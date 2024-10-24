//
//  ViewController.swift
//  MenuStatusBar
//
//  Created by Ivan Nur Ilham Syah on 22/10/24.
//

import Cocoa
import RiveRuntime
import SnapKit

enum Gender: String { case male = "HomescreenMale", female = "HomescreenFemale" }

class ViewController: NSViewController {
  
  let climbrVm = RiveViewModel(fileName: "climbr")
  let changeGenderButton = NSButton()
  let randomStateButton = NSButton()
  var gender: Gender = .female

  override func viewDidLoad() {
    super.viewDidLoad()
    view.wantsLayer = true
    view.layer?.backgroundColor = .white
    
    climbrVm.fit = .cover
    let riveView = climbrVm.createRiveView()
    
    view.addSubview(riveView)
    riveView.frame = view.bounds
    
    riveView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    
    changeGenderButton.title = "Change To \(gender == .male ? "Female" : "Male")"
    changeGenderButton.bezelStyle = .flexiblePush
    changeGenderButton.target = self
    changeGenderButton.action = #selector(changeGender)
    
    randomStateButton.title = "Random State"
    randomStateButton.bezelStyle = .flexiblePush
    randomStateButton.target = self
    randomStateButton.action = #selector(randomizeState)
    
    let stack = NSStackView(views: [changeGenderButton, randomStateButton])
    stack.distribution = .fillEqually
    stack.spacing = 8
    
    riveView.addSubview(stack)
    
    stack.snp.makeConstraints { make in
      make.trailing.leading.bottom.equalToSuperview().inset(8)
    }
    
    changeGenderButton.snp.makeConstraints { make in
      make.height.equalTo(48)
    }
    
    randomStateButton.snp.makeConstraints { make in
      make.height.equalTo(48)
    }
    
  }
  
  @objc private func changeGender(_ sender: Any?) {
    gender = gender == .male ? .female : .male
    changeGenderButton.title = "Change To \(gender == .male ? "Female" : "Male")"
    
    do {
      try climbrVm.configureModel(artboardName: gender.rawValue)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  @objc private func randomizeState(_ sender: Any?) {
    
    do {
      // Define dummy states. The states should be based on the defined state in Rive
      let states: [Int] = [0, 1, 2, 3]
      // Randomize the state
      let state: Double = Double(states.randomElement() ?? 0)
      // Set the rive animation based on random state. The "WalkinStyle" should refers to Rive key animation name
      climbrVm.setInput("WalkingStyle", value: state)
    } catch {
      print(error.localizedDescription)
    }
  }

}

