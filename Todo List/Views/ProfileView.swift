//
//  ProfileView.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile view")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
