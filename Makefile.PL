use inc::Module::Install;
name 'LRU-Cache';
all_from 'lib/LRU/Cache.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
