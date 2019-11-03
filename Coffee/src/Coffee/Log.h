#pragma once
#include "core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Coffee{

class COFFEE_API Log
{
public:
	static void init();
	inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
	inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

private:
	 static std::shared_ptr<spdlog::logger> s_CoreLogger;
	 static std::shared_ptr<spdlog::logger> s_ClientLogger;
};

}

// Core log macros
#define COF_CORE_ERROR(...) ::Coffee::Log::GetCoreLogger()->error(__VA_ARGS__)
#define COF_CORE_WARN(...)  ::Coffee::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define COF_CORE_INFO(...)  ::Coffee::Log::GetCoreLogger()->info(__VA_ARGS__)
#define COF_CORE_TRACE(...) ::Coffee::Log::GetCoreLogger()->trace(__VA_ARGS__)

// App log macros
#define COF_APP_ERROR(...) ::Coffee::Log::GetClientLogger()->error(__VA_ARGS__)
#define COF_APP_WARN(...)  ::Coffee::Log::GetClientLogger()->warn(__VA_ARGS__)
#define COF_APP_INFO(...)  ::Coffee::Log::GetClientLogger()->info(__VA_ARGS__)
#define COF_APP_TRACE(...) ::Coffee::Log::GetClientLogger()->trace(__VA_ARGS__)
