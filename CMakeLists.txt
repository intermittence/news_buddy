cmake_minimum_required(VERSION 3.15)
project(news_buddy VERSION 0.1.0)
set(CMAKE_CXX_STANDARD 17)
if(NOT UNIX)
	message(SEND_ERROR "supported os: UNIX\n")
endif()
# include module
include(GNUInstallDirs)
#=============================
# Define targets
#=============================
# source
file(GLOB SRC_ROOT "src/*.cpp" "src/*.h" "src/*.hpp" "src/*.ipp")
set(SERVER_SRC ${SRC_ROOT})
# server runtime
add_executable(${PROJECT_NAME} ${SERVER_SRC})
target_include_directories(
	${PROJECT_NAME} 
	PUBLIC
		$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${PROJECT_NAME}_server")
# dependencies
find_package(Boost 1.68 REQUIRED iostreams system regex filesystem coroutine)
# find openssl 
find_package(OpenSSL 1.0.2 REQUIRED SSL)
target_link_libraries(
	${PROJECT_NAME}
	PUBLIC
		OpenSSL::SSL
		Boost::system
		Boost::iostreams
		Boost::regex
		Boost::filesystem
		Boost::coroutine
)