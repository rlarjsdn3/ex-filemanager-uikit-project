//
//  FilesContentViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class FilesContentViewController: UIViewController {

    @IBOutlet weak var diaryText: UITextView!
    var fileURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryText.delegate = self
        diaryText.backgroundColor = UIColor.systemGray5
        diaryText.layer.cornerRadius = 10
        diaryText.clipsToBounds = true
        
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        fileURL = docURL.appending(path: "userdata.txt")
        let filePath = fileURL.path()
        if manager.fileExists(atPath: filePath) {
            if let content = manager.contents(atPath: filePath) {
                diaryText.text = String(data: content, encoding: .utf8)
            }
        } else {
            manager.createFile(atPath: filePath, contents: nil, attributes: nil)
        }
    }

}

extension FilesContentViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text!
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("텍스트 저장 실패")
        }
    }
    
}
