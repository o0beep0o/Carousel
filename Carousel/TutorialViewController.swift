//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Parker, Bryan on 10/3/16.
//  Copyright © 2016 Parker, Bryan. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var tutorialButtonBG: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        tutorialScrollView.delegate = self
        tutorialButtonBG.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        tutorialPageControl.currentPage = page
        
        if page == 3 {
            tutorialPageControl.isHidden = true
            tutorialButtonBG.alpha = 1
        } else {
            tutorialPageControl.isHidden = false
            tutorialButtonBG.alpha = 0
        }
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
