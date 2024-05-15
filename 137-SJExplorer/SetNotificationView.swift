//
//  SetNotificationView.swift
//  137-SJExplorer
//
//  Created by Dennis Shih
//

import SwiftUI

struct SetNotificationView: View {
    @State private var notifyPermission = false
    @State private var dayOfWeek:String = ""
    @State private var hour = 1
    @State private var minute = 1
    
    let dayToNumber: [String: Int] = [
        "Monday": 2,
        "Tuesday": 3,
        "Wednesday": 4,
        "Thursday": 5,
        "Friday": 6,
        "Saturday": 7,
        "Sunday": 1
    ]
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0xd4b47c), Color(hex: 0x7c9cd4), Color(hex: 0x4a5d7f)]), startPoint: .trailing, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                VStack {
                    Image(.logo).resizable().frame(width: 100, height: 100)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 400, height: 500)
                        .padding(10)
                        .foregroundColor(Color(hex: 0x7C91aa))
                        .position(x:geo.size.width/2, y:geo.size.height/3)
                    
                    
                }
                VStack (alignment:.center){
                    
                    Text("Set Reminders")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    
                    Spacer()
                        .frame(height:50)
                    HStack {
                        Text("Day of Week")
                        Spacer()
                        TextField("Day of Week", text: $dayOfWeek)
                            .frame(width: geo.size.width/2, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 2))
                            /*.position(x:geo.size.width/2, y:geo.size.width/4)*/
                        
                    }
                    HStack {
                        Text("Hour (Enter 1-24)")
                        Spacer()
                        TextField("Hour", value: $hour, formatter: NumberFormatter())
                            .frame(width: geo.size.width/2, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 2))
                            
                    }
                    HStack {
                        Text("Minute (Enter 1-60)")
                        Spacer()
                        
                        TextField("Minute", value: $minute, formatter: NumberFormatter())
                            .frame(width: geo.size.width/2, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 2))
                    }
                    
                        
                        
                    Button("Set"){
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,.sound]) {
                            success, error in
                            if success {
                                notifyPermission=true
                                print("all set")
                            } else if let error {
                                print(error.localizedDescription)
                                return
                            }
                        }
                       
                        print(hour)
                        print(minute)
                        let content = UNMutableNotificationContent()
                        print("day: ", dayOfWeek)
                        if let dayNumber = dayToNum(day: dayOfWeek) {
                            print("The day of the week is \(dayNumber).")
                        } else {
                            print("Invalid day provided.")
                            return
                        }
                        
                        var dateComponents = DateComponents()
                        dateComponents.calendar = Calendar.current
                        dateComponents.weekday = dayToNum(day: dayOfWeek)
                        dateComponents.hour = hour
                        dateComponents.minute=minute
                        
                        content.title = "Reminder"
                        content.subtitle = "Go out and explore!"
                        content.sound = UNNotificationSound.default
                        
                        /*
                         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                         */
                        let trigger = UNCalendarNotificationTrigger(
                            dateMatching: dateComponents, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.black)
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                }
            }
        }
    }
    
    func dayToNum(day: String) -> Int? {
        print(dayToNumber[day])
        return dayToNumber[day]
    }
}

#Preview {
    SetNotificationView()
}
