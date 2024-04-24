//
//  ContentView.swift
//  Heads Up #2
//
//  Created by Rohit Vedulla on 4/21/24.
//

import SwiftUI
import SwiftData
import UIKit

struct ContentView: View {
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]
    //
    //    var body: some View {
    //        NavigationSplitView {
    //            List {
    //                ForEach(items) { item in
    //                    NavigationLink {
    //                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
    //                    } label: {
    //                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
    //                    }
    //                }
    //                .onDelete(perform: deleteItems)
    //            }
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarTrailing) {
    //                    EditButton()
    //                }
    //                ToolbarItem {
    //                    Button(action: addItem) {
    //                        Label("Add Item", systemImage: "plus")
    //                    }
    //                }
    //            }
    //        } detail: {
    //            Text("Select an item")
    //        }
    //    }
    //
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(timestamp: Date())
    //            modelContext.insert(newItem)
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            for index in offsets {
    //                modelContext.delete(items[index])
    //            }
    //        }
    //    }
    //}
    
    
    var body: some View{
        storyboardview().edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
    
struct storyboardview: UIViewControllerRepresentable{
    func makeUIViewController(context content: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Screen", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home" )
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
