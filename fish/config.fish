if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
	#
	# My fetch program of choice
	#
	fastfetch

	#
	# Is needed, in order to use my GPG keys for git
	#
	export GPG_TTY=$(tty)

	#
	# My PATH modifications
	#
	export PATH="$PATH:/home/lars/.cargo/bin:/home/lars/opt/intelij/current/bin:/opt/eclipse/"

	#
	# Packer Path for NVim
	#
	export PACKPATH="/home/lars/.conf/nvim/plugin"


	#
	# I am using neovim
	#
	export EDITOR=/bin/nvim

	#
	# Create an alias for lazygit
	#
	alias lg=lazygit
	
	#
	# Create an alias for bat
	#
	alias cat=bat
end

function fish_prompt
	set git_prompt (fish_git_prompt) ''
	if test -z "$git_prompt"
		set git_prompt ' ' 
	end

	if fish_is_root_user
		string join '' -- (set_color --bold green) $USER '@' (prompt_hostname) ' ' (set_color blue) (prompt_pwd) "$git_prompt" '#' ' '
	else
		string join '' -- (set_color --bold green) $USER '@' (prompt_hostname) ' ' (set_color blue) (prompt_pwd) "$git_prompt" '$' ' '
	end
end	

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
