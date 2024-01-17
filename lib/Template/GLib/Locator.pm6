use v6.c;

use NativeCall;

use Method::Also;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GLib::Raw::Subs;
use Template::GLib::Raw::Definitions;
use Template::GLib::Raw::Locator;

use GIO::InputStream;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset TmplTemplateLocatorAncestry is export of Mu
  where TmplTemplateLocator | GObject;

class Template::GLib::Locator {
  also does GLib::Roles::Object;

  has TmplTemplateLocator $!tl is implementor;

  submethod BUILD ( :$locator ) {
    self.setTmplTemplateLocator($locator) if $locator
  }

  method setTmplTemplateLocator (TmplTemplateLocatorAncestry $_) {
    my $to-parent;

    $!tl = do {
      when TmplTemplateLocator {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(TmplTemplateLocator, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Template::GLib::Raw::Definitions::TmplTemplateLocator
    is also<TemplTemplateLocator>
  { $!tl }

  multi method new (
     $locator where * ~~ TmplTemplateLocatorAncestry,
    :$ref                                             = True
  ) {
    return unless $locator;

    my $o = self.bless( :$locator );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $locator = tmpl_template_locator_new();

    $locator ?? self.bless( :$locator ) !! Nil
  }

  method append_search_path (Str() $path) is also<append-search-path> {
    tmpl_template_locator_append_search_path($!tl, $path);
  }

  method get_search_path is also<get-search-path> {
    tmpl_template_locator_get_search_path($!tl);
  }

  method locate (
    Str()                    $path,
    CArray[Pointer[GError]]  $error = gerror,
                            :$raw   = False
  ) {
    clear_error;
    my $is = tmpl_template_locator_locate($!tl, $path, $error);
    set_error($error);
    propReturnObject($is, $raw, |GIO::InputStream.getTypePair);
  }

  method prepend_search_path (Str() $path) is also<prepend-search-path> {
    tmpl_template_locator_prepend_search_path($!tl, $path);
  }
}
