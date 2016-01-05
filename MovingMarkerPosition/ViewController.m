#import "ViewController.h"
@import GoogleMaps;
@import CoreLocation;

@interface ViewController ()<GMSPanoramaViewDelegate>

@property (strong, nonatomic) IBOutlet GMSPanoramaView *streetView;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

GMSPanorama* currentPanorama;

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self moveToNextPanorama:@"DTn37FV8mJNg6G3oMaPhhQ"];
    self.streetView.delegate = self;
    
    // Move marker about
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                  target:self
                                                selector:@selector(moveToNextPanoEvent)
                                                userInfo:nil
                                                 repeats:YES];
    
}

#pragma mark - ViewController class extension methods

-(void) moveToNextPanoEvent {
    GMSPanorama *panorama = currentPanorama.links[1];
    [self moveToNextPanorama:panorama.panoramaID];
}

-(void) moveToNextPanorama:(NSString*) panoId {
    [self.streetView moveToPanoramaID:panoId];
    
}

-(void)panoramaView:(GMSPanoramaView *)view didMoveToPanorama:(GMSPanorama *)panorama{
    currentPanorama = panorama;
}


@end
