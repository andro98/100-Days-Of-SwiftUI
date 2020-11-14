//
//  ContentView.swift
//  Convertor
//
//  Created by Andrew Maher on 3/5/1737 ERA1.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = ""
    @State private var fromUnit = 0
    @State private var toUnit = 2

    let availableUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var outputUnit: Double{
        let input = Double(inputUnit) ?? 0
        let fUnit = Measurement(value: input, unit:getUnityType(from: fromUnit))
        let tUnit = fUnit.converted(to: getUnityType(from: toUnit))
        return tUnit.value
    }
    
    func getUnityType(from index: Int) -> UnitTemperature{
        switch index {
        case 0:
            return .celsius
        case 1:
            return .fahrenheit
        case 2:
            return .kelvin
        default:
            return .celsius
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Value to be converted", text: $inputUnit)
                        .keyboardType(.decimalPad)
                   
                }
                Section(header: Text("From Unit")){
                    Picker("From Unit", selection: $fromUnit){
                        ForEach(0 ..< availableUnits.count){
                            Text("\(availableUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To Unit")){
                    Picker("To Unit", selection: $toUnit){
                        ForEach(0 ..< availableUnits.count){
                            Text("\(availableUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("\(outputUnit, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Temperature Convertor", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
