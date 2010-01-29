use strict;
use warnings;
use LRU::Cache;
use Test::More;
use Test::Exception;

my $lru = LRU::Cache->new;
ok $lru->put('a', 'hoge');

dies_ok { $lru->put('c') };
dies_ok { $lru->put('b') };

done_testing;

