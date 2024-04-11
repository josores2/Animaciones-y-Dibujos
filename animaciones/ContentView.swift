//
//  ContentView.swift
//  animaciones
//
//  Created by Jose on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var isLoading = false
    
    @State private var progress: CGFloat = 0.0
    
    
    @State var goToDibujarVista = false
    
    var body: some View {
        NavigationView{
        ScrollView{
        VStack{
                // BotonAnimado con NavigationLink
                NavigationLink(destination: DibujarVista(), isActive: $goToDibujarVista)
                {
                    EmptyView()
                }
                AnimatedButton(goToDibujarVista: $goToDibujarVista)
                                 
                                    
       //CORAZON ANIMADO ****************************************************
            ZStack {
                Text("Corazón Animado!!")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -115)
                //Llamamos a Circle() y le damos tamaño y color con .frame
                //Con ? el color variará entre los 2 valores que le indiquemos, dependiendo de la variable de estado circleColorChanged.
                //La variable de estado cambia de valor con toggle(), cuando piulsamos sobre el círculo, con el evento onTapGesture()
                Circle()
                    .frame(width: 200, height: 200) .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
                //.animation(.linear)
                Image(systemName: "heart.fill")
                    .foregroundColor(heartColorChanged ? .red : .white)
                    .font(.system(size: 100))
                    .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                // .animation(.linear)
            }
            .padding(.top,20)
            //Este tipo de animación está obsoleto, aunque funciona.
            //Si queremos animar, es mejor usar withAnimation{}, como lo hemos hecho más abajo
            //.animation(.linear)
            //.animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
            .onTapGesture {
                //.response es la duración de la transición
                //.dampingFraction es la amortiguación o rebote de la transición
                //.blenDuration es la dureza en el cambio entre los 2 estados inicial y final. La suavidad
              /*  withAnimation(Animation.spring().repeatForever().delay(0.9)) { self.recording.toggle()
                }*/
                withAnimation(.spring(response: 0.3,dampingFraction: 0.3, blendDuration: 0.3)){
                    /*De esta forma, puedo excluir lo que no quiera animar, como por ejemplo el cambio de tamaño del corazón, simplemente sacándolo de las llaves*/
                    self.circleColorChanged.toggle()
                    self.heartColorChanged.toggle()
                    self.heartSizeChanged.toggle()
                    /*Si quiero que el corazón esté latiendo al pulsarlo: withAnimation(.spring(response: 0.3,dampingFraction: 0.3, blendDuration: 0.3).repeatForever().delay(0.9)){
                     Y solamente tedría que estar activo el : self.heartColorChanged.toggle()*/
                }
            }
            
        //CIRCULO DE PROGRESO DE CARGA ANIMADO
            ZStack {
                Text("Cargando círculo animado!!")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -70)
        
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            Circle()
            .trim(from: 0, to: 0.2)
                //El círculo que se mueve, realmente es un borde relleno de verde
            .stroke(Color.green, lineWidth: 7)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses:false))
                .onAppear() {
                    self.isLoading = true
                }
            }
            .padding(30)
            //BARRA DE PROGRESO HORIZONTAL DE CARGA
            ZStack {
            Text("Cargando barra lateral!")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            RoundedRectangle(cornerRadius: 3)
            .stroke(Color.green, lineWidth: 3)
            .frame(width: 30, height: 3)
            .offset(x: isLoading ? 110 : -110, y: 0) .animation(Animation.linear(duration:1).repeatForever(autoreverses:false))
                    .onAppear() {
                        self.isLoading = true
                    }
            }
            //BARRA DE PROGRESO REAL, EN ESTE CASO , SE INCREMENTA CADA MEDIO SEGUNDO*******
            
            ZStack {
                        Text("\(Int(progress * 100))%")
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Circle()
                            .stroke(Color(.systemGray5), lineWidth: 10)
                            .frame(width: 150, height: 150)
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(Color.green, lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .rotationEffect(Angle(degrees: -90))
                    }
            .padding()
                    .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
                timer in self.progress += 0.05
                print(self.progress)
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
        
        Spacer()
        }
        }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
