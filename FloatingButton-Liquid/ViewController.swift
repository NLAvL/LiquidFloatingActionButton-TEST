//
//  ViewController.swift
//  FloatingButton-Liquid
//
//  Created by Arthur Loo on 25-10-16.
//  Copyright © 2016 Arthur van Loo. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class ViewController: UIViewController {
    
    var cells = [LiquidFloatingCell]() //datasource
    var floatingActionButton : LiquidFloatingActionButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFloatingButton()
        
    }

    
    private func createFloatingButton(){
        cells.append(createButtonCell(iconName: "InfoIcon"))
        cells.append(createButtonCell(iconName: "MapIcon"))
        cells.append(createButtonCell(iconName: "DistanceIcon"))
        cells.append(createButtonCell(iconName: "PhotoIcon"))
        cells.append(createButtonCell(iconName: "ReviewIcon"))
        cells.append(createButtonCell(iconName: "SaveIcon"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 56 - 16, width: 56, height: 56)
        
        let floatingButton = createButton(frame: floatingFrame, style: .up)
        
        self.view.addSubview(floatingButton)
        self.floatingActionButton = floatingButton
    }
    
    
    private func createButtonCell(iconName: String) -> LiquidFloatingCell {
        return LiquidFloatingCell(icon: UIImage(named: iconName)!)
    }
    
    private func createButton(frame:CGRect, style: LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton {
        
        
        let floatingActionButton = LiquidFloatingActionButton(frame: frame)
        floatingActionButton.animateStyle = style
        floatingActionButton.dataSource = self
        floatingActionButton.delegate = self
        
        return floatingActionButton
    }


}



extension ViewController: LiquidFloatingActionButtonDataSource {
    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
}



extension ViewController: LiquidFloatingActionButtonDelegate {
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        print("You tapped button number \(index)")
        self.floatingActionButton.close()
    }
}






























