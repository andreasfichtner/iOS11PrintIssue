#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)print:(id)sender {
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.orientation = UIPrintInfoOrientationLandscape;
    pic.printInfo = printInfo;
    
    
    pic.delegate = self;
    UIMarkupTextPrintFormatter *htmlFormatter = [[UIMarkupTextPrintFormatter alloc] initWithMarkupText:@"<html>Test</html>"];
    UIPrintPageRenderer *renderer = UIPrintPageRenderer.new;
    [renderer addPrintFormatter:htmlFormatter startingAtPageAtIndex:0];
    pic.printPageRenderer = renderer;
    [pic presentAnimated:YES completionHandler:nil];
}

-(UIPrintPaper *)printInteractionController:(UIPrintInteractionController *)printInteractionController choosePaper:(NSArray *)paperList {
    CGSize pageSize = CGSizeMake(420.0, 595.0); //Size of A5
    return [UIPrintPaper bestPaperForPageSize:pageSize withPapersFromArray:paperList];
}


@end
