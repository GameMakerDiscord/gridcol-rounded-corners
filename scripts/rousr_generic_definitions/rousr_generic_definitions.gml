///@function rousr_generic_definitions()
///@extensionizer { "export": false, "docs": false }
///@desc define constants and enums for the Generic object 

enum EGenericHook { 
	Create = 0,
	Destroy,
	CleanUp,
	
	BeginStep,
	Step,
	EndStep,
	
	BeginDraw,
	Draw,
	EndDraw,
	
  BeginDrawGUI,
  DrawGUI,
  EndDrawGUI,
	
  PreDraw,
  PostDraw,
  
  LeftDown,
  LeftPressed,
  LeftReleased,
  
  RightDown,
  RightPressed,
  RightReleased,
  
  MiddleDown,
  MiddlePressed,
  MiddleReleased,
  
  MouseEnter,
  MouseLeave,
  
  MouseWheelUp,
  MouseWheelDown,
  
	Num,
}

enum EGenericType {
                   // Events Included:
	Empty,           // Create, Destroy, Clean Up, Draw
	Normal,          // Empty + Input events
	Step,            // Normal + Step
								   
  Draw,            // Normal + Draw 
	StepDraw,        // Normal + Step + Draw
                   
  DrawGUI,         // Normal + Draw GUI
  StepDrawGUI,     // Normal + Step + Draw GUI
	
	StepExt,         // Normal + Step, Begin Step, End Step
  DrawExt,         // Normal + Draw Begin, Draw End, Draw, Pre Draw, Post Draw
	StepDrawExt,     // Normal + StepExt + DrawExt
                
  DrawGUIExt,      // Normal + DrawExt, except using Draw GUI Begin, Draw GUI End, and Draw GUI Events
  StepDrawGUIExt,  // Normal + StepExt + DrawExt, except using Draw GUI Begin, Draw GUI End, and Draw GUI Events
  
	Num
	// Input Events: All Mouse Button and Mouse Position states, no keys, no gamepad, no touch.
};


