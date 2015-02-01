//
//  ViewController.m
//  Laboratorio4
//
//  Created by Marcos on 1/29/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // AL CARGAR LA PANtalla pondremos STARTa l boton ... NO lo ponemos al terminar el juego porque automàticamente enviara a la pantlla de SCOREs... y al regresar entrará a ésat seción otra vez donde pondremos el texto del botón ... en teoría ... :D
    //[self.btnMensaje setTitle:@"Start" forState:UIControlStateNormal];
    //[self.btnMensaje setTitle:@" " forState:UIControlStateSelected];

    bolJugando = false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Este no sirve, pero no sé cómo borrarlo :(
- (IBAction)btnPresionado:(id)sender {}

- (IBAction)btnPresionaSuelta:(id)sender {
    
    // Si estamos jugando, contamos las pulsaciones
    if ( bolJugando == true ) {
        
        intScore++;
    
        self.lblScore.text = [NSString stringWithFormat:@"%i", intScore];
        
    // Si no estamos jugando, empezamos el juego
    } else {
        
        [self empezarJuego];
        
    }
        
        
}


- (void) empezarJuego {

    intSegundos = 10;
    intScore = 0;
    
    // Al arrancar, el colord el contador serà verde ..
    self.lblContador.textColor = [UIColor greenColor];
    
    self.lblScore.text = [NSString stringWithFormat:@"%i", intScore];
    self.lblContador.text = [NSString stringWithFormat:@"%i", intSegundos];

    // Arrancamos el timer con intervalo de 1 segundo
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector( tiempoDeJuego )
                                           userInfo:nil
                                            repeats:YES];
    
    bolJugando = true;
    
    // Quitamos el mensaje del botòn
    //[self.btnMensaje setTitle:@"" forState:UIControlStateNormal];
    //[self.btnMensaje setTitle:@"" forState:UIControlStateSelected];
    
    
}

- (void) tiempoDeJuego {
    
    intSegundos--;

    // Cuando ya falten 5 segundos, cambiaremos el color del contador a  rojo
    if ( intSegundos <= 5 ) {
        self.lblContador.textColor = [UIColor redColor];
    }
    
    self.lblContador.text = [NSString stringWithFormat:@"%i", intSegundos];
    
    if ( intSegundos == 0 ) {
        [timer invalidate];
        bolJugando = false;
    }
}

@end
