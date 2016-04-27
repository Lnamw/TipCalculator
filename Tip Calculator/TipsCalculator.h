//
//  TipsCalculator.h
//  Tips calculator
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipsCalculator : NSObject

-(float)calculateTipWithTotalBill:(float)totalBill andPercent:(float)percent;

-(float)amountPerPersonForBill:(float)totalBill andPercent:(float)percent andnumberOfPeople:(NSInteger)people;


@end
