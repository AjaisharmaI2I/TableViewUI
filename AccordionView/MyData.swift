//
//  MyData.swift
//  AccordionView
//
//  Created by Ideas2IT on 24/05/23.
//

import Foundation

class MyData {
    let title: String
    let options: [String]
    var isExpanded: Bool = false
    
    init(title: String, options: [String], isExpanded: Bool = false) {
        self.title = title
        self.options = options
        self.isExpanded = isExpanded
    }
}
