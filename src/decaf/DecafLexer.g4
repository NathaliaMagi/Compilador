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
BOOLEAN : 'boolean';
CALLOUT : 'callout';
CLASS : 'class';
ELSE : 'else';
BOOLEANN : ('true'|'false');
IF : 'if';
INT : 'int';
RETURN : 'return';
VOID : 'void';
FOR : 'for';
BREAK : 'break';
CONTINUE : 'continue';


ID  : ('_'|LETRA)(LETRA|NUM|'_')*;
CHAR : '\'' (ESC|ASCII) '\'';
STRING : '\"' (ESC|ASCII|'\\"'|'\\\'')* '\"';
NUMBER : (NUM)+;
OPER : ('+'|'-'|'*'|'<'|'>'|'='|'^'|'>='|'<='|'&&'|'!='|'{'|','|';'|'}'|'['|'|'|'=='|'('|')'|']');
HEXA : '0x'(LETRA|NUM)*;


WS_ : (' '|'\n'|'\t' ) -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;

fragment ESC : '\\' ('n'|'t'|'\\'|'"');
fragment ASCII : [a-zA-Z0-9 !#-&(-/:-@^-`{-~];
fragment NUM : ('0'..'9');
fragment LETRA : ('a'..'z'|'A'..'Z');




