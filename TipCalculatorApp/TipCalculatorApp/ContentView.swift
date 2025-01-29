//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Blust, Caden on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 15.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResults: Bool = false
    @State private var isDollar: Bool = true
    
    //===============================================================================
    
    var tipAmount: Double {
        return billAmount * (tipPercentage / 100)
    }
    
    var totalAmount: Double {
        return billAmount + tipAmount
    }
    
    var amountPerPerson: Double {
        return totalAmount / numberOfPeople
    }
    
    //===============================================================================
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                            Image(systemName: isDollar ? "dollarsign.circle.fill" : "eurosign.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(hue: 0.286, saturation: 0.992, brightness: 0.489))
                            Text("Tip Calculator")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.top)
                        }
                        
                        
                        Button(action: {
                            isDollar.toggle()
                        }) {
                            Text(isDollar ? "Switch to Euro" : "Switch to Dollar")
                                .foregroundColor(.blue)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(.top)



            
            //----------------------------------------------------------
            
           
            VStack {
                HStack {
                    Text("Bill Amount: ")
                    Text("\(isDollar ? "$" : "€")\(billAmount, specifier: "%.2f")")
                        .foregroundColor(.green)
                }
                Slider(value: $billAmount, in: 0...500, step: 0.01)
                    .padding()
                
            //----------------------------------------------------------
                
                
                HStack {
                    Text("Tip Percentage: ")
                    Text("\(Int(tipPercentage))%")
                        .foregroundColor(Color(hue: 0.142, saturation: 0.975, brightness: 0.794))
                }
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                    .padding()
                
                
            //----------------------------------------------------------
                
                
                HStack {
                    Text("Number of People: ")
                    Text("\(Int(numberOfPeople))")
                        .foregroundColor(Color(hue: 0.837, saturation: 0.741, brightness: 0.737))
                }
                Slider(value: $numberOfPeople, in: 1...20, step: 1)
                    .padding()
            }
            
            
    //===============================================================================
            
            //DISPLAY
            
            if showResults {
                VStack {
                    Text("Tip Amount: \(isDollar ? "$" : "€")\(tipAmount, specifier: "%.2f")")
                        .font(.title2)
                    Text("Total Amount: \(isDollar ? "$" : "€")\(totalAmount, specifier: "%.2f")")
                        .font(.title2)
                    Text("Amount per Person: \(isDollar ? "$" : "€")\(amountPerPerson, specifier: "%.2f")")
                        .font(.title2)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            
    //===============================================================================
            
            Button(action: {
                showResults.toggle()
            }) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .foregroundColor(.white)
                    .padding()
                    .background(showResults ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .background(Color(hue: 0.851, saturation: 0.077, brightness: 0.979))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

    //===============================================================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
