//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends:
    [Friend] = [Friend(name:"Ashly", birthday: .now),
                Friend(name:"Val", birthday:
                        Date(timeIntervalSince1970: 0))]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format:   .dateTime.month(.wide).day().year())
                    
                }//end Hstack
            }//end List
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("newBirthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)  {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                        Button("save") {
                            let newFriend = Friend(name: newName, birthday: newBirthday)
                            friends.append(newFriend)
                        }//end Button
                        .bold()
                    }//end DatePicker
                }//endVstack
                .padding()
                .background(.bar)
            }//end safeAreaInset
        }//end Navigation Stack
    }//end body
}//end struct
        

#Preview {
    ContentView()
}
