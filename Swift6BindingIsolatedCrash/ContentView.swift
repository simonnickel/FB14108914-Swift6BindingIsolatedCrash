//
//  ContentView.swift
//  Swift6BindingIsolatedCrash
//
//  Created by Simon Nickel on 28.06.24.
//

import SwiftUI

struct ContentView: View {
	
	private let bindingProvider = BindingProvider(value: false)
	
    var body: some View {
        VStack {
			Toggle(isOn: bindingProvider.binding) {
				Text("Toggle to Binding")
			}
        }
        .padding()
    }
}

// MARK: Build fails

@MainActor
class BindingProvider {
	
	private var value: Bool
	
	init(value: Bool) {
		self.value = value
	}
	
	var binding: Binding<Bool> {
		Binding<Bool> { @MainActor in
			self.value
		} set: { @MainActor value, transaction in
			self.value = value
		}
	}
	
}

// MARK: Build succeeds, but crashing

//@MainActor
//class BindingProvider<T> {
//	
//	private var value: T
//	
//	init(value: T) {
//		self.value = value
//	}
//	
//	var binding: Binding<T> {
//		Binding<T> { @MainActor in
//			self.value
//		} set: { @MainActor value, transaction in
//			self.value = value
//		}
//	}
//	
//}

#Preview {
    ContentView()
}
