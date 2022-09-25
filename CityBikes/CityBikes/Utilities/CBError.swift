//
//  CBError.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/17/22.
//

import Foundation

enum CBError: String, Error {
    
    case unableToComplete = "Unable to complete request. Check your internet."
    case invalidResponse = "Invalid response from the server. Try again."
    case invalidData = "The data recieved from the server was invalid. Try again."
    case unableToCompleteRequest = "Please check your internet connection"
    case cannotConvertToDictionary = "Missing dictionary data"
    
    case batchInserError = "Issues with batch insert"
    case wrongDataFormat = "Could not digest the fetchedData"
    
}
