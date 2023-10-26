#
# Generated file, do not edit.
#

# List of Flutter plugins
list(APPEND FLUTTER_PLUGIN_LIST
  url_launcher_windows
)

# List of Flutter FFI plugins
list(APPEND FLUTTER_FFI_PLUGIN_LIST
)

# Bundled plugin libraries
set(PLUGIN_BUNDLED_LIBRARIES)

# Adding each plugin to the project
foreach(plugin ${FLUTTER_PLUGIN_LIST})
  # Adding plugin directories
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  # Linking the plugin libraries to the binary
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  # Appending bundled libraries for each plugin
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

# Adding each FFI plugin to the project
foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  # Adding FFI plugin directories
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/windows plugins/${ffi_plugin})
  # Appending bundled libraries for each FFI plugin
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)
