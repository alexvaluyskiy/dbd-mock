# Note: this file was auto-generated by Module::Build::Compat version 0.30

require 5.008001;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'DBD::Mock',
    'VERSION_FROM' => 'lib/DBD/Mock.pm',
    'PREREQ_PM'    => {
        'DBI'             => '1.607',
        'Test::More'      => '0.47',
        'Test::Exception' => '0.31'
    },
    'INSTALLDIRS' => 'site',
    'EXE_FILES'   => [],
    'PL_FILES'    => {}
);
