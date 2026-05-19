import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var circleScale = 0.0
    @State private var logoOpacity = 0.0
    @State private var logoScale = 0.8
    @State private var circle2Scale = 0.0
    @State private var unitOffset: CGFloat = 0
    @State private var titleOpacity = 0.0

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()

                // Círculo 1 — cubre toda la pantalla
                Circle()
                    .fill(Color.green)
                    .scaleEffect(circleScale)
                    .ignoresSafeArea()

                // Unidad: círculo 2 + logo se mueven juntos
                ZStack {
                    Circle()
                        .fill(Color.red.opacity(0.8))
                        .frame(width: 100, height: 100)
                        .scaleEffect(circle2Scale)

                    Image("flor")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                }
                .offset(x: unitOffset)

                // Título — aparece a la derecha mientras la unidad se mueve
                VStack(alignment: .leading, spacing: -12) {
                    Text("enviaflores")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(.white)
                    Text(".com")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(.white)
                }
                .offset(x: 40)
                .opacity(titleOpacity)
            }
            .onAppear {
                // 1. Círculo 1 se expande
                withAnimation(.easeOut(duration: 0.4)) {
                    circleScale = 3.0
                }
                // 2. Círculo 2 aparece
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        circle2Scale = 1.0
                    }
                }
                // 3. Logo aparece
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.easeOut(duration: 0.6)) {
                        logoOpacity = 1.0
                        logoScale = 1.0
                    }
                }
                // 4. Unidad se mueve a la izquierda + título aparece simultáneo
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        unitOffset = -(UIScreen.main.bounds.width / 2 - 80)
                    }
                    withAnimation(.easeIn(duration: 0.6)) {
                        titleOpacity = 1.0
                    }
                }
                // 5. Sale todo
                /*
                 DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                     withAnimation(.easeIn(duration: 0.5)) {
                         logoOpacity = 0.0
                         circle2Scale = 0.0
                         circleScale = 0.0
                         titleOpacity = 0.0
                     }
                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                         isActive = true
                     }
                 }
                 */
            }
        }
    }
}
