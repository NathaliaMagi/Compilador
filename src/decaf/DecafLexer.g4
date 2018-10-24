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
TIPO : 'boolean'|'int';
CALLOUT : 'callout';
CLASS : 'class';
PROGRAM : 'Program';
ELSE : 'else';
IF : 'if';
RETURN : 'return';
VOID : 'void';
FOR : 'for';
BREAK : 'break';
CONTINUE : 'continue';


SOMA : '+';
SUBT : '-';
MULT : '*';
PORCE : '%';
DIVISAO : '/';
MAIORQ : '>';
MENORQ : '<';
IGUAL : '=';
QUADRA : '^';
MAIORIGUAL : '>=';
MENORIGUAL : '<=';
AND: '&&';
OU : '||';
DIFEREN : '!=';
CHAVEESQ : '{';
VIRGU : ',';
PONTVIRG : ';';
CHAVEDIR :'}';
BARRA : '|';
COLCHETEESQ : '[';
COLCHETEDIR : ']';
IGUALDADE : '==';
PARENESQ : '(';
PARENDIR : ')';
MAISUM: '+=';
MENOSUM : '-='; 
TRACO : '-';
EXCLA : '!';
TRUE : 'true';
FALSE : 'false';		

	
ID  : (LETRA)(LETRA|NUM|'_')*;
CHAR : '\'' (ESC|ASCII) '\'';
STRING : '\"' (ESC|ASCII|'\\"'|'\\\'')* '\"';
NUMBER : (NUM)+;
HEXA : '0x'('a'..'f'|[A-F]|NUM);


WS_ : (' '|'\n'|'\t' ) -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;

fragment ESC : '\\' ('n'|'t'|'\\'|'"');
fragment ASCII : [a-zA-Z0-9 !#-&(-/:-@^-`{-~];
fragment NUM : ('0'..'9');
fragment LETRA : ('a'..'z'|'A'..'Z');




