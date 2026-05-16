import SwiftUI

struct ContactListView: View {
    @StateObject var viewModel = ContacsViewModel()
    @State private var showFormSheet: Bool = false
    @State private var searchText: String = ""
    @State private var selectedCategory: Category_01? = nil
    @State private var showOnlyFavorites: Bool = false
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
                    FiltersSectionView(
                        showOnlyFavorites: $showOnlyFavorites,
                        selectedCategory: $selectedCategory
                    )
                    List {
                        ForEach(viewModel.filteredContacts(
                            searchText: self.searchText,
                            category: self.selectedCategory,
                            onlyFavorites: self.showOnlyFavorites)
                        ){ contact in
                            ContactComponentView(contact: contact) {
                                viewModel.toggleFavorite(contact: contact)
                            }
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
