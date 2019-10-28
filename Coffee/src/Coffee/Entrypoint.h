#pragma once

#ifdef COF_PLATFORM_WINDOW

extern Coffee::Application* Coffee::CreateApplication();

int main(int argc, char** argv) {


	Coffee::Log::init();
	COF_CORE_WARN("Initialized log ...");
	COF_APP_INFO("Client Started ...");


	auto app = Coffee::CreateApplication();
	app->run();
	delete app;
}
#endif // COF_PLATFORM_WINDOW

