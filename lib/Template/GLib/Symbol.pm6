use v6.c;

use Method::Also;
use NativeCall;

use Template::GLib::Raw::Types;
use Template::GLib::Raw::Symbol;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

# BOXED

class Template::GLib::Symbol {
  also does GLib::Roles::Implementor;

  has TmplSymbol $!tsym is implementor;

  submethod BUILD ( :$symbol ) {
    $!tsym = $symbol if $symbol;
  }

  method Template::GLib::Raw::Definitions::TmplSymbol
    is also<TmplSymbol>
  { $!tsym }

  multi method new (TmplSymbol $symbol) {
    $symbol ?? self.bless( :$symbol ) !! Nil;
  }
  multi method new {
    my $symbol = tmpl_symbol_new();

    $symbol ?? self.bless( :$symbol ) !! Nil;
  }

  method assign_boolean (Int() $v_bool) is also<assign-boolean> {
    my gboolean $v = $v_bool;

    tmpl_symbol_assign_boolean($!tsym, $v);
  }

  method assign_double (Int() $v_double) is also<assign-double> {
    my gdouble $v = $v_double;

    tmpl_symbol_assign_double($!tsym, $v);
  }

  method assign_expr (TmplExpr() $expr, GPtrArray $args) is also<assign-expr> {
    tmpl_symbol_assign_expr($!tsym, $expr, $args);
  }

  proto method assign_object (|)
    is also<assign-object>
  { * }

  multi method assign_object ($_) {
    my $o = do {
      when GLib::Roles::Object { .GObject }
      when .^can('GObject')    { .GObject }
      when GObject             {  $_      }

      default {
        X::GLib::UnknownType.new(
          message => "Do not know how to handle a {
                      .name } in .assign_object()"
        ).throw
      }

    }
    samewith( cast(gpointer, $o) );
  }
  multi method assign_object (gpointer $v_object) {
    tmpl_symbol_assign_object($!tsym, $v_object);
  }

  method assign_string (Str() $v_string) is also<assign-string> {
    tmpl_symbol_assign_string($!tsym, $v_string);
  }

  method assign_strv (CArray[Str] $strv) is also<assign-strv> {
    tmpl_symbol_assign_strv($!tsym, $strv);
  }

  method assign_value (GValue() $value) is also<assign-value> {
    tmpl_symbol_assign_value($!tsym, $value);
  }

  method assign_variant (GVariant() $v_variant) is also<assign-variant> {
    tmpl_symbol_assign_variant($!tsym, $v_variant);
  }

  method get_boxed is also<get-boxed> {
    tmpl_symbol_get_boxed($!tsym);
  }

  method get_expr (CArray[GPtrArray] $params, :$raw = False)
    is also<get-expr>
  {
    propReturnObject(
      tmpl_symbol_get_expr($!tsym, $params),
      $raw,
      |Template::GLib::Expr.getTypePair
    );
  }

  method get_symbol_type ( :$enum = True ) is also<get-symbol-type> {
    my $tst = tmpl_symbol_get_symbol_type($!tsym);
    return $tst unless $enum;
    TmplSymbolTypeEnum($tst)
  }

  method get_value (GValue() $value) is also<get-value> {
    tmpl_symbol_get_value($!tsym, $value);
  }

  method holds (Int() $type) {
    my GType $t = $type;

    tmpl_symbol_holds($!tsym, $t);
  }

  method ref {
    tmpl_symbol_ref($!tsym);
    self;
  }

  method unref {
    tmpl_symbol_unref($!tsym);
  }

}
