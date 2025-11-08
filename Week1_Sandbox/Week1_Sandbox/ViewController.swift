//
//  ViewController.swift
//  Week1_Sandbox
//
//  Created by 승재 on 11/8/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        writeContainer()
    }
    
    func writeContainer() {
        let tmpURL = FileManager.default.temporaryDirectory
        let parentURL = tmpURL.deletingLastPathComponent()
        let fileURL = parentURL.appendingPathComponent("test.txt")
        
        do {
            try "Hello Sandbox".write(to: fileURL, atomically: true, encoding: .utf8)
            print("Caches 파일 생성 성공:", fileURL.path)
        } catch {
            print("Caches 파일 생성 실패:", error)
        }
        /*
         Error Domain=NSCocoaErrorDomain Code=513 "You don’t have permission to save the file “test.txt” in the folder “2B5745B1-D570-4DB0-99DD-AD5728853EA3”." UserInfo={NSFilePath=/private/var/mobile/Containers/Data/Application/2B5745B1-D570-4DB0-99DD-AD5728853EA3/test.txt, NSURL=file:///private/var/mobile/Containers/Data/Application/2B5745B1-D570-4DB0-99DD-AD5728853EA3/test.txt, NSUnderlyingError=0x1562deaf0 {Error Domain=NSPOSIXErrorDomain Code=1 "Operation not permitted"}}
         */
    }
    
    func readAllLibraryDirectories() {
        let containerURL = FileManager.default.urls(for: .allApplicationsDirectory, in: .userDomainMask)
        print(containerURL)
        /*
         result :
         [file:///Users/seungjae/Library/Developer/CoreSimulator/Devices/3CBE1016-87BF-479F-966B-B51649948B26/data/Containers/Data/Application/9EF2E728-344C-4E81-9A67-E3DDC16A1D99/Applications/, file:///Users/seungjae/Library/Developer/CoreSimulator/Devices/3CBE1016-87BF-479F-966B-B51649948B26/data/Containers/Data/Application/9EF2E728-344C-4E81-9A67-E3DDC16A1D99/Applications/Utilities/, file:///Users/seungjae/Library/Developer/CoreSimulator/Devices/3CBE1016-87BF-479F-966B-B51649948B26/data/Containers/Data/Application/9EF2E728-344C-4E81-9A67-E3DDC16A1D99/Developer/Applications/, file:///Users/seungjae/Library/Developer/CoreSimulator/Devices/3CBE1016-87BF-479F-966B-B51649948B26/data/Containers/Data/Application/9EF2E728-344C-4E81-9A67-E3DDC16A1D99/Applications/Demos/]
         */
    }
    
    func writeToTmp() {
        let tmpURL = FileManager.default.temporaryDirectory
        let tmpFile = tmpURL.appendingPathComponent("temp_note.txt")
        try? "Temporary".write(to: tmpFile, atomically: true, encoding: .utf8)
        print("tmp 파일:", tmpFile.path)
    }
    
    func writeToCaches() {
        guard let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("❌ Caches 경로를 찾을 수 없음")
            return
        }
        
        let fileURL = cachesURL.appendingPathComponent("test.txt")
        
        do {
            try "Hello Sandbox".write(to: fileURL, atomically: true, encoding: .utf8)
            print("Caches 파일 생성 성공:", fileURL.path)
        } catch {
            print("Caches 파일 생성 실패:", error)
        }
    }
    
    

    
    func writeToDocuments() {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("❌ Documents 경로를 찾을 수 없음")
            return
        }
        
        let fileURL = documentsURL.appendingPathComponent("test.txt")
        
        do {
            try "Hello Sandbox".write(to: fileURL, atomically: true, encoding: .utf8)
            print("파일 생성 성공:", fileURL.path)
        } catch {
            print("파일 생성 실패:", error)
        }
    }
    
    func writeToOtherApp() {
        let otherAppPath = "/var/mobile/Containers/Data/Application/69614363-0D00-4E00-9151-9FD092B9ADB1/Documents/test.txt"
        let url = URL(fileURLWithPath: otherAppPath)

        do {
            try "Hello?".write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print("❌", error)
        }

    }


    func sharedContainerURL() -> URL? {
        let groupID = "group.TDWidgetAppGroup"
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)
    }
}

