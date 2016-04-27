//
//  TipsCalculator.m
//  Tips calculator
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "TipsCalculator.h"

@implementation TipsCalculator

-(float)calculateTipWithTotalBill:(float)totalBill andPercent:(float)percent
{
    return ((percent / 100) *totalBill) + totalBill;
}

-(float)amountPerPersonForBill:(float)totalBill andPercent:(float)percent andnumberOfPeople:(NSInteger)people
{
    
    return [self calculateTipWithTotalBill:totalBill andPercent:percent] / people;

}

@end
