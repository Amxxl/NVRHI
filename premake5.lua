project "RTXMU"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files {
		"rtxmu/**.h",
		"rtxmu/**.cpp"
	}

	defines {
		"NOMINMAX"
	}

	--VULKAN_SDK = os.getenv("VULKAN_SDK")

	includedirs {
		"rtxmu/include",
		--"%{VULKAN_SDK}/Include",
		"thirdparty/Vulkan-Headers/include"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"

project "NVRHI-Vulkan"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files {
		"include/nvrhi/vulkan.h",
		"src/vulkan/**.h",
		"src/vulkan/**.cpp",
	}
	
	defines {
		"NVRHI_WITH_RTXMU=1",
		"VK_USE_PLATFORM_WIN32_KHR",
		"NOMINMAX"
	}

	--VULKAN_SDK = os.getenv("VULKAN_SDK")

	includedirs {
		"include",

		"rtxmu/include",

		"thirdparty/Vulkan-Headers/include"
		--"%{VULKAN_SDK}/Include",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"

project "NVRHI-D3D11"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files {
		"include/nvrhi/d3d11.h",

		"src/common/dxgi-format.h",
		"src/common/dxgi-format.cpp",

		"src/d3d11/**.h",
		"src/d3d11/**.cpp",
	}
	
	defines {
		"NVRHI_WITH_RTXMU=1",
		"NOMINMAX"
	}

	includedirs {
		"include",

		"rtxmu/include",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"

project "NVRHI-D3D12"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files {
		"include/nvrhi/d3d12.h",

		"src/common/dxgi-format.h",
		"src/common/dxgi-format.cpp",
		"src/common/versioning.h",

		"src/d3d12/**.h",
		"src/d3d12/**.cpp",
	}
	
	defines {
		"NVRHI_WITH_RTXMU=1",
		"NOMINMAX"
	}

	includedirs {
		"include",

		"rtxmu/include",
		"thirdparty/DirectX-Headers/include"
		
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"

project "NVRHI"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files {
		"include/nvrhi/nvrhi.h",
		"include/nvrhi/utils.h",

		"include/common/**.h",
		"src/common/**.cpp",

		"src/validation/**.h",
		"src/validation/**.cpp",

		"tools/nvrhi.natvis"
	}
	
	defines {
		"NVRHI_WITH_RTXMU=1",
		"NOMINMAX"
	}

	links {
		"RTXMU",
		"NVRHI-Vulkan",
		"NVRHI-D3D11",
		"NVRHI-D3D12"
	}

	includedirs {
		"include",

		"rtxmu/include",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"