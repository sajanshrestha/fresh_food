//
//  ContentView.swift
//  GTracker
//
//  Created by Sajan Shrestha on 1/16/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State private var itemName = ""
    @State private var quantity = ""
    @State private var items = [Item]()
    @State private var addItem = false
    
    @EnvironmentObject var publisher: NotificationPublisher
    @EnvironmentObject var groceryTracker: GroceryTracker
    
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundImage()
                VStack {
                    if addItem {
                        VStack(alignment: .leading) {
                            
                            AddItemView(name: $itemName, quantity: $quantity)
                            
                            Button(action: {
                                
                                let item = Item(name: self.itemName, quantity: Int(self.quantity) ?? 0, purchaseDate: Date(), life: nil, category: .other)
                                self.addAnItem(item: item)
                                
                            }, label: {
                                Text("Add")
                                    .modifier(CustomButton())
                            })
                        }.padding(.horizontal)
                    }
                    
                    List {
                        ForEach(groceryTracker.items) { item in
                            NavigationLink(destination: DetailView(item: item)) {
                                HStack {
                                    Text(item.name)
                                        .foregroundColor(item.category == .other ? .green : .red)
                                    Spacer()
                                    Text(item.purchaseDate.getMediumFormat())
                                        .font(.subheadline)
                                    Divider()
                                    Image(systemName: "timer")
                                        .foregroundColor(item.life != nil ? .green : .gray)
                                        .font(.title)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Grocery Items")
                }
                .navigationBarItems(trailing: Image(systemName: addItem ? "checkmark.circle" : "plus.circle").font(.title).onTapGesture {
                    withAnimation(Animation.easeIn(duration: 0.5)) {
                        self.addItem.toggle()
                    }
                })
                    .onAppear {
                        print(self.groceryTracker.items)
                }
            }
        }
    }
}

extension HomeView {
    
    func addAnItem(item: Item) {
        guard !itemName.isEmpty && !quantity.isEmpty else {return}
        self.groceryTracker.addItem(item: item)
    }
    
    func delete(at offsets: IndexSet) {
        groceryTracker.items.remove(atOffsets: offsets)
        groceryTracker.save(items: groceryTracker.items)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
