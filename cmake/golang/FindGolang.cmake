
set (GO_PATHS
    /usr/bin
    /usr/local/bin
)

find_program(Golang_GO_EXECUTABLE
    NAMES go
    PATHS ${GO_PATHS}
)

if (Golang_GO_EXECUTABLE)
    execute_process(COMMAND ${Golang_GO_EXECUTABLE} version
        OUTPUT_VARIABLE var
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    set (_golang_version_regex [[(go([0-9]+)(\.([0-9]+)(\.([0-9]+))?)?.*)]])
    if (var MATCHES "go version ${_golang_version_regex}")
        set (Golang_VERSION_STRING "${CMAKE_MATCH_1}")
        set (Golang_VERSION_MAJOR "${CMAKE_MATCH_2}")
        
        if (CMAKE_MATCH_4)
            set (Golang_VERSION_MINOR "${CMAKE_MATCH_4}")
        else()
            set (Golang_VERSION_MINOR 0)
        endif()

        if (CMAKE_MATCH_6)
            set (Golang_VERSION_PATCH "${CMAKE_MATCH_6}")
        else()
            set (Golang_VERSION_PATCH 0)
        endif()

        set (Golang_VERSION "${Golang_VERSION_MAJOR}.${Golang_VERSION_MINOR}.${Golang_VERSION_PATCH}")
    endif()
else()
    set (Golang_GO_EXECUTABLE Golang_GO_EXECUTABLE-NOTFOUND)
endif()

mark_as_advanced(
    Golang_GO_EXECUTABLE
)