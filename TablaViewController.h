//
//  TablaViewController.h
//  Laboratorio4
//
//  Created by Marcos on 2/3/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

// Donde guardamos las pulsaciones
int intScore;

// Para guardar y ubicar y mostrar nuevos scores
// Para éste ejerciio NO usaremos datos persistentes, simplemente un array en memoria con valores de referencia precargados
NSMutableArray * scores;
NSUInteger pos;

// Para ubicar la linea de la tabla donde quedó el score
NSUInteger posLinScore;

@interface TablaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tablaScores;

@end
