use strict;
use warnings;
use LRU::Cache;
use Test::More;

subtest 'test1' => sub {
    my $lru = LRU::Cache->new;
    ok $lru->put(a => 'hoge');
    ok $lru->put(b => 'fuga');
    ok $lru->put(c => 'piyo');
    is $lru->get('a'), undef;
    done_testing;
};

subtest 'test2' => sub {
    my $lru = LRU::Cache->new;
    ok $lru->put(a => 'hoge');
    ok $lru->put(b => 'fuga');
    is $lru->get('a'), 'hoge';
    ok $lru->put(c => 'piyo');
    is $lru->get('b'), undef;
    done_testing;
};

subtest 'test3' => sub {
    my $lur = LRU::Cache->new;
    ok $lur->put(a => 'hoge');
    ok $lur->put(b => 'fuga');

    is $lur->limit(5), 5;

    ok $lur->put(c => 'piyo');

    ok $lur->get('a');

    done_testing;
};
done_testing;
