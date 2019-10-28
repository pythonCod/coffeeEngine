#pragma once
#include "core.h"

namespace Coffee{

	class COFFEE_API Application
	{
		public:
			Application();
			virtual ~Application();
			void run();
	};
	// define this in your client
	Application* CreateApplication();
}

