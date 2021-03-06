class users::mythmon {
    $username = "mythmon"

    include zsh

    user { "${username}":
        ensure     => present,
        home       => "/home/${username}",
        gid        => "users",
        groups     => ['users', 'wheel'],
        managehome => true,
        shell      => '/bin/zsh',
        require    => Package['zsh'],
    }

    file {
        "${username}-tmp":
            path => "/home/${username}/tmp",
            ensure => directory,
            owner => "${username}",
            group => "users";
        "${username}-bin":
            path => "/home/${username}/bin",
            ensure => directory,
            owner => "${username}",
            group => "users";
    }

    os::user_config          { "${username}": }
    zsh::user_config         { "${username}": }

    vim::user_config         { "${username}": pathogen => true }
    vim::align               { "${username}": }

    conky::user_config       { "${username}": }
    openbox::user_config     { "${username}": }
    ruby::dev::user_config   { "${username}": }
    puppet::dev::user_config { "${username}": }
}
