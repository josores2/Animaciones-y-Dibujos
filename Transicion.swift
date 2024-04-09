//
//  Transicion.swift
//  animaciones
//
//  Created by Jose on 6/4/24.
//

import SwiftUI

struct Transicion: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            //Dibujamos un rectángulo, fondo verde, que siempre estará visible
            //Con tapGesture, alternamos el valor de la variable de estado show, entre true y false.
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                    .overlay(
                        Text("Mostrar detalles!")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white))
                    .onTapGesture {
                        
                        withAnimation(Animation.spring()) {
                            self.show.toggle()
                        }
                    }
            //Ahora, dentro del VStack, se comprueba el valor de la variable de estado show,y y se inserta otro cuadrado, ahora morado, con los detalles que estaban ocultos al principio.
            //Al estar dentro del mismo VStack, la vista se escalará para que quepan los dos elementos.
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Hola! Aquí tenéis los detalles que antes estaban ocultos!")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white))
                //Con esta transición, se escala de 0 a su tamaño normal, y aparece/desaparece por la parte de abajo (.bottom)
                            //.transition(.scale(scale: 0, anchor: .bottom))
                //Con la transición offset, el cuadrado aparecerá de izquierda (eje x = -600), hasta la posición final.
                         .transition(.offset(x: -600, y: 0))
            }
                
        }
        
    }
}

struct Transicion_Previews: PreviewProvider {
    static var previews: some View {
        Transicion()
    }
}
