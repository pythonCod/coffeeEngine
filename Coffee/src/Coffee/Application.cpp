#include "copch.h"
#include "Application.h"
#include "Coffee/Events/ApplicationEvent.h"
#include "Coffee/Log.h"

namespace Coffee {

	Application::Application() {

	}

	Application::~Application() {


	}

	void Application::run() {

		WindowResizeEvent e(1280, 720);

		if (e.IsInCategory(EventCategoryApplication)) {
			COF_CORE_TRACE(e); 
		}

		while (true);
	}
}