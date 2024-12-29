 static char normbgcolor[] = "{color0}";
 static char normbordercolor[] = "{color0}";
 static char normfgcolor[] = "{color7}";
 
 static char selfgcolor[] = "{color6}";
 static char selbordercolor[] = "{color0}"; 
 static char selbgcolor[] = "{color0}";
 
 static char *colors[][3]      = {{     
	/*                fg           bg         border                         */  
      	[SchemeNorm] = {{ normfgcolor,     normbgcolor,   normbordercolor }}, // unfocused wins   
	[SchemeSel]  = {{ selfgcolor,      selbgcolor,    selbordercolor }},  // the focused win
