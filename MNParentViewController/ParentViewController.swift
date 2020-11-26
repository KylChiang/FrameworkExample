//
//  ParentViewController.swift
//  MNParentViewController
//
//  Created by Kylie on 2020/10/29.
//  Copyright © 2020 Opay. All rights reserved.
//

import UIKit
import SwiftyRSA
//import Alamofire
//import PromiseKit
//
//public enum APIError: Error {
//    case decodeFail
//    case parseFail
//    case returnError(code: String , msg :String)
//}

public class ParentViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    public static func publicKey() {
        do {
            let publicKey = try PublicKey(pemNamed: "public")
            print("public key: \(try publicKey.base64String())")
        } catch let err {
            print("error: \(err)")
        }
    }
//    static let api_url:String = "http://httpbin.org/post"
//
//    public static func queryPostAPI() -> Promise<[String: Any]> {
//            return Promise{ seal in
//
//                let paras = ["num":"10" , "str":"This is String"]
//                AF.request(api_url,
//                           method: .post,
//                           parameters: paras,
//                           encoder: URLEncodedFormParameterEncoder.default){ urlRequest in
//                            urlRequest.timeoutInterval = 10
//    //                           urlRequest.allowsConstrainedNetworkAccess = false
//                           }
//                    .validate(statusCode: 200..<300)
//    //                .validate(statusCode: 300..<400)
//                    .responseData{ response in
//
//                    debugPrint(response)
//                        switch response.result {
//                        case .success(let data):
//
//                            do {
//                                // make sure this JSON is in the format we expect
//                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                                    // try to read out a string array
//                                    return seal.fulfill(json)
//                                }
//
//                            } catch let error as NSError {
//                                print("Failed to load: \(error.localizedDescription)")
//                                seal.reject(APIError.parseFail)
//                            }
//                            seal.reject(APIError.parseFail)
//
//                        case .failure(let error):
//    //                        print(error)
//                            seal.reject(error)
//                        }
//
//
//                }
//            }
//        }

}
