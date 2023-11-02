//
//  FilesAttributesViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class FilesAttributesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let fileURL = docURL.appending(path: "posting.md")
        let filePath = fileURL.path()
        if let attributes = try? manager.attributesOfItem(atPath: filePath) {
            let type = attributes[.type] as! FileAttributeType
            let size = attributes[.size] as! Int
            let date = attributes[.creationDate] as! Date
            // 해당 아이템이 디렉토리가 아니라면
            if type != FileAttributeType.typeDirectory {
                print("Name: \(fileURL.lastPathComponent)")
                print("Size: \(size)")
                print("Created: \(date)")
            }
        }
    }

}
