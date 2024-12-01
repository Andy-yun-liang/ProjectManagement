//
//  StatsHelper.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-21.
//

import Foundation
import SwiftUI

struct StatsHelper {
    
    //handles the creation of new log updates and new milestone updates
    static func updateStatsOnCreate(project : Project , update : ProjectUpdate){
        
        //add hours from project updates to the project
        project.hours += update.hours
        
            //sort the project.updates array into descending order

            project.updates.sort {
                $0.date > $1.date
            }
            
            if project.updates.count >= 2 {
                
                let calendar = Calendar.current
                
                let latestUpate = project.updates[0].date
                let previousUpdate = project.updates[1].date
                
                //check if its the same day
                
                let sameDay = calendar.isDate(latestUpate, inSameDayAs: previousUpdate) //returns true or false
                
                //if not true we should insert session count by 1
                
                if !sameDay{
                    project.sessions += 1
                }
                
            }else{
                //this captures the case where the array is empty or only contains 1 update thus far
                project.sessions += 1
            }
     
        //sum the number of logs
        var projectUpdates = project.updates.count
        
        //add a count to wins metric if its a milestone
        if update.updateType == .milestone {
            project.wins += 1
        }
    }
    
    static func updateDeleted(project : Project, update : ProjectUpdate){
        
        //remove hours
        project.hours -= update.hours
        
        //remove a win if its a milestone
        if update.updateType == .milestone {
            
            project.wins -= 1
        }
        
        //remove a session
        //create an array called sameDayUpdate that iterates through all of my project.updates and filters for values thats the same as the update.date instance.
        
        //so for example if update.date is Nov 7th,2024 this statement iterates over project.updates and filters through each element and gives us only elements in the date of Nov 7th,2024
        let sameDayUpdates = project.updates.filter{
            u in Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        
        //there is only 1 instance of that date and its this update, hence if we were to delete this instance we need to subtract the session by 1
        if sameDayUpdates.count == 1 {
            project.sessions -= 1
        }
        
        
    }
    
    static func updateStatsOnEdit(project : Project, hoursDiff : Double){
        
        project.hours += hoursDiff
    }
    
    
    
}
