//
//  TablaViewController.m
//  Laboratorio4
//
//  Created by Marcos on 2/3/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import "TablaViewController.h"

@interface TablaViewController ()

@end

@implementation TablaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Cargamos algunos valores de referencia en los scores
    scores = [[NSMutableArray alloc] init];
    
    // Inicializamos losv alores del array
    [scores addObject:@"061.      30/01/2014 15:00"];
    [scores addObject:@"060.      30/01/2014 15:00"];
    [scores addObject:@"058.      30/01/2014 15:00"];
    [scores addObject:@"055.      28/01/2014 15:00"];
    [scores addObject:@"054.      27/01/2014 15:00"];
    [scores addObject:@"053.      25/01/2014 15:00"];
    [scores addObject:@"050.      25/01/2014 15:00"];
    [scores addObject:@"049.      23/01/2014 15:00"];
    [scores addObject:@"047.      21/01/2014 15:00"];
    [scores addObject:@"045.      18/01/2014 15:00"];
    [scores addObject:@"043.      18/01/2014 15:00"];
    [scores addObject:@"041.      18/01/2014 15:00"];
    [scores addObject:@"040.      18/01/2014 15:00"];
    [scores addObject:@"040.      15/01/2014 15:00"];
    [scores addObject:@"040.      15/01/2014 15:00"];
    
    
    // 1. Obtenemos la fecha y hora actual y lo ponemos en un string
    NSDate *fechaHoraActual = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY hh:mm"];
    NSString *strFechaHoraActual = [dateFormatter stringFromDate: fechaHoraActual];
    
    //NSLog( @"%@",strFechaHoraActual );
    
    // 2. Obtenemos el número de pulsaciones obtenidas y lo ponemos en un string
    // Lo rellenamos con ceros a la izquierda para un string de 3 posiciones, para que quede uniforme la presentacion
    NSString *strPuntuacion = [NSString stringWithFormat:@"%03d", intScore];
    
    //NSLog( @"%@",strPuntuacion );
    
    // 3. Juntamos ambos para obtener la línea de score para mostrarlo en pantalla
    NSString *strLineaScore = [NSString stringWithFormat:@"%@.      %@", strPuntuacion, strFechaHoraActual];
    
    //NSLog( @"%@",strLineaScore );
    
    // 4. Adicionamos el score actual ...
    [scores addObject: strLineaScore];
    
    // 5. y lo ordenamos para que muestre la puntuación en orden descendente
    [scores sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return -[obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    // Ubicamos la posiciòn de nuestra puntuación para ubicar ahí la pantalla
    posLinScore = [scores indexOfObject: strLineaScore];
    
    //NSLog( @"%i", posLinScore );
    
    // Finalmente, "amarramos" la tabla con el array
    [self.tablaScores setContentOffset:CGPointMake(0,( posLinScore * 44 )) animated:YES];
    [self.tablaScores reloadData];
    
    // Iluminamos la linea del score actual, para identificarlo visualmente
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:posLinScore inSection:0];
    [self.tablaScores selectRowAtIndexPath:indexPath
                                  animated:YES
                            scrollPosition:UITableViewScrollPositionNone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [scores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [scores objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

