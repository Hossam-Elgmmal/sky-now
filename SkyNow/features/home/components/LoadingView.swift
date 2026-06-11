//
//  LoadingView.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI



struct LoadingView: View {
   @Environment(\.weatherTheme) private var theme
   @State private var dotPhase: CGFloat = 0

   var body: some View {
       ContainerCard {
           VStack(spacing: 12) {
               Image(systemName: "cloud.fill")
               .font(.system(size: 64, weight: .light))
               .foregroundStyle(
                   LinearGradient(
                       colors: [
                           theme.foregroundColor.opacity(0.55),
                           theme.foregroundColor.opacity(0.35)
                       ],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
                   )
               )

               VStack(spacing: 10) {
                   Text("Fetching weather")
                       .font(.system(size: 18, weight: .medium, design: .rounded))
                       .foregroundStyle(theme.foregroundColor.opacity(0.85))

                   HStack(spacing: 5) {
                       ForEach(0..<4) { i in
                           RoundedRectangle(cornerRadius: 2)
                               .fill(theme.foregroundColor.opacity(0.45))
                               .frame(width: 3, height: dotPhase == CGFloat(i) ? 14 : 6)
                               .animation(
                                   .easeInOut(duration: 0.35),
                                   value: dotPhase
                               )
                       }
                   }
                   .frame(height: 18)
               }
               .padding(.horizontal, 16)
           }
           .padding(.vertical, 8)
           .onAppear {
               startDotCycle()
           }
       }
   }

   private func startDotCycle() {
       Timer.scheduledTimer(withTimeInterval: 0.22, repeats: true) { t in
           dotPhase = CGFloat(Int(dotPhase + 1) % 4)
       }
   }
}
