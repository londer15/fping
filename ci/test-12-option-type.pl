#!/usr/bin/perl -w

use Test::Command tests => 30;

for my $arg (qw(b B c C H O p Q r t)) {
    my $cmd = Test::Command->new(cmd => "fping -$arg xxx");
    $cmd->exit_is_num(1);
    $cmd->stdout_is_eq("");
    $cmd->stderr_like(qr{Usage:});
}
