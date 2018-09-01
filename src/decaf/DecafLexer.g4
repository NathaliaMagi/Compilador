lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

IF : 'if';
ID  : ('_'|LETRA)(LETRA|NUM|'_')*;
CHAR : '\'' (ESC|ASCII) '\'';
STRING : '"' (ESC|ASCII)* '"';


WS_ : (' '|'\n' ) -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;

fragment ESC : '\\' ('n'|'t'|'\\'|'"');
fragment ASCII : [a-zA-Z0-9 !#-&(-/:-@^-`{-~];
fragment NUM : ('0'..'9');
fragment LETRA : ('a'..'z'|'A'..'Z');


