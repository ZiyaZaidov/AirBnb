//
//  LogInButton.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

struct LogInButton: View {
    var body: some View {
        Button {
            print("Log in")
        } label: {
            Text("Log in")
                .frame(width: 320,height: 48)
                .background(.red)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct LogInButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInButton()
    }
}
