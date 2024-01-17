use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use Template::GLib::Raw::Definitions;

unit package Template::GLib::Raw::Locator;

### /usr/include/template-glib-1.0/tmpl-template-template.h

sub tmpl_template_locator_append_search_path (
  TmplTemplateLocator $self,
  Str                 $path
)
  is      native(template)
  is      export
{ * }

sub tmpl_template_locator_get_search_path (TmplTemplateLocator $self)
  returns Str
  is      native(template)
  is      export
{ * }

sub tmpl_template_locator_locate (
  TmplTemplateLocator     $self,
  Str                     $path,
  CArray[Pointer[GError]] $error
)
  returns GInputStream
  is      native(template)
  is      export
{ * }

sub tmpl_template_locator_new
  returns TmplTemplateLocator
  is      native(template)
  is      export
{ * }

sub tmpl_template_locator_prepend_search_path (
  TmplTemplateLocator $self,
  Str                 $path
)
  is      native(template)
  is      export
{ * }
