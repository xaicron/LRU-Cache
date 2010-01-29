use strict;
use warnings;
use LRU::Cache;
use Test::More;
use Test::Exception;

my $lru = LRU::Cache->new();
$lru->put('a', 'hoge');

is $lru->get('a'), 'hoge';

dies_ok { $lru->get() };

done_testing;


