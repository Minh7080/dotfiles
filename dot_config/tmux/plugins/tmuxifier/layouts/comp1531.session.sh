# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Desktop/unsw/comp1531"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "comp1531"; then
    new_window "local"
    run_cmd "ls"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/mnt/UNSW_remote/Workspace/comp2521"
