//
//  ViewController.swift
//  AutomaticReferenceCounting(ARC)
//
//  Created by abdullah's Ventura on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //MARK: - Default
        /*
        var course : Course? = Course(name: "iOS Course", url: URL(string:"https://www.udemy.com/course/ios-gelistirme-kursu")!)
        var instructor : Instructor? = Instructor(name: "Atil Samancioglu")
        
       //strong reference oldugu icin nil yaptigimiz degerler nil olmadi hafizadan silinmedi memory leak olustu
        course!.instructor = instructor
        instructor!.course = course
            
        course = nil
        instructor = nil
        
        //MARK: - Weak
        var courseWeak : WeakCourse? = WeakCourse(name: "iOS Course", url: URL(string:"https://www.udemy.com/course/ios-gelistirme-kursu")!)
        var instructorWeak : WeakInstructor? = WeakInstructor(name: "Atil Samancioglu")
        
       //weak reference
        courseWeak?.instructor = instructorWeak
        instructorWeak?.course = courseWeak
            
        courseWeak = nil
        instructorWeak = nil
        */
        //MARK: - Weak SELF
        var courseWeakSelf : WeakSelfCourse? = WeakSelfCourse(name: "iOS Course", url: URL(string:"https://www.udemy.com/course/ios-gelistirme-kursu")!)
        var instructorWeakSelf : WeakSelfInstructor? = WeakSelfInstructor(name: "Atil Samancioglu")
        
       //weak reference
        courseWeakSelf?.instructor = instructorWeakSelf
        instructorWeakSelf?.course = courseWeakSelf
            
        courseWeakSelf!.launch(launchedcourse: LaunchedCourse(title: "iOS"))
        
        courseWeakSelf = nil
        instructorWeakSelf = nil
    }


}

