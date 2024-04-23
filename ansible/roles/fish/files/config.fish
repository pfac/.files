# Load Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load asdf/rtx
eval "$(mise activate fish)"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
