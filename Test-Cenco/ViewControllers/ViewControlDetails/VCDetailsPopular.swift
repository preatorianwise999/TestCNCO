//
//  VCDetailsPopular.swift
//  Test-Cenco
//
//  Created by Jose David Bustos H on 21-02-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit

class VCDetailsPopular: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescripLabel: UILabel!
    
    var nameString:String!
    var decripString:String!
    var imageString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnVolver(_ sender: Any) {
        GoToPopular()
    }
    func GoToPopular()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewControllerTabBar")
        self.present(controller, animated: true, completion: nil)
    }
    
    func updateUI() {
        self.TitleLabel.text = nameString
        self.DescripLabel.text = decripString
        self.DescripLabel.numberOfLines = 12
        self.DescripLabel.lineBreakMode = .byWordWrapping
        
        let imgURL = URL(string:imageString)
        
        let data = NSData(contentsOf: (imgURL)!)
        self.ImageView.image = UIImage(data: data as! Data)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
