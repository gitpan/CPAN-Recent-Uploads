
use strict;
use warnings;

use 5.006000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Find the distributions recently uploaded to CPAN',
  'AUTHOR' => 'Chris Williams <chris@bingosnet.co.uk>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'CPAN-Recent-Uploads',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'CPAN::Recent::Uploads',
  'PREREQ_PM' => {
    'Carp' => '0',
    'File::Spec' => '0',
    'File::Spec::Unix' => '0',
    'LWP::UserAgent' => '5.835',
    'URI' => '1.56',
    'YAML::Syck' => '1.15'
  },
  'VERSION' => '0.04',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



