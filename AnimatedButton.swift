//
//  AnimatedButton.swift
//  animaciones
//
//  Created by Jose on 11/4/24.
//

import SwiftUI

struct AnimatedButton: View {
      
@State var recordBegin:Bool = false
@State var recording:Bool = false
@Binding var goToDibujarVista:Bool
        
var body: some View {
        
            ZStack {
                
                RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                //Insertamos el cuadrado redondeado, con el Micro dentro
                    .frame(width: recordBegin ? 60 : 250, height: 60)
                    .foregroundColor(recordBegin ? .red : .green)
                    .overlay(
                        Image(systemName: "mic.fill")
                            .font(.system(.title))
                            .foregroundColor(.white)
                            .scaleEffect(recording ? 0.7 : 1)
                    )
                RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                //Definimos el borde.
                //Trim se usa para animar el borde; especifica, junto con stroke, qué parte del borde se va a dibujar, dependiendo de la var de Estado recordBegin
                    .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: recordBegin ? 70 : 260, height: 70)
                    .foregroundColor(.green)
            }
            .onTapGesture {
                //Animación para el cambio de rectángulo a círculo, controlada por la variable de Estado, recordBegin
                withAnimation(Animation.spring()) {
                    self.recordBegin.toggle()
                }
                //Animación para el icono del Micro, que no para hasta que volvemos a pulsar
                //Controlada por la variable de Estado recording
                withAnimation(Animation.spring().repeatForever().delay(0.9)) { self.recording.toggle()
                }
                
                // Activar la navegación a DibujarVista al terminar la animación
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            goToDibujarVista = true
                    }
            }
    }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton(goToDibujarVista : .constant(false))
    }
}
