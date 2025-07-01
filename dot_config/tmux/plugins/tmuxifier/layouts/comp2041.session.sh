# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/mnt/UNSW_remote/Workspace/comp2041"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "comp2041"; then

  new_window "local"
  run_cmd "ls"
  new_window "remote"
  run_cmd "jack-in"
  run_cmd "cd Workspace/comp2041"
  run_cmd "clear"
  run_cmd "ls"
  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
