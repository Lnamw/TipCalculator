//
//  ViewController.m
//  Tip Calculator
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "MainViewController.h"
#import "TipsCalculator.h"

@interface MainViewController () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property(strong, nonatomic)NSArray *tipValues;


@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalBillLabel;
@property (weak, nonatomic) IBOutlet UIButton *calculateTipButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerViewBottomConstraint;

//- (IBAction)textFieldDoneEditing:(id)sender;
//- (IBAction)textField2DoneEditing:(id)sender;
- (IBAction)calculateTipButtonPressed:(id)sender;

@end

float billAmount;
float tipPercent;

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.calculateTipButton.enabled = NO;
    
//    if (_billTextField != nil && _tipTextField != nil ) {
//        self.calculateTipButton.enabled = YES;
//
//    }
    
    self.tipValues = @[@"0%", @"5%", @"10%", @"15%", @"20"];
    
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grTapped:)];
    [self.view addGestureRecognizer:gr];
    
    //self.calculateTipButton.hidden = YES;
    
    [self.pickerView removeFromSuperview];
    
    self.tipTextField.inputView = self.pickerView;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)textFieldDoneEditing:(id)sender {
//    [sender resignFirstResponder];
//}
//
//- (IBAction)textField2DoneEditing:(id)sender {
//    [sender resignFirstResponder];
//}



- (IBAction)calculateTipButtonPressed:(id)sender {

    billAmount = [self.billTextField.text floatValue];
    tipPercent = [self.tipTextField.text floatValue];
    
    TipsCalculator *calculateTip = [[TipsCalculator alloc] init];
    
    float grossTotal = [calculateTip calculateTipWithTotalBill:billAmount andPercent:tipPercent];
    
    self.totalBillLabel.text = [NSString stringWithFormat:@"Your gross total is £%.2f", grossTotal];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.billTextField resignFirstResponder];
    [self.tipTextField resignFirstResponder];
    
    return YES;
}



//-(void)textFieldDidEndEditing:(UITextField *)textField {
//    [self.billTextField resignFirstResponder];
//}

-(void)grTapped:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - UIPickerViewDelegate 

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.tipTextField.text = self.tipValues[row];
}

#pragma mark - UIPickerViewDataSource
//How many section:
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// How many rows:
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.tipValues.count;
}

//name of the row:
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.tipValues[row];
}

@end













