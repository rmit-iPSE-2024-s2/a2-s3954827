import Foundation
import SwiftData

/// DailyEntry model representing a single day's food and exercise entries.
@Model
final class DailyEntry {
    var date: Date // Unique date for each entry
    var breakfastCalories: Double // Calories consumed during breakfast
    var lunchCalories: Double // Calories consumed during lunch
    var dinnerCalories: Double // Calories consumed during dinner
    var snackCalories: Double // Calories consumed as snacks
    var exerciseCalories: Double // Calories burned through exercise

    /// Initializes a new DailyEntry with specified parameters.
    /// - Parameters:
    ///   - date: The date of the entry.
    ///   - breakfastCalories: Calories consumed during breakfast.
    ///   - lunchCalories: Calories consumed during lunch.
    ///   - dinnerCalories: Calories consumed during dinner.
    ///   - snackCalories: Calories consumed as snacks.
    ///   - exerciseCalories: Calories burned through exercise.
    init(date: Date, breakfastCalories: Double, lunchCalories: Double, dinnerCalories: Double, snackCalories: Double, exerciseCalories: Double) {
        self.date = date // Set the date for the entry
        self.breakfastCalories = breakfastCalories // Set breakfast calories
        self.lunchCalories = lunchCalories // Set lunch calories
        self.dinnerCalories = dinnerCalories // Set dinner calories
        self.snackCalories = snackCalories // Set snack calories
        self.exerciseCalories = exerciseCalories // Set exercise calories
    }
}
