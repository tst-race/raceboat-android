# Add a custom target named 'run_raceboat'
add_custom_target(run_raceboat
        # Step 2: Specify the command to run the raceboat executable
        COMMAND ${CMAKE_CURRENT_BINARY_DIR}/raceSdkCommon
        # Step 3: Specify the dependency on the raceboat executable
        DEPENDS raceSdkCommon
        # Step 4: Provide a description for the custom target (optional)
        COMMENT "Running raceboat"
)