//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends:
    [Friend] = [Friend(name:"Ashly", birthday: .now),
                Friend(name:"Val", birthday:
                        Date(timeIntervalSince1970: 0))]
    @Environment(\.modelContext) private var context
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
                            context.insert(newFriend)
                            newName = ""
                            newBirthday = .now
                        }//end Button
                        .bold()
                        
                        .modelContainer(for: Friend.self, inMemory: true)
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
