# Basic nushell configuration
let-env config = {
    show_banner: false
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
    }
    keybindings: []
} 