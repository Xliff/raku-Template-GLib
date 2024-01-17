use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Template::GLib::Raw::Definitions;
use Template::GLib::Raw::Enums;

unit package Template::GLib::Raw::Symbol;

### /usr/include/template-glib-1.0/tmpl-symbol.h

sub tmpl_symbol_assign_boolean (TmplSymbol $self, gboolean $v_bool)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_double (TmplSymbol $self, gdouble $v_double)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_expr (
  TmplSymbol $self,
  TmplExpr   $expr,
  GPtrArray  $args
)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_object (TmplSymbol $self, gpointer $v_object)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_string (TmplSymbol $self, Str $v_string)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_strv (TmplSymbol $self, CArray[Str] $strv)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_value (TmplSymbol $self, GValue $value)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_assign_variant (TmplSymbol $self, GVariant $v_variant)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_get_boxed (TmplSymbol $self)
  returns Pointer
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_get_expr (TmplSymbol $self, CArray[GPtrArray] $params)
  returns TmplExpr
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_get_symbol_type (TmplSymbol $self)
  returns TmplSymbolType
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_get_value (TmplSymbol $self, GValue $value)
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_holds (TmplSymbol $self, GType $type)
  returns uint32
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_new
  returns TmplSymbol
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_ref (TmplSymbol $self)
  returns TmplSymbol
  is      native(template)
  is      export
{ * }

sub tmpl_symbol_unref (TmplSymbol $self)
  is      native(template)
  is      export
{ * }
