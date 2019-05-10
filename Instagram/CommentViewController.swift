//
//  CommentViewController.swift
//  Instagram
//
//  Created by RYUTARO OKAMOTO on 2019/05/07.
//  Copyright © 2019 RYUTARO OKAMOTO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD


class CommentViewController: UIViewController {

    var postData: PostData!
    
    
    @IBOutlet weak var comments: UITextField!
    
    
    
    @IBAction func commnetPostButton(_ sender: Any) {
    
    
        let comment = "\(Auth.auth().currentUser!.displayName!): \(comments.text!)"
        
        postData.comment.append(comment)
        //辞書を作成してfirebaseに作成する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let Comment =  ["comment": postData.comment]
        
        postRef.updateChildValues(Comment)
        
            //投稿完了を知らせる
            SVProgressHUD.showSuccess(withStatus: "POSTED")
            //全てのモーダルを閉じる
            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
            
            
        
    
    
        
        
    }
    
    
    @IBAction func commentCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
print("caption: \(postData.caption!)")
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
