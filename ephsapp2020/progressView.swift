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
    var currentTime = getTime(timeType: "current")
    @State var progressValue1st: Float = Float(getTime(timeType: "current")-((7*3600)+(50*60)))/Float((1*3600)+(25*60))
    @State var progressValue2nd: Float = Float(getTime(timeType: "current")-((9*3600)+(20*60)))/Float((1*3600)+(25*60))
    @State var progressValue3rd: Float = Float(getTime(timeType: "current")-((10*3600)+(50*60)))/Float((1*3600)+(25*60))
    @State var progressValue4th: Float = Float(getTime(timeType: "current")-((13*3600)+(10*60)))/Float((1*3600)+(25*60))
    var currentHour = getTime(timeType: "hour")
    var currentMinute = getTime(timeType: "minute")
    var currentSecond = getTime(timeType: "second")
    
    var body: some View {
        VStack(alignment: .leading) {
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

        }
    }
    
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
    progressView()
    }
}
