//
//  ViewController.swift
//  CocoaProject
//
//  Created by Thomas Tang on 11/8/18.
//  Copyright © 2018 Thomas Tang. All rights reserved.
//

import UIKit
import PromiseKit
import Alamofire
import AlamofireSwiftyJSON
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstly {
            httpReq()
        }.done { response in
            print(response)
        }
    }

    func httpReq() -> Promise<JSON> {
        return Promise { seal in
            Alamofire.request("https://api.foursquare.com/v2/venues/search?client_id=4TCOBRNYJSHUVUA21XNC1NGYF1EFSMKSSCPTLPHXE1KITWME&client_secret=M4JZCLSXBFPDKS0G52OYPI1J13KIYDIYKLS5J0ASRCDKDVTE&near=La%20Jolla%2C%20CA&categoryId=4bf58dd8d48988d118951735&v=20180101&limit=1&fbclid=IwAR3TTbsx6_gXdT9qyWnxaDK1_EDQl8gVziopCccnmEVMFxj-RgqQw1yxoyY").responseSwiftyJSON { response in
                if let data = response.result.value{
                    seal.fulfill(data)
                }
            }
        }
    }
    
    func 

}

