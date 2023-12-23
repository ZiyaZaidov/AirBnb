//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @State var destination = ""
    @State private var selectedOptions: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuest = 0
    
    var body: some View {
        
        //        SearchView
        VStack {
            
            HStack {
                Button {
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            //            MARK: Show guest count
            
            VStack (alignment: .leading) {
                if selectedOptions == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.medium)
                        TextField("Search Destination",text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsePickerView(title: "Where", description: "Add destination")
                }
            }
            .frame(height: selectedOptions == .location ? 80 : 60)
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation {
                    selectedOptions = .location
                }
            }
            
            //            MARK: Show dates
            
            VStack(alignment: .leading) {
                
                if selectedOptions == .dates {
                    
                  Text("When your's trip")
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    VStack {
                        DatePicker("From",selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To",selection: $endDate, displayedComponents: .date)
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    
                } else {
                    CollapsePickerView(title: "When", description: "Add dates")
                    
                }
            }
            .frame(height: selectedOptions == .dates ? 120 : 60)
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation {
                    selectedOptions = .dates
                }
            }
            //            MARK: Show guest count
            VStack(alignment: .leading) {
                if selectedOptions == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numberOfGuest) Adults")
                    } onIncrement: {
                        numberOfGuest += 1
                    } onDecrement: {
                        guard numberOfGuest > 0 else {return}
                        numberOfGuest -= 1
                    }

                } else {
                    CollapsePickerView(title: "Who", description: "Add guests")
                }
            }
            .frame(height: selectedOptions == .guests ? 80 : 60)
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation {
                    selectedOptions = .guests
                }
            }
            Spacer()
        }
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(show: .constant(false))
    }
}

struct CollapsePickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
        }
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .fontWeight(.semibold)
        .font(.subheadline)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
    }
}
