//
//  ProfileOptionView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

struct ProfileOptionView: View {
    
    let imageName: String
    let title: String
     
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

struct ProfileOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionView(imageName: "gear", title: "Settings")
    }
}
