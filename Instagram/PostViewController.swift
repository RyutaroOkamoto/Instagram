//
//  PostViewController.swift
//  Instagram
//
//  Created by RYUTARO OKAMOTO on 2019/05/01.
//  Copyright © 2019 RYUTARO OKAMOTO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class PostViewController: UIViewController {
    var image: UIImage!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func handlePostButton(_ sender: Any) {
        
        //imageviewから画像を習得する
    let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
        let imageString = imageData!.base64EncodedString(options: .lineLength64Characters)
        //pstdataに必要な情報をす習得する
        let time = Date.timeIntervalSinceReferenceDate
        let name = Auth.auth().currentUser?.displayName
        
        //辞書を作成してfirebaseに作成する
        let postRef = Database.database().reference().child(Const.PostPath)
        let postDic =  ["caption": textField.text!,"image": imageString,"time": String(time), "name": name!]
        postRef.childByAutoId().setValue(postDic)
        
        //投稿完了を知らせる
        SVProgressHUD.showSuccess(withStatus: "POSTED")
        //全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        
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
