import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.red))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.red))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct progressView: View {
    let currentDate = getDate(timeType: "day")
    let currentTime = getTime(timeType: "current")
    @State var progressValue1st: Float = (Float(getTime(timeType: "current"))-firstHrStartTime())/getClassLength()
    @State var progressValue2nd: Float = (Float(getTime(timeType: "current"))-secondHrStartTime())/getClassLength()
    @State var progressValue3rd: Float = (Float(getTime(timeType: "current"))-thirdHrStartTime())/getClassLength()
    @State var progressValue4th: Float = (Float(getTime(timeType: "current"))-fourthHrStartTime())/getClassLength()
    var currentHour = getTime(timeType: "hour")
    var currentMinute = getTime(timeType: "minute")
    var currentSecond = getTime(timeType: "second")
    var currentClassHour = getHour()
    var classLength = getClassLength()
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            if currentClassHour == 1{
                HStack {
                    Text("1st")
                        .padding(.horizontal,10)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 70.0)
                        .background(Color.black)
                        .cornerRadius(15)
                        .shadow(color: Color.red, radius: 2)
                    ProgressBar(value: $progressValue1st).frame(height: 20)
                }.padding(.horizontal, 10)
            }else if currentClassHour == 2{
                HStack {
                    Text("2nd")
                        .padding(.horizontal,10)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 70.0)
                        .background(Color.black)
                        .cornerRadius(15)
                        .shadow(color: Color.red, radius: 2)
                    ProgressBar(value: $progressValue2nd).frame(height: 20)
                }.padding(.horizontal, 10)
            }else if currentClassHour == 3{
                HStack {
                    Text("3rd")
                        .padding(.horizontal,10)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 70.0)
                        .background(Color.black)
                        .cornerRadius(15)
                        .shadow(color: Color.red, radius: 2)
                    ProgressBar(value: $progressValue3rd).frame(height: 20)
                }.padding(.horizontal, 10)
            }else if currentClassHour == 4{
                HStack {
                    Text("4th")
                        .padding(.horizontal,10)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 70.0)
                        .background(Color.black)
                        .cornerRadius(15)
                        .shadow(color: Color.red, radius: 2)
                    ProgressBar(value: $progressValue4th).frame(height: 20)
                }.padding(.horizontal, 10)
            }else if currentClassHour == -1{
                Text("Class Hasn't Started Yet")
                    .padding(.horizontal,10)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color.red, radius: 2)
            }

        }
    }
    
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
    progressView()
    }
}
