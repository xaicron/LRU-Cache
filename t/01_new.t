use strict;
use warnings;
use LRU::Cache;
use Test::More;

subtest 'new' => sub {
    ok my $lru = LRU::Cache->new;
    isa_ok $lru, 'LRU::Cache';
    done_testing;
};

subtest 'new2' => sub {
    ok my $lru = LRU::Cache->new(5);
    is $lru->limit, 5;
    done_testing;
};

done_testing;

