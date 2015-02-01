//
//  ViewController.h
//  Laboratorio4
//
//  Created by Marcos on 1/29/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

int intScore;
int intSegundos;
NSTimer * timer;

// Como usaremos el mismo botòn para empezar el juego y para contar los taps ... usaremos una variable para saber si ya empezó o no
bool bolJugando;

@interface TapViewController : UIViewController


// Propiedades
@property (weak, nonatomic) IBOutlet UILabel *lblContador;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UIButton *btnMensaje;




// Acciones

// NOTA: este lo definì como push solamenet y me duplicaba el contador... luego lo borre desde el editor y marca error ... asì que hay que averiguar cuàl es la forma correcta de eliminar un vínculo ya creado
- (IBAction)btnPresionado:(id)sender;

- (IBAction)btnPresionaSuelta:(id)sender;

@end

