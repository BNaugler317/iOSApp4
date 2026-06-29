import SwiftUI

struct CircularProgressView: View {
    
    var progress: Double
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.25)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(lineWidth: 15)
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(progress * 100))%")
                .font(.title2)
                .bold()
        }
        .frame(width: 120, height: 120)
       
    }
}

#Preview {
    CircularProgressView(progress: 0.45)
}
