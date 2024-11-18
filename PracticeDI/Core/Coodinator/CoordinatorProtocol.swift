//
//  CoordinatorProtocol.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 18.11.2024.
//

import Foundation
import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    var viewStack: [AnyView] { get set }
}
