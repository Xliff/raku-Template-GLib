use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Template::GLib::Raw::Definitions;

unit package Template::GLib::Raw::Scope;

### /usr/include/template-glib-1.0/tmpl-scope.h

sub tmpl_scope_dup_string (TmplScope $self, Str $name)
  returns Str
  is      native(template)
  is      export
{ * }

sub tmpl_scope_get (TmplScope $self, Str $name)
  returns TmplSymbol
  is      native(template)
  is      export
{ * }

sub tmpl_scope_list_symbols (TmplScope $self, gboolean $recursive)
  returns Str
  is      native(template)
  is      export
{ * }

sub tmpl_scope_new
  returns TmplScope
  is      native(template)
  is      export
{ * }

sub tmpl_scope_new_with_parent (TmplScope $parent)
  returns TmplScope
  is      native(template)
  is      export
{ * }

sub tmpl_scope_peek (TmplScope $self, Str $name)
  returns TmplSymbol
  is      native(template)
  is      export
{ * }

sub tmpl_scope_ref (TmplScope $self)
  returns TmplScope
  is      native(template)
  is      export
{ * }

sub tmpl_scope_require (
  TmplScope $self,
  Str       $namespace_,
  Str       $version
)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set (
  TmplScope  $self,
  Str        $name,
  TmplSymbol $symbol
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_boolean (
  TmplScope $self,
  Str       $name,
  gboolean  $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_double (
  TmplScope $self,
  Str       $name,
  gdouble   $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_null (TmplScope $self, Str $name)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_object (
  TmplScope $self,
  Str       $name,
  gpointer  $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_resolver (
  TmplScope         $self,
  TmplScopeResolver $resolver,
  gpointer          $user_data,
                    &destroy (gpointer)
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_string (
  TmplScope $self,
  Str       $name,
  Str       $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_strv (
  TmplScope   $self,
  Str         $name,
  CArray[Str] $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_value (
  TmplScope $self,
  Str       $name,
  GValue    $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_set_variant (
  TmplScope $self,
  Str       $name,
  GVariant  $value
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_take (
  TmplScope  $self,
  Str        $name,
  TmplSymbol $symbol
)
  is      native(template)
  is      export
{ * }

sub tmpl_scope_unref (TmplScope $self)
  is      native(template)
  is      export
{ * }
