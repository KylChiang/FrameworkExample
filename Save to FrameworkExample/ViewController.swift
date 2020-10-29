//
//  ViewController.swift
//  Save to FrameworkExample
//
//  Created by Kylie on 2020/10/29.
//  Copyright © 2020 Opay. All rights reserved.
//

import UIKit
import MNParentViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Note()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let parentVC = segue.destination as? ParentViewController {
            // do something
        }
    }
}

