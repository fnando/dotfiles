#
# bash completion support for RubyGems.
#
# Copyright (C) 2010 Nando Vieira <http://simplesideias.com.br>
# Distributed under the MIT License.
#
# Usage:
# Just add the following line to your ~/.bash_profile or equivalent.
#
#   source ~/.gem_completion.sh
#
# Changelog:
# Jul 14 10 - Added gem list to several commands.
#

_gem ()
{
    local cmd=${COMP_WORDS[0]}
    local subcmd=${COMP_WORDS[1]}
    local cur=${COMP_WORDS[COMP_CWORD]}

    COMMANDS="
        open build cert check cleanup contents dependency
        environment fetch generate_index help install list
        lock migrate mirror outdated owner pristine push
        query rdoc search server sources space specification
        stale tumble uninstall unpack update webhook which yank
    "

    COMMON_OPTIONS="
        --help --verbose --no-verbose --quiet
        --config-file --backtrace --debug"

    REMOTE_OPTIONS="
        --local --remote --both --bulk-threshold
        --source --http-proxy --no-http-proxy
        --update-sources --no-update-sources
    "

    BUILD_OPTIONS=$COMMON_OPTIONS

    CERT_OPTIONS="
        $COMMON_OPTIONS
        --add --list --remove --build --certificate
        --private-key --sign
    "

    CHECK_OPTIONS="
        $COMMON_OPTIONS
        --verify --alien --test --version
    "

    CLEANUP_OPTIONS="
        $COMMON_OPTIONS
        --dryrun
    "

    CONTENTS_OPTIONS="
        $COMMON_OPTIONS
        --version --all --spec-dir --lib-only
        --no-lib-only --prefix --no-prefix
    "

    DEPENDENCY_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --version --platform --prerelease --no-prerelease
        --reverse-dependencies --no-reverse-dependencies --pipe
    "

    FETCH_OPTIONS="
        $COMMON_OPTIONS
        --version --platform --bulk-threshold --source
        --prerelease --no-prerelease --http-proxy --no-http-proxy
    "

    GENERATE_INDEX_OPTIONS="
        $COMMON_OPTIONS
        --directory --legacy --no-legacy --modern --no-modern
        --update --rss-gems-host --rss-host --rss-title
    "

    HELP_OPTIONS="
        $COMMON_OPTIONS
        $COMMANDS
        commands
    "

    INSTALL_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --platform --version --prerelease --no-prerelease --install-dir
        --bindir --rdoc --no-rdoc --ri --no-ri --env-shebang --no-env-shebang
        --force --no-force --test --no-test --wrappers --no-wrappers --trust-policy
        --ignore-dependencies --include-dependencies --format-executables --no-format-executables
        --user-install --no-user-install --development
    "

    LIST_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --installed --no-installed --version --details --no-details --versions --no-versions
        --all --prerelease --no-prerelease
    "

    LOCK_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --installed --no-installed --details --no-details
        --all --prerelease --no-prerelease
    "

    OUTDATED_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --platform
    "

    OWNER_OPTIONS="
        $COMMON_OPTIONS
        --add --remove --http-proxy --no-http-proxy
    "

    PRISTINE_OPTIONS="
        $COMMON_OPTIONS
        --all --version
    "

    PUSH_OPTIONS="
        $COMMON_OPTIONS
        --http-proxy --no-http-proxy
    "

    QUERY_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --installed --no-installed --version --name-matches --details --no-details
        --versions --no-versions --all --prerelease --no-prerelease
    "

    RDOC_OPTIONS="
        $COMMON_OPTIONS
        --all --rdoc --no-rdoc --overwrite --no-overwrite --version
    "

    SEARCH_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --installed --no-installed --version --details --no-details
        --versions --no-versions --all --prerelease --no-prerelease
    "

    SERVER_OPTIONS="
        $COMMON_OPTIONS
        --port --dir --daemon --no-daemon --bind
    "

    SOURCES_OPTIONS="
        $COMMON_OPTIONS
        --add --list --remote --clear-all --update --http-proxy --no-http-proxy
    "

    SPECIFICATION_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --version --platform --all --ruby --yaml --marshal
    "

    UNINSTALL_OPTIONS="
        $COMMON_OPTIONS
        --all --no-all --ignore-dependencies --no-ignore-dependencies
        --executables --no-executables --install-dir --bindir
        --user-install --no-user-install --version --platform
    "

    UNPACK_OPTIONS="
        $COMMON_OPTIONS
        --target --version
    "

    UPDATE_OPTIONS="
        $COMMON_OPTIONS
        $REMOTE_OPTIONS
        --system --platform --prerelease --no-prerelease --install-dir
        --bindir --rdoc --no-rdoc --ri --no-ri --env-shebang --no-env-shebang
        --force --no-force --test --no-test --wrappers --no-wrappers
        --trust-policy --ignore-dependencies --include-dependencies
        --format-executable --no-format-executable --user-install --no-user-install
        --development
    "

    WEBHOOK_OPTIONS="
        $COMMON_OPTIONS
        --http-proxy --no-http-proxy --add --remove --fire --global
    "

    WHICH_OPTIONS="
        $COMMON_OPTIONS
        --all --no-all --gems-first --no-gems-first
    "

    YANK_OPTIONS="
        $COMMON_OPTIONS
        --version --undo
    "

	case "$subcmd" in
		cleanup|contents|dependency|install|list|lock|pristine|search|uninstall|unpack)
			local gems=$(gem list | sed 's/(.*)//') ;;
		lock|open)
			local gems_with_version=$(ruby -rubygems -e 'puts Dir["{#{Gem::Specification.dirs.join(",")}}/*.gemspec"].collect {|s| File.basename(s).gsub(/\.gemspec$/, "")}') ;;
	esac

    case "$subcmd" in
        build)
            words=$BUILD_OPTIONS ;;
        cert)
            words=$CERT_OPTIONS ;;
        check)
            words=$CHECK_OPTIONS ;;
        cleanup)
            words="$gems $CLEANUP_OPTIONS" ;;
        contents)
            words="$gems $CONTENTS_OPTIONS" ;;
        dependency)
            words="$gems $DEPENDENCY_OPTIONS" ;;
        environment)
            words=$=COMMON_OPTIONS ;;
        fetch)
            words="$gems $FETCH_OPTIONS" ;;
        generate_index)
            words=$GENERATE_INDEX_OPTIONS ;;
        help)
            words=$HELP_OPTIONS ;;
        install)
            words="$gems $INSTALL_OPTIONS" ;;
        list)
            words="$gems $LIST_OPTIONS" ;;
        lock)
            words="$gems_with_version $LOCK_OPTIONS" ;;
        migrate)
            words=$COMMON_OPTIONS ;;
        mirror)
            words=$COMMON_OPTIONS ;;
        outdated)
            words=$OUTDATED_OPTIONS ;;
        open)
            words="$gems_with_version"
            ;;
        pristine)
            words="$gems $PRISTINE_OPTIONS" ;;
        push)
            words=$PUSH_OPTIONS ;;
        query)
            words=$QUERY_OPTIONS ;;
        rdoc)
            words=$RDOC_OPTIONS ;;
        search)
            words="$gems $SEARCH_OPTIONS" ;;
        server)
            words=$SERVER_OPTIONS ;;
        sources)
            words=$SOURCES_OPTIONS ;;
        space)
            words="$(gem space | sed 's/  //' | sed 's/* //')" ;;
        specification)
            words=$SPECIFICATION_OPTIONS ;;
        stale)
            words=$COMMON_OPTIONS ;;
        tumble)
            words=$COMMON_OPTIONS ;;
        uninstall)
            words="$gems $UNINSTALL_OPTIONS" ;;
        unpack)
            words="$gems $UNPACK_OPTIONS" ;;
        update)
            words=$UPDATE_OPTIONS ;;
        webhook)
            words=$WEBHOOK_OPTIONS ;;
        which)
            words=$WHICH_OPTIONS ;;
        yank)
            words=$YANK_OPTIONS ;;
        *)
            words=$COMMANDS ;;
    esac

    COMPREPLY=($(compgen -W "$words" -- $cur))
    return 0
}

complete -o default -F _gem gem
