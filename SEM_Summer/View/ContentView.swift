//
//  ContentView.swift
//  SEM_Summer
//
//  Created by Matthew Chang on 10/7/20.
//  Copyright © 2020 Matthew Chang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var addedCoffee: [Coffee]
    @State private var totalPrice = 0.0
 
    var body: some View {
        VStack(){
            Image("B_logo").resizable()
                .frame(width: 120.0, height: 90.0)
                
            
            TabView(selection: $selection){
                NavigationView {
                    List(coffeeData, id: \.self) { coffee in
                        
                        ZStack {
                            CoffeeRow( coffee: coffee)
                            NavigationLink(destination: CoffeeDetail(addAction: {
                                self.addedCoffee.append(coffee)
                                self.totalPrice = self.totalPrice + Double(coffee.price)
                            },coffee: coffee)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationBarTitle(Text("Our Menu"))
                    
                }
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("Menu")
                        }
                    }
                    .tag(0)
                NavigationView {
                    List(shopData, id: \.self) { shop in
                        ZStack {
                            ShopRow(shop: shop)
                            NavigationLink(destination: ShopDetail(shop: shop)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationBarTitle(Text("Store Locations"))
                }
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "map")
                            Text("Location")
                        }
                    }
                    .tag(1)
                VStack{
                    Text("Your Shopping Cart")
                        .font(.title)
                    List(addedCoffee, id: \.self) { coffee in
                        HStack {
                            VStack{
                                Text(coffee.name)
                                .font(.headline)
                                .foregroundColor(Color.gray)
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            VStack{
                            Text("$"+String(format: "%.2f", coffee.price)).font(.headline)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.trailing)
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            
                            
                        }
                    }
                    Text("Total: $"+String(format:"%.2f", totalPrice))
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.trailing)
                    Spacer()
                }
                .navigationBarTitle(Text("Store Locations"))
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
                .tag(2)
            }
        }
    }
}

struct ShopRow: View {
    var shop: Shop

    var body: some View {
        
        VStack{
            Image(shop.imageName1)
            .resizable()
            .scaledToFit()
            Text(shop.name)
               .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(6)
            Text(shop.address1 + " " + shop.address2)
            .font(.caption)
             .multilineTextAlignment(.leading)
             .padding(6)
            Text(shop.city)
                .font(.caption)
             .multilineTextAlignment(.leading)
             .padding(6)
        }
    }
}

struct CoffeeRow: View {
    var coffee: Coffee

    var body: some View {
        /*VStack {
            Image(coffee.imageName)
                .resizable()
                .frame(width: 200, height: 200)
            Text(coffee.name)
            Spacer()
        }*/
        Image(coffee.imageName)
            .resizable()
            .scaledToFit()
            .overlay(ZStack {
                Text(coffee.name)
                    .font(.headline)
                    .padding(6)
            }.background(Color.white)
            .opacity(0.5)
            .cornerRadius(10.0)
            .padding(.top, 100), alignment: .top)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(addedCoffee: [coffeeData[0]])
    }
}
