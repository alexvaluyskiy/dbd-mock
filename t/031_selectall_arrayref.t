use strict;
use warnings;

use Test::More tests => 7;

BEGIN {
    use_ok('DBD::Mock');  
	use_ok('DBI');
}

my $items_sql   = "SELECT id, name, weight FROM items";
my $items_param_sql   = "SELECT id, name, weight FROM items WHERE id = ?";

my @resultList = (
    {
        sql     => $items_param_sql,
        results => [
		    [ 'id', 'name', 'weight' ],
		    [ '2',  'coconuts',     'fairly hefty' ],
		],
    },
    {
        sql     => $items_sql,
        results => [
		    [ 'id', 'name', 'weight' ],
		    [ '2',  'coconuts',     'fairly hefty' ],
		    [ '42', 'not coconuts', 'pretty light' ],
		],
    },
);

my $dbh = DBI->connect( 'DBI:Mock:', '', '' );

{
    my $res;

    foreach $res (@resultList) {
        $dbh->{mock_add_resultset} = $res;
    }
}

{
    my $expected = [[ '2', 'coconuts', 'fairly hefty' ], [ '42', 'not coconuts', 'pretty light' ]];
    my $expected_param = [[ '2', 'coconuts', 'fairly hefty' ] ];
    
    my $res;
    #eval {
        $res = $dbh->selectall_arrayref($items_sql, undef);
    #};
    
    is_deeply($res, $expected, "Checking if selectall_arrayref without slice works.");
    
    #eval {
        $res = $dbh->selectall_arrayref($items_param_sql, undef, 2);
    #};
    
    is_deeply($res, $expected_param, "Checking if selectall_arrayref without slice works (using params).");
}

{
    my $expected = [
        { 'name' => 'coconuts', 'weight' => 'fairly hefty', 'id' => '2'},
        { 'name' => 'not coconuts', 'weight' => 'pretty light', 'id' => '42' }
    ];
    
    my $expected_param = [ { 'name' => 'coconuts', 'weight' => 'fairly hefty', 'id' => '2'} ];
    
    my $res;
    #eval {
        $res = $dbh->selectall_arrayref($items_sql, { Slice => {} });
    #};
    
    is_deeply($res, $expected, "Checking if selectall_arrayref with empty slice works.");
    
    #eval {
        $res = $dbh->selectall_arrayref($items_param_sql, { Slice => {} }, 2);
    #};
    
    is_deeply($res, $expected_param, "Checking if selectall_arrayref with empty slice works (using params).");
}

{
    my $expected = [ { 'name' => 'coconuts' }, { 'name' => 'not coconuts' } ];
    
    my $res;
    #eval {
        $res = $dbh->selectall_arrayref($items_sql, { Slice => { name => 1 } });
    #};
    
    is_deeply($res, $expected, "Checking if selectall_arrayref with non-empty slice works.");
}