//
//  C04_2_ItemFormView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/04/26.
//
import SwiftUI

struct C04_2_ItemFormView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: C04_2_ListViewModel
    @State private var title: String = ""
    var body: some View {
        Form {
            Section("Item Title") {
                TextField("Title", text: self.$title)
            }
        }
        Spacer()
        VStack {
            Button("Save") {
                self.viewModel.addItem(text: title)
                self.dismiss()
            }
        }
    }
}
