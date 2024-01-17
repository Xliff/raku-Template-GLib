use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use Template::GLib::Raw::Definitions;

### /usr/include/template-glib-1.0/tmpl-template.h

sub tmpl_template_expand (
  TmplTemplate            $self,
  GOutputStream           $stream,
  TmplScope               $scope,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_expand_string (
  TmplTemplate            $self,
  TmplScope               $scope,
  CArray[Pointer[GError]] $error
)
  returns Str
  is      native(template)
  is      export
{ * }

sub tmpl_template_get_locator (TmplTemplate $self)
  returns TmplTemplateLocator
  is      native(template)
  is      export
{ * }

sub tmpl_template_new (TmplTemplateLocator $locator)
  returns TmplTemplate
  is      native(template)
  is      export
{ * }

sub tmpl_template_parse (
  TmplTemplate            $self,
  GInputStream            $stream,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_parse_file (
  TmplTemplate            $self,
  GFile                   $file,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_parse_path (
  TmplTemplate            $self,
  Str                     $path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_parse_resource (
  TmplTemplate            $self,
  Str                     $path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_parse_string (
  TmplTemplate            $self,
  Str                     $input,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_template_set_locator (
  TmplTemplate        $self,
  TmplTemplateLocator $locator
)
  is      native(template)
  is      export
{ * }
