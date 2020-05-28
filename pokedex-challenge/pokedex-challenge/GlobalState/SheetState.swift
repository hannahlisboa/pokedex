//
//  SheetState.swift
//  pokedex-challenge
//
//  Created by Hannah  on 28/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
class SheetState: ObservableObject {
    
    @Published var showingDetail = false
    @Published var activeSheetType: Types.ActiveSheet = .abilityDescription
    @Published var idDataSheet = String()
}
