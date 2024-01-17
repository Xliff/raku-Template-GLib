use v6.c;

use NativeCall;

use Method::Also;

use Template::GLib::Raw::Types;
use Template::GLib::Raw::Template;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GIO::Roles::GFile;

our subset TmplTemplateAncestry is export of Mu
  where TmplTemplate | GObject;

class Template::GLib::Template {
  also does GLib::Roles::Object;

  has TmplTemplate $!tt is implementor;

  submethod BUILD ( :$template ) {
    self.setTmplTemplate($template) if $template
  }

  method setTmplTemplate (TmplTemplateAncestry $_) {
    my $to-parent;

    $!tt = do {
      when TmplTemplate {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(TmplTemplate, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Template::GLib::Raw::Definitions::TmplTemplate
    is also<TmplTemplate>
  { $!tt }

  multi method new ($template where * ~~ TmplTemplateAncestry , :$ref = True) {
    return unless $template;

    my $o = self.bless( :$template );
    $o.ref if $ref;
    $o;
  }
  multi method new (TmplTemplateLocator() $locator) {
    my $template = tmpl_template_new($locator);

    $template ?? self.bless( :$template ) !! Nil;
  }
  multi method new {
    samewith(TmplTemplateLocator);
  }

  multi method expand (
    GOutputStream()          $stream,
    TmplScope()              $scope,
    CArray[Pointer[GError]]  $error         = gerror,
    GCancellable()          :$cancellable   = GCancellable
  ) {
    samewith($stream, $scope, $cancellable, $error);
  }
  multi method expand (
    GOutputStream()         $stream,
    TmplScope()             $scope,
    GCancellable()          $cancellable,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    clear_error;
    my $rv = tmpl_template_expand($!tt, $stream, $scope, $cancellable, $error);
    set_error($error);
    $rv;
  }

  method expand_string (
    TmplScope()             $scope,
    CArray[Pointer[GError]] $error  = gerror
  )
    is also<expand-string>
  {
    clear_error;
    my $rv = tmpl_template_expand_string($!tt, $scope, $error);
    set_error($error);
    $rv;
  }

  method get_locator ( :$raw = False ) is also<get-locator> {
    propReturnObject(
      tmpl_template_get_locator($!tt),
      $raw,
      |Template::GLib::Locator.getTypePair
    )
  }

  method parse (
    GInputStream()          $stream,
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $rv = so tmpl_template_parse($!tt, $stream, $cancellable, $error);
    set_error($error);
    $rv;
  }

  proto method parse_file (|)
    is also<parse-file>
  { * }

  subset StrIO where Str | IO::Path;

  multi method parse_file (
                             $_,
    CArray[Pointer[GError]]  $error       = gerror,
    GCancellable()          :$cancellable = GCancellable
  ) {
    my $f = do {
      when     Str | IO::Path { GIO::File.new_for_path($_).GFile }

      default {
        X::GLib::UnknownType.new(
          message => "Do not know how to handle a {
                      .^name } in .parse_file()"
        ).throw
      }
    }
    samewith($f, $cancellable, $error);
  }
  multi method parse_file (
    GFile                   $file,
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    clear_error;
    my $rv = so tmpl_template_parse_file($!tt, $file, $cancellable, $error);
    set_error($error);
    $rv;
  }

  method parse_path (
    Str()                   $path,
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<parse-path>
  {
    clear_error;
    my $rv = so tmpl_template_parse_path($!tt, $path, $cancellable, $error);
    set_error($error);
    $rv;
  }

  method parse_resource (
    Str()                   $path,
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<parse-resource>
  {
    clear_error;
    my $rv = so tmpl_template_parse_resource($!tt, $path, $cancellable, $error);
    set_error($error);
    $rv;
  }

  method parse_string (
    Str()                   $input,
    CArray[Pointer[GError]] $error  = gerror
  )
    is also<parse-string>
  {
    clear_error;
    my $rv = so tmpl_template_parse_string($!tt, $input, $error);
    set_error($error);
    $rv;
  }

  method set_locator (TmplTemplateLocator() $locator) is also<set-locator> {
    tmpl_template_set_locator($!tt, $locator);
  }

}
