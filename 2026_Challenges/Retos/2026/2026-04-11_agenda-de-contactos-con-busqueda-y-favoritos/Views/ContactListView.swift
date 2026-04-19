import SwiftUI

struct ContactListView: View {
    @StateObject var viewModel = ContacsViewModel()
    @State private var showFormSheet: Bool = false
    var body: some View {
        NavigationStack {
            if viewModel.contacts.isEmpty {
                EmptyView()
            } else {
                List {
                    ForEach($viewModel.contacts){ $contact in
                        ContactComponentView(contact: contact, isFavorite: $contact.isFavorite)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Contactos")
                .toolbar {
                    Button {
                        self.showFormSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: self.$showFormSheet) {
                        FormContactView(viewModel: self.viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    ContactListView(viewModel: ContacsViewModel())
}
