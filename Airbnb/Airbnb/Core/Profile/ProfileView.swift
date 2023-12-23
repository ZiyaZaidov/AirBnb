//
//  ProfileView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
//            MARK: Profile login
            VStack(alignment: .leading, spacing: 30) {
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                        .fontWeight(.semibold)
                        Text("Log in to start your next trip")
                    }
                }
                LogInButton()
                HStack{
                    Text("Don't have account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
            }
            
//            MARK: Settings List
            
            VStack(spacing: 24) {
                ProfileOptionView(imageName: "gear", title: "Settings")
                ProfileOptionView(imageName: "gear", title: "Accessibility ")
                ProfileOptionView(imageName: "questionmark.circle", title: "Visit the Help Center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
