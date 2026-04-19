import SwiftUI

struct ContactListView: View {
    @StateObject var viewModel = ContacsViewModel()
    @State private var showFormSheet: Bool = false
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.contacts.isEmpty {
                    EmptyListView(
                        showFormSheet: $showFormSheet,
                        icon: "person",
                        caption: "Lista vacia, para agregar un nuevo contacto haz clic en el boton +")
                } else {
                    SearchBarComponentView(searchText: $searchText)
                    List {
                        ForEach($viewModel.contacts){ $contact in
                            ContactComponentView(contact: contact, isFavorite: $contact.isFavorite)
                        }
                        .onDelete { offsets in
                            viewModel.deleteContat(at: offsets)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Contactos")
            .toolbar {
                Button {
                    self.showFormSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundStyle(.blue)
                .sheet(isPresented: self.$showFormSheet) {
                    FormContactView(viewModel: self.viewModel)
                }
            }
        }
    }
}

#Preview {
    ContactListView(viewModel: ContacsViewModel())
}
