//
//  ViewController.swift
//  FrameworkExample
//
//  Created by Kylie on 2020/10/29.
//  Copyright © 2020 Opay. All rights reserved.
//

import UIKit
import MNParent_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedSeeButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ParentViewController", bundle: Bundle(identifier: "com.kyl.MNParent"))
        let vc = storyboard.instantiateViewController(withIdentifier: "ParentViewController")
        self.present(vc, animated: true)
    }
    
}

