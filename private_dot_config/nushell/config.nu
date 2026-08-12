##########
# CONFIG #
##########

$env.config.buffer_editor = "hx"
$env.config.show_banner = false
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}
$env.config.edit_mode = "vi"
$env.PROMPT_INDICATOR_VI_INSERT = "□ "
$env.PROMPT_INDICATOR_VI_NORMAL = "■ "

############
# HOMEBREW #
############

$env.PATH = ($env.PATH | prepend '/home/linuxbrew/.linuxbrew/bin')

if (which brew | length) > 0 {
  $env.HOMEBREW_NO_ANALYTICS = "1"
  $env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
  $env.HOMEBREW_CELLAR = $env.HOMEBREW_PREFIX | path join "Cellar"
  $env.HOMEBREW_REPOSITORY = $env.HOMEBREW_PREFIX | path join "Homebrew"
  $env.PATH = ($env.PATH
    | prepend ($env.HOMEBREW_PREFIX | path join "sbin")
    | prepend ($env.HOMEBREW_PREFIX | path join "bin")
  )
  $env.INFOPATH = ([($env.HOMEBREW_PREFIX | path join "share/info"), $env.INFOPATH?] | str join | str trim --right --char ':') + ':'
}

############
# INIT ENV #
############

mkdir ($nu.data-dir | path join "vendor/autoload")
try {^starship init nu | save --force ($nu.data-dir | path join "vendor/autoload/starship.nu")}
try {^carapace _carapace nushell | save --force ($nu.data-dir | path join "vendor/autoload/carapace.nu")}
try {^mise activate nu | save --force ($nu.data-dir | path join "vendor/autoload/mise.nu")}
try {^atuin init nu --disable-up-arrow | save --force ($nu.data-dir | path join "vendor/autoload/atuin.nu")}
try {^zoxide init nushell | save --force ($nu.data-dir | path join "vendor/autoload/zoxide.nu")}


###########
# ALIASES #
###########

alias k = kubectl
alias yk = ykman
alias cm = chezmoi
alias tmp = cd (mktemp -d)
