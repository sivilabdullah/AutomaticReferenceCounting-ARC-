//
//  WeakSelfExamples.swift
//  AutomaticReferenceCounting(ARC)
//
//  Created by abdullah's Ventura on 18.06.2023.
//
import Foundation

struct LaunchedCourse{
    let title : String
    var isLaunched : Bool = false
    init(title: String) {
        self.title = title
    }
}


class WeakSelfInstructor {
    let name : String
    var course : WeakSelfCourse?
    
    init(name: String) {
        self.name = name
    }
    deinit{
        print("WeakSelf Instructor \(name) deinitialized")
    }
}

class WeakSelfCourse {
    let name : String
    let url : URL
    weak var instructor : WeakSelfInstructor?
    
    var launchedCourse: [LaunchedCourse] = []
    
    var onLaunched :((_ launchedCourse : LaunchedCourse) -> Void)?
    func launch(launchedcourse: LaunchedCourse){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.onLaunched?(launchedcourse)
        }
    }
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
        
        onLaunched = { [weak self] launchedCourse in
            self?.launchedCourse.append(launchedCourse)
            print("launched course count : \(self?.launchedCourse.count ?? 0)")
        }
    }
    deinit{
        print("WeakSelf Course \(name) deinitialized")
    }
}
