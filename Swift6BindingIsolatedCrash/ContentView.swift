//
//  ContentView.swift
//  Swift6BindingIsolatedCrash
//
//  Created by Simon Nickel on 28.06.24.
//

import SwiftUI

struct ContentView: View {
	
	private let bindingProvider = BindingProvider()
	
    var body: some View {
        VStack {
			Toggle(isOn: bindingProvider.binding) {
				Text("Toggle to Binding")
			}
        }
        .padding()
    }
}

@MainActor
class BindingProvider {
	
	private var value: Bool = false
	
	var binding: Binding<Bool> {
		Binding<Bool> { @MainActor in
			self.value
		} set: { value, transaction in
			self.value = value
		}
	}
	
}

#Preview {
    ContentView()
}
