workspace "Coffee"
	architecture "x64"

	configurations{
		"Debug",
		"Release",
		"Dist",
	}


	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" 

project "Coffee"
	
	location "Coffee"
	kind "SharedLib"
	language "C++"
	targetdir ("bin/" ..outputdir .. "/%{prj.name}")
	objdir	  ("bin-int/" ..outputdir .. "/%{prj.name}")  

	pchheader "copch.h"
	pchsource "Coffe/src/copch.cpp"

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system.windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"COF_PLATFORM_WINDOW",
			"COF_BUILD_DLL"
		}

		postbuildcommands {
			"{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox"
		}

	filter "configurations:Debug"
		defines{
			"COF_PLATFORM_WINDOW",
			"COF_BUILD_DLL",
			 "COF_DEBUG"
		}
		symbols "On"

		postbuildcommands {
			"{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox"
		}


	filter "configurations:Release"
		defines{
			"COF_PLATFORM_WINDOW",
			"COF_BUILD_DLL",
			 "COF_DEBUG"
		}
		optimize "On"

		postbuildcommands {
			"{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox"
		}


	filter "configurations:dist"
		defines{
			"COF_PLATFORM_WINDOW",
			"COF_BUILD_DLL",
			 "COF_DEBUG"
		}
		optimize "On"

		postbuildcommands {
			"{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox"
		}


project "Sandbox"

	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	targetdir ("bin/" ..outputdir .. "/%{prj.name}")
	objdir	  ("bin-int/" ..outputdir .. "/%{prj.name}")  

		files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs{
		"Coffee/vendor/spdlog/include",
		"Coffee/src"
	}

	links{
		"Coffee"
	}

	filter "system.windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"COF_PLATFORM_WINDOW"
		}

	filter "configurations:debug"
		defines{
			"COF_PLATFORM_WINDOW",
			 "COF_DEBUG"
		}
		symbols "On"

	filter "configurations:Release"
		defines{
			"COF_PLATFORM_WINDOW",
			 "COF_DEBUG"
		}
		optimize "On"

	filter "configurations:Dist"
		defines{
			"COF_PLATFORM_WINDOW",
			 "COF_DEBUG"
		}
		optimize "On"
