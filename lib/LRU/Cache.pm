package LRU::Cache;
use strict;
use warnings;
use Carp;
our $VERSION = '0.01';

our $DEFAULT_LIMIT =  2;

sub new {
    my $class = shift;
    my $limit = shift || $DEFAULT_LIMIT;
    bless {_LIMIT => $limit, _COUNT => 0, data => {}}, $class;
}

sub put {
    my $self = shift;
    my ($key, $value) = @_;
    croak "Usage: $self->put('key', 'value')" unless defined $key and defined $value;
    $self->{data}{$key} = [$value, $self->{_COUNT}++];

    $self->gc;

    return 1;
}

sub get {
    my $self = shift;
    my $key = shift || croak "Usage: $self->get('key')";
    $self->{data}{$key}[1] = $self->{_COUNT}++;

    return $self->{data}{$key}[0];
}

sub gc {
    my $self = shift;
    return if $self->limit > scalar keys %{$self->{data}};

    my $count = 1;
    my $limit = $self->limit;
    my @keys = map {
        $_->[0];
    } grep {
        $limit < $count++;
    } sort {
        $b->[1] <=> $a->[1];
    } map {
        [$_, $self->{data}{$_}[1]];
    } keys %{$self->{data}};

    delete $self->{data}{$_} for @keys;
}

sub limit {
    my $self = shift;
    my $limit = shift || return $self->{_LIMIT};
    $self->{_LIMIT} = $limit;
}

1;
__END__

=head1 NAME

LRU::Cache -

=head1 SYNOPSIS

  use LRU::Cache;

=head1 DESCRIPTION

LRU::Cache is

=head1 METHODS

=head1 AUTHOR

Yuji Shimada E<lt>xaicron@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
