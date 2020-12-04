import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.red))
                
                /*
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.red))
                    .animation(.linear)
                 */
            }.cornerRadius(45.0)
        }
    }
}

struct progressView: View {
    let currentDate = getDate(timeType: "day")
    let currentTime = getTime(timeType: "current")
    @State var progressValue1: Float = Float(getTime(timeType: "current")-((8*3600)+(0*60)))/Float((1*3600)+(20*60))
    @State var progressValue2: Float = Float(getTime(timeType: "current")-((9*3600)+(35*60)))/Float((1*3600)+(20*60))
    @State var progressValue3: Float = Float(getTime(timeType: "current")-((11*3600)+(15*60)))/Float((1*3600)+(20*60))
    @State var progressValue4: Float = Float(getTime(timeType: "current")-((13*3600)+(15*60)))/Float((1*3600)+(20*60))
    let currentAMPM = getAMPM()
    var currentHour = getTime(timeType: "hour")
    var currentMinute = getTime(timeType: "minute")
    var currentSecond = getTime(timeType: "second")
    var currentClassHour = getHour()
    
    var text:String {
        switch currentClassHour {
        case 1:
            return "1st"
        case 2:
            return "1st"
        case 3:
            return "1st"
        case 4:
            return "1st"
        default:
            return "AA"
        }
    }
    var progressValue:Binding<Float> {
        switch currentClassHour {
        case 1:
            return $progressValue1
        case 2:
            return $progressValue2
        case 3:
            return $progressValue3
        default:
            return $progressValue4
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentAMPM)
            HStack {
                Text(text)
                    .padding(.horizontal,10)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 70.0)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color.red, radius: 2)
                ProgressBar(value: progressValue).frame(height: 20)
            }.padding(.horizontal, 10)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
    progressView()
    }
}
