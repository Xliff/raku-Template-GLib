use v6;

use Template::GLib::Raw::Types;
use Template::GLib::Template;
use Template::GLib::Scope;

sub MAIN {
  my $t = Template::GLib::Template.new;

  my $file = 'simple.tmpl';
  $file = 'examples/simple.tmpl' unless $file.IO.r;

  unless $t.parse-file($file) {
    $*ERR.say: "Parse error: { $ERROR.message }";
    exit;
  }

  my $scope  = Template::GLib::Scope.new;
  my $symbol = $scope.get('title');
  $symbol.assign-string('My Little Pony');

  if $t.expand-string($scope) -> $str {
    $str.say;
  } else {
    $*ERR.say: "Expand error: { $ERROR.message }";
    exit;
  }
}
