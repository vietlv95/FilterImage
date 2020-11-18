//
//  ViewController.swift
//  FilterImage
//
//  Created by Viet Le Van on 11/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonDidTap(_ sender: Any) {
        let sampleController = SampleViewController()
        navigationController?.pushViewController(sampleController, animated: true)
    }
    
}

