// UserProfile.swift
// MacroFlowv5
// Created by Ryan D'Mello on 13/10/2024.

import Foundation
import SwiftData

/// Model representing the user's profile for tracking personal fitness data.
@Model
final class UserProfile {
    // User's weight in kilograms.
    var weight: Double
    // User's height in centimeters.
    var height: Double
    // User's age in years.
    var age: Int
    // User's gender, which can be "Male" or "Female".
    var gender: String
    // User's activity level, which can be one of several predefined options.
    var activityLevel: String
    // User's goal, such as "Weight loss", "Muscle gain", or "Maintenance".
    var goal: String
    // Total daily calories calculated based on user's profile and activity level.
    var totalCalories: Double
    // Total protein intake in grams.
    var protein: Double
    // Total fat intake in grams.
    var fat: Double
    // Total carbohydrate intake in grams.
    var carbohydrates: Double

    /// Initializes a new UserProfile with the provided parameters.
    /// - Parameters:
    ///   - weight: User's weight in kilograms.
    ///   - height: User's height in centimeters.
    ///   - age: User's age in years.
    ///   - gender: User's gender.
    ///   - activityLevel: User's activity level.
    ///   - goal: User's fitness goal.
    ///   - totalCalories: User's total daily calories.
    ///   - protein: User's total protein intake.
    ///   - fat: User's total fat intake.
    ///   - carbohydrates: User's total carbohydrate intake.
    init(weight: Double, height: Double, age: Int, gender: String, activityLevel: String, goal: String, totalCalories: Double, protein: Double, fat: Double, carbohydrates: Double) {
        self.weight = weight
        self.height = height
        self.age = age
        self.gender = gender
        self.activityLevel = activityLevel
        self.goal = goal
        self.totalCalories = totalCalories
        self.protein = protein
        self.fat = fat
        self.carbohydrates = carbohydrates
    }
}
