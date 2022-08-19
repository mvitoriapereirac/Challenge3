//
//  ViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 20/07/22.
//

import UIKit

class AmplifyViewController: UIViewController {

    @IBOutlet var imagem: UIImageView!
    var img: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagem.image = img
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
