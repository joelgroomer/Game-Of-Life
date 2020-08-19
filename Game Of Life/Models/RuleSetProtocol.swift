//
//  RuleSetProtocol.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

protocol RuleSetProtocol {
    static var shared: RuleSetProtocol { get }  // must be a singleton to avoid creating tons of copies of the rules
    func testCell(_ cell: CACell) -> Bool       // Tests the cell and determines if it will live (return true) or die (return false)
}
