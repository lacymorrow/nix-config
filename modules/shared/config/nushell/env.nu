# Environment variables for nushell
let-env PATH = ($env.PATH | split row (char esep) | prepend "~/.local/bin")
let-env EDITOR = "vim"
let-env VISUAL = "vim" 