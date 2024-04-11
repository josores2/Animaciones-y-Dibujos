//
//  DibujarVista.swift
//  animaciones
//
//  Created by Jose on 7/4/24.
//

import SwiftUI

struct DibujarVista: View {
    var body: some View {
        
        VStack {
        ZStack {
            //Código para la FORMA
            Path() { path in
            
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
            }
            .fill(Color.purple)
            
            //Código para el BORDE negro.
            //Es igual, pero se aplica un .stroke al final.
            Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
                .stroke(Color.black, lineWidth: 5)
            }
            
            Button(action: {
               print("BOTON GRANDE PULSADO")
            }){
                Text("PULSAME!")
                    .font(.system(.title,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                //Aquí aplicamos el estilo del botón que hemos creado más abajo
                    .background(FormaBoton().fill(.red))
            }.padding()
            
            //Vamos a crear otro botón, aplicando el mismo estilo que el anterior, pero ahora lo haremos más pequeño, para ver que podemos reutilizar el código, aun siendo tamaños diferentes:
            Button(action: {
               print("BOTON PEQUEÑO PULSADO")
            }){
                Text("PULSAME!")
                    .font(.system(.title,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    //con los siguientes 3 modificadores, escalaremos el texto para que quepa en el nUevo tamaño, ya que sino no se mostrará el texto entero. Le agregamos tb un padding para que mejore la visibilidad del texto en el botón.
                    .minimumScaleFactor(0.5) // Establece el factor de escala mínimo
                    .lineLimit(1) // Limita el texto a una línea
                    .padding(8) // Añade relleno para mejorar la apariencia del botón
                //Aquí aplicamos el estilo del botón que hemos creado más abajo
                    .background(FormaBoton2().fill(.red))
            }
                   
            ZStack{
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 20))
                    path.addLine(to: CGPoint(x: 300, y: 20))
                    path.addLine(to: CGPoint(x: 300, y: 200))
                    path.addLine(to: CGPoint(x: 20, y: 200))
                    //path.addLine(to:CGPoint(x: 20, y: 20))
                    //Si comentamos esta línea, la forma no se cierra.
                    //Podemos cerrarla, si es un borde o stroke, rellenarla o crear la última linea.
                   path.closeSubpath()
                }
                //.fill(Color.green)
                .stroke(.black,lineWidth: 4)
            }
        }
    }
}


struct DibujarVista_Previews: PreviewProvider {
    static var previews: some View {
        DibujarVista()
    }
}
