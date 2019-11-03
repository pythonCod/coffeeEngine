#pragma once
#ifdef COF_PLATFORM_WINDOW
	#ifdef COF_BUILD_DLL
		#define COFFEE_API __declspec(dllexport)
	#else
		#define COFFEE_API __declspec(dllimport)
	#endif
	#else
		#error Coffee support only Windows Platform for now!
		
#endif // COF_PLATFORM_WINDOW

#define BIT(x) (1 << x)