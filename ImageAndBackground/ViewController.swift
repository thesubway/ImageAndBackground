//
//  ViewController.swift
//  ImageAndBackground
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var imageOver: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var downloadImage: UIButton!
    @IBOutlet var otherImage: UIButton!
    var numClicks1 = 0
    var numClicks2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadPressed(sender: AnyObject) {
        var myQueue = NSOperationQueue()
        myQueue.maxConcurrentOperationCount = 1
        myQueue.addOperationWithBlock( {() -> Void in
            var url = NSURL(string: "http://blogimages.thescore.com/nfl/files/2014/02/russell-Wilson-again.jpg")
            if (self.numClicks1 % 2 == 1) {
                url = NSURL(string: "http://www1.pictures.zimbio.com/gi/Scott+Kazmir+Oakland+Athletics+v+Houston+Astros+x5bgu9qJBsIl.jpg")
            }
            var data = NSData(contentsOfURL: url)
            
            NSOperationQueue.mainQueue().addOperationWithBlock( {() -> Void in
                var myImage = UIImage(data: data)
                self.imageOver.image = myImage
            })
        })
        var imageOperation = NSOperation()
        var blockOperation = NSBlockOperation({() -> Void in
            
            
            //do something
            })
        myQueue.addOperation(blockOperation)
        numClicks1++
    }
    @IBAction func otherPressed(sender: AnyObject) {
        var myQueue = NSOperationQueue()
        myQueue.maxConcurrentOperationCount = 1
        myQueue.addOperationWithBlock( {() -> Void in
            var url = NSURL(string: "http://blogimages.thescore.com/nfl/files/2014/02/russell-Wilson-again.jpg")
            if (self.numClicks2 % 2 == 1) {
                url = NSURL(string: "http://www1.pictures.zimbio.com/gi/Scott+Kazmir+Oakland+Athletics+v+Houston+Astros+x5bgu9qJBsIl.jpg")
            }
            var data = NSData(contentsOfURL: url)
            
            NSOperationQueue.mainQueue().addOperationWithBlock( {() -> Void in
                var myImage = UIImage(data: data)
                self.secondImage.image = myImage
                })
            })
        var imageOperation = NSOperation()
        var blockOperation = NSBlockOperation({() -> Void in
            
            
            //do something
            })
        myQueue.addOperation(blockOperation)
        numClicks2++
    }
    

}

