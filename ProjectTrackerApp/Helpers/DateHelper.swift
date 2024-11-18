//
//  DateHelper.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-17.
//

import Foundation



struct DateHelper {
    
    static func projectUpdateDate(inputDate: Date) -> String{
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMMM d, yyyy"
        return df.string(from: inputDate)
        
    }
    
    
}
