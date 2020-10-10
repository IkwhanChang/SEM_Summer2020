//
//  CoffeeDetail.swift
//  SEM_Summer
//
//  Created by Matthew Chang on 10/7/20.
//  Copyright © 2020 Matthew Chang. All rights reserved.
//

import SwiftUI

struct CoffeeDetail: View {
    @State var addAction: () -> ()
   var coffee: Coffee
    @State var showsAlert = false
    var body: some View{
        VStack {
            Image(coffee.imageName)
                .resizable()
                .scaledToFit()
            ScrollView{

                Text(coffee.name)
                    .kerning(4)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                Text(coffee.sub)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding()

                Text("DESCRIPTION")
                    .kerning(4)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Text(coffee.description)
                    .font(.body).foregroundColor(Color.gray).padding()
                Spacer()
                Spacer()
                Button(action: {
                    // your action here
                    self.addAction()
                    self.showsAlert.toggle()
                }, label:{
                    Text("ADD ITEM")
                        .font(.subheadline)
                    Text("$" + String(format: "%.2f", coffee.price)).font(.subheadline)
                }).alert(isPresented: self.$showsAlert) {
                    Alert(title: Text(coffee.name+" is added in your cart!"))
                }
                Spacer()
            }

            
        }
        .navigationBarTitle(Text(""), displayMode: .automatic)
    }
}

struct CoffeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetail(addAction: {}, coffee: coffeeData[0])
    }
}
