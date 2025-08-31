//
//  ContentView.swift
//  FrasesApp
//
//  Created by Dowglas Santana on 29/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var resultado = "Você será desmotivado"
    @State private var animateText = false
    @State private var buttonPressed = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            Text(resultado)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.6))
                        .shadow(radius: 10)
                )
                .padding(.horizontal, 30)
                .scaleEffect(animateText ? 1.05 : 1.0)
                .opacity(animateText ? 1 : 0.6)
                .animation(.easeInOut(duration: 0.6), value: animateText)
                .onChange(of: resultado) { _ in
                    animateText = false
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                        animateText = true
                    }
                }
            
            Button {
                let randomNumber = Int.random(in: 0..<frasesDesmotivacionais.count)
                resultado = frasesDesmotivacionais[randomNumber]
            } label: {
                Text("💀 Nova desmotivação")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.vertical, 15)
                    .padding(.horizontal, 30)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.indigo, Color.blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .clipShape(Capsule())
                    )
                    .foregroundColor(.white)
                    .shadow(radius: 8)
                    .scaleEffect(buttonPressed ? 0.9 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: buttonPressed)
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in buttonPressed = true }
                    .onEnded { _ in buttonPressed = false }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("lovepik-sky-background-png-image_401064177_wh1200")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 4)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.2),
                            Color.white.opacity(0.1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        )
    }
}

#Preview {
    ContentView()
}
