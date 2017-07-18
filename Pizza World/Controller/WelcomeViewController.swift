//
//  WelcomeViewController.swift
//  Pizza World
//
//  Created by Adeel Miraj on 25/04/2016.
//  Copyright © 2016 AM Co. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let path :String = NSBundle.mainBundle().pathForResource("welcome", ofType: "gif")!
//        let url: NSURL   = NSURL(string: path)!
        
//        self.imageView.image = UIImage(contentsOfFile: path)
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"video_background_signup" ofType:@"gif"];
//        NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
//        
//        [_imgBackgroundAnimatedImage setImageWithURL:url placeholderImage:_imgBackgroundAnimatedImage.image options:0 progress:nil completed:nil];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
