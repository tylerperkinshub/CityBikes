//
//  NetworkCell.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/18/22.
//

import SwiftUI

struct NetworkCell: View {
    
    let padding = CGFloat(8)
    let spacing = CGFloat(10)
    
    let bikeNetwork: BikeNetwork!

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: spacing) {
                Text(bikeNetwork.city?.capitalizingFirstLetter() ?? "")
                    .font(.system(size: 24, weight: .regular))
                    .minimumScaleFactor(0.7)

                
                Text(bikeNetwork.country ?? "")
                    .fontWeight(.semibold)
                Spacer()

            }
            .frame(width: 180, height: 24, alignment: .leading)
            .lineLimit(1)

            .truncationMode(.tail)
            .padding([.leading,], padding)
            
            VStack(alignment: .leading, spacing: spacing)  {
                Text(bikeNetwork.name ?? "")
                    .minimumScaleFactor(0.95)
                    .truncationMode(.tail)
                Spacer()
            }
            .frame(width: 100, height: 24, alignment: .leading)

            .padding([.leading, .trailing], spacing)
            Spacer()
        }
        .frame(width: UIScreen.screenWidth, height: 70)
        
    }
}

//struct NetworkCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkCell()
//    }
//}
