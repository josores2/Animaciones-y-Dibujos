//
//  Estilos de boton.swift
//  animaciones
//
//  Created by Jose on 9/4/24.
//

import Foundation
import SwiftUI

struct FormaBoton : Shape {
    
    func path(in rect: CGRect) -> Path {
        //El tamaño x,y se coge del .frame
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x:rect.size.width,y:0), control: CGPoint(x:rect.size.width/2,y:-(rect.size.width*0.1)))
        path.addRect(CGRect(x:0,y:0,width:rect.size.width,height:rect.size.height))
        
        return path
    }
    
}

struct FormaBoton2 : Shape {
    
    func path(in rect: CGRect) -> Path {
        //El tamaño x,y se coge del .frame
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        /*path.addQuadCurve(to: CGPoint(x:rect.size.width,y:0), control: CGPoint(x:rect.size.width/2,y:-(rect.size.width*0.1)))*/
        path.addRect(CGRect(x:0,y:0,width:rect.size.width,height:rect.size.height))
        
        return path
    }
    
}
