//
//  ShopDetail.swift
//  SEM_Summer
//
//  Created by Matthew Chang on 10/7/20.
//  Copyright © 2020 Matthew Chang. All rights reserved.
//

import SwiftUI

struct ShopDetail: View {
    var shop: Shop
    var body: some View{
        VStack {
            MapView(coordinate: shop.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            CircleImage(image: Image(shop.imageName))
            .offset(x: 0, y: -130)
            .padding(.bottom, -130)
            ScrollView{
                

                VStack(alignment: .center) {
                    Text(shop.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(shop.address1)
                        .font(.headline)
                    Text(shop.address2)
                    .font(.headline)
                    Text(shop.city)
                    .font(.headline)

                }
                .padding()

                VStack(alignment: .leading) {
                    Text("HOURS")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    List(shop.opening_hours, id: \.self) { hours in
                        HStack{
                            Text(hours.weekName).font(.body).multilineTextAlignment(.leading).frame(maxWidth: .infinity)
                            Text(hours.open)
                                .font(.body)
                            Text("to")
                                .font(.body)
                            Text(hours.close).font(.body)
                        }
                    }.environment(\.defaultMinListRowHeight, 10)
                    
                }.padding()
                
                Text(shop.description)
                    .font(.body).padding()
                Spacer()
            }

            
        }
        .navigationBarTitle(Text(""), displayMode: .automatic)
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetail(shop: shopData[0])
    }
}
